<?php
// Conexión a la base de datos
$conn = new mysqli("localhost", "root", "", "beca");

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si se recibieron los datos y archivos
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Datos del formulario
    $matricula = intval($_POST['matricula']);
    $nombre_completo = $_POST['nombre_completo'];
    $semestre = intval($_POST['semestre']);
    $carrera = $_POST['carrera'];

    // Directorio para guardar los archivos
    $uploadDir = 'uploads/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    // Manejo de archivos
    $documentos = [
        'documento1' => 'SOLICITUD',
        'documento2' => 'NOMBRAMIENTO',
        'documento3' => 'ACTA_NACIMIENTO',
        'documento4' => 'INE'
    ];
    $rutasArchivos = [];

    foreach ($documentos as $key => $campoBD) {
        if (isset($_FILES[$key]) && $_FILES[$key]['error'] == 0) {
            $fileName = basename($_FILES[$key]['name']);
            $filePath = $uploadDir . $fileName;

            if (move_uploaded_file($_FILES[$key]['tmp_name'], $filePath)) {
                $rutasArchivos[$campoBD] = $filePath;
            } else {
                die("Error al mover el archivo $fileName.");
            }
        } else {
            die("Error: No se pudo subir el archivo $key o no fue enviado.");
        }
    }

    // Validar que todos los documentos hayan sido cargados correctamente
    if (count($rutasArchivos) < count($documentos)) {
        die("Error: No se subieron todos los documentos requeridos.");
    }

    // Insertar datos en la base de datos
    $stmt = $conn->prepare("
        INSERT INTO trabajadores 
        (ID_TRABA_HIJO, NOMBRE_COMPLETO, SEMESTRE, CARRERA, SOLICITUD, NOMBRAMIENTO, ACTA_NACIMIENTO, INE)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ");

    $stmt->bind_param(
        "isssssss",
        $matricula,
        $nombre_completo,
        $semestre,
        $carrera,
        $rutasArchivos['SOLICITUD'],
        $rutasArchivos['NOMBRAMIENTO'],
        $rutasArchivos['ACTA_NACIMIENTO'],
        $rutasArchivos['INE']
    );

    if ($stmt->execute()) {
        echo "<div class='message success'>Datos y documentos subidos correctamente.</div>";
        header("Refresh: 3; URL=inicio.html"); // Redirige después de 3 segundos
        exit();
    } else {
        echo "<div class='message error'>Error al guardar los datos: " . $stmt->error . "</div>";
    }

    $stmt->close();
}

$conn->close();
?>