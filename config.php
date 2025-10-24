<?php
\ = __DIR__ . '/database/aad.db';
try {
    \ = new PDO(\"sqlite:\\");
    \->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    if (!file_exists(\)) {
        \ = __DIR__ . '/equipment_management_sqlite.sql';
        if (file_exists(\)) {
            \ = file_get_contents(\);
            \->exec(\);
        }
    }
} catch(PDOException \) {
    die(\"Database connection failed: \" . \->getMessage());
}
?>
