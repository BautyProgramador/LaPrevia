<?php
$serverName = "localhost"; // o el nombre del servidor, por ejemplo: DESKTOP\SQLEXPRESS
$connectionOptions = array(
    "Database" => "la_previa",
    "Uid" => "tu_usuario_sql",     // si usás autenticación SQL
    "PWD" => "tu_contraseña_sql",  // si usás autenticación SQL
    // si usás autenticación de Windows, usá "Authentication" => SQLSRV_AUTH_WINDOWS
);

// Conexión
$conn = sqlsrv_connect($serverName, $connectionOptions);

if ($conn === false) {
    die(print_r(sqlsrv_errors(), true));
}

// Obtener datos del formulario
$nombre = $_POST["name"];
$email = $_POST["email"];

// Insertar
$sql = "INSERT INTO registros (nombre, email) VALUES (?, ?)";
$params = array($nombre, $email);

$stmt = sqlsrv_query($conn, $sql, $params);

if ($stmt === false) {
    echo "error";
    die(print_r(sqlsrv_errors(), true));
} else {
    echo "ok";
}

sqlsrv_close($conn);
?>
