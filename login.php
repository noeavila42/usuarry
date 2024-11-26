<?php
// Conexión a la base de datos
$servername = "127.0.0.1";
$username = "root"; // Cambia esto si tu usuario es diferente
$password = ""; // Cambia esto si tienes una contraseña para tu base de datos
$dbname = "beca";

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("La conexión falló: " . $conn->connect_error);
}

// Obtener los datos del formulario
$email = $_POST['username'];
$password_input = $_POST['password'];

// Consulta para validar usuario
$sql = "SELECT * FROM usuario WHERE EMAIL = ? AND CONTRASENIA = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $email, $password_input);
$stmt->execute();
$result = $stmt->get_result();

// Verificar si los datos son correctos
if ($result->num_rows > 0) {
    // Redirigir a bienvenida.html si el inicio de sesión es exitoso
    header("Location: inicio.html");
    exit();
} else {
    // Mostrar mensaje de error y redirigir a la página de inicio de sesión
    echo "<script>

        window.location.href = 'error.html';
    </script>";
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>