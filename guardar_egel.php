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
    $documentos = ['documento1', 'documento2', 'documento3'];
    $rutasArchivos = [];

    foreach ($documentos as $doc) {
        if (isset($_FILES[$doc]) && $_FILES[$doc]['error'] == 0) {
            $fileName = basename($_FILES[$doc]['name']);
            $filePath = $uploadDir . $fileName;

            if (move_uploaded_file($_FILES[$doc]['tmp_name'], $filePath)) {
                $rutasArchivos[$doc] = $filePath;
            } else {
                die("Error al mover el archivo $fileName.");
            }
        } else {
            die("Error: No se pudo subir el archivo $doc o no fue enviado.");
        }
    }

    // Validar que todos los documentos hayan sido cargados correctamente
    if (count($rutasArchivos) < count($documentos)) {
        die("Error: No se subieron todos los documentos requeridos.");
    }

    // Insertar datos en la base de datos
    $stmt = $conn->prepare("
        INSERT INTO egel (ID_ALUMNO, NOMBRE_COMPLETO, SEMESTRE, CARRERA, COMPROBANTE, INE, SOLICITUD)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ");

    $stmt->bind_param(
        "issssss",
        $matricula,
        $nombre_completo,
        $semestre,
        $carrera,
        $rutasArchivos['documento1'],
        $rutasArchivos['documento2'],
        $rutasArchivos['documento3']
    );

    if ($stmt->execute()) {
        echo "<div class='message success'>Datos y documentos subidos correctamente.</div>";
    } else {
        echo "<div class='message error'>Error al guardar los datos: " . $stmt->error . "</div>";
    }

    $stmt->close();
}

$conn->close();
?>