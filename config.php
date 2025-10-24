<?php
// config.php - สำหรับ Render + SQLite
$db_file = __DIR__ . '/database/aad.db';

try {
    $conn = new PDO("sqlite:$db_file");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // สร้างฐานข้อมูลอัตโนมัติถ้ายังไม่มี
    if (!file_exists($db_file)) {
        $sql_file = __DIR__ . '/equipment_management_sqlite.sql';
        if (file_exists($sql_file)) {
            $sql = file_get_contents($sql_file);
            $conn->exec($sql);
        }
    }
} catch(PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>