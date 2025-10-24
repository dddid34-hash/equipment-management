<?php
session_start();

function checkLogin() {
    if (!isset(\['user_id'])) {
        header(\"Location: login.php\");
        exit();
    }
}

function showAlert() {
    if (isset(\['alert'])) {
        \ = \['alert']['type'] ?? 'info';
        \ = \['alert']['message'] ?? '';
        echo '<div class=\"alert alert-' . htmlspecialchars(\) . ' alert-dismissible fade show\" role=\"alert\">';
        echo htmlspecialchars(\);
        echo '<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"></button>';
        echo '</div>';
        unset(\['alert']);
    }
}

function setAlert(\, \ = 'success') {
    \['alert'] = ['message' => \, 'type' => \];
}
?>
