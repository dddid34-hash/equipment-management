-- SQLite Database for AAD System
-- Generated: October 24, 2025
-- Compatible with PHP + PDO SQLite

PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;

-- Table: equipment_types
CREATE TABLE equipment_types (
    type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type_name TEXT NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now'))
);

-- Table: users
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    full_name TEXT NOT NULL,
    email TEXT,
    phone TEXT,
    role TEXT CHECK(role IN ('admin','staff','user')) DEFAULT 'user',
    created_at TEXT DEFAULT (datetime('now'))
);

-- Table: equipments
CREATE TABLE equipments (
    equipment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    equipment_code TEXT NOT NULL UNIQUE,
    equipment_name TEXT NOT NULL,
    type_id INTEGER,
    brand TEXT,
    model TEXT,
    quantity INTEGER DEFAULT 1,
    available_quantity INTEGER DEFAULT 1,
    status TEXT CHECK(status IN ('available','borrowed','maintenance','damaged')) DEFAULT 'available',
    description TEXT,
    image_url TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (type_id) REFERENCES equipment_types(type_id) ON DELETE SET NULL
);

-- Table: borrowing
CREATE TABLE borrowing (
    borrow_id INTEGER PRIMARY KEY AUTOINCREMENT,
    equipment_id INTEGER,
    user_id INTEGER,
    borrow_date TEXT NOT NULL,
    expected_return_date TEXT NOT NULL,
    actual_return_date TEXT,
    return_request_date TEXT,
    quantity INTEGER DEFAULT 1,
    status TEXT CHECK(status IN ('borrowed','pending_return','returned','overdue')) DEFAULT 'borrowed',
    notes TEXT,
    return_notes TEXT,
    condition_on_return TEXT CHECK(condition_on_return IN ('good','damaged','need_repair')) DEFAULT 'good',
    approved_by INTEGER,
    checked_by INTEGER,
    created_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (equipment_id) REFERENCES equipments(equipment_id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (approved_by) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (checked_by) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Table: materials
CREATE TABLE materials (
    material_id INTEGER PRIMARY KEY AUTOINCREMENT,
    material_code TEXT NOT NULL UNIQUE,
    material_name TEXT NOT NULL,
    type_id INTEGER,
    unit TEXT,
    quantity INTEGER DEFAULT 0,
    min_quantity INTEGER DEFAULT 10,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now')),
    image_url TEXT NOT NULL DEFAULT '',
    FOREIGN KEY (type_id) REFERENCES equipment_types(type_id) ON DELETE SET NULL
);

-- Table: material_requisition
CREATE TABLE material_requisition (
    requisition_id INTEGER PRIMARY KEY AUTOINCREMENT,
    material_id INTEGER,
    user_id INTEGER,
    quantity INTEGER NOT NULL,
    requisition_date TEXT NOT NULL,
    status TEXT CHECK(status IN ('pending','approved','rejected','completed')) DEFAULT 'pending',
    purpose TEXT,
    approved_by INTEGER,
    notes TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (material_id) REFERENCES materials(material_id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (approved_by) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Insert Data: equipment_types
INSERT INTO equipment_types (type_id, type_name, description, created_at) VALUES
(1, 'ทุกประเภท', 'อุปกรณ์ทั่วไป', '2025-10-17 04:20:06'),
(2, 'Computer Notebook', 'เครื่องคอมพิวเตอร์โน้ตบุ๊ค', '2025-10-17 04:20:06'),
(3, 'Robotic Arm', 'แขนกลหุ่นยนต์', '2025-10-17 04:20:06'),
(4, 'Mobile Robot', 'หุ่นยนต์เคลื่อนที่', '2025-10-17 04:20:06'),
(5, 'AI System', 'ระบบปัญญาประดิษฐ์', '2025-10-17 04:20:06'),
(6, 'Electronics', 'อุปกรณ์อิเล็กทรอนิกส์', '2025-10-17 04:20:06'),
(7, 'Display', 'อุปกรณ์แสดงผล', '2025-10-17 04:20:06'),
(8, 'Audio', 'อุปกรณ์เสียง', '2025-10-17 04:20:06'),
(9, 'Storage', 'อุปกรณ์จัดเก็บข้อมูล', '2025-10-17 04:20:06'),
(10, 'Cable', 'สายเคเบิล', '2025-10-17 04:20:06'),
(11, 'Power', 'อุปกรณ์ไฟฟ้า', '2025-10-17 04:20:06'),
(12, 'Network', 'อุปกรณ์เครือข่าย', '2025-10-17 04:20:06'),
(13, 'IOT', 'อุปกรณ์ IOT', '2025-10-17 04:20:06'),
(14, 'Camera', 'กล้อง', '2025-10-17 04:20:06');

-- Insert Data: users
INSERT INTO users (user_id, username, password, full_name, email, phone, role, created_at) VALUES
(1, 'admin', 'admin', 'ผู้ดูแลระบบ', 'admin@system.com', NULL, 'admin', '2025-10-17 04:20:06'),
(2, 'staff', 'staff', 'เจ้าหน้าที่', 'staff@system.com', NULL, 'staff', '2025-10-17 04:20:06'),
(3, 'user1', 'user1', 'นายภาณุวัฒน์  โออ่อน', 'panuwataoon@gmail.com', '091266626', 'user', '2025-10-17 04:47:53'),
(5, 'wuttichai', '', 'kk', 'kk@gmail.com', '0123456789', 'user', '2025-10-17 06:13:18'),
(8, 'wuttichai1', '$2y$10$MpKKCJQ2EZy95JyA8mXtDOP1XRNRRpE56JjOvRFQRvXRd9Y8lGO0G', '่าา', 'N@gmail.com', '01234654123', 'user', '2025-10-17 06:17:27');

-- Insert Data: equipments (ตัวอย่างบางส่วน)
INSERT INTO equipments (equipment_id, equipment_code, equipment_name, type_id, brand, model, quantity, available_quantity, status, description, image_url, created_at, updated_at) VALUES
(1, 'NB001', 'Computer Notebook', 2, '', '', 5, 4, 'maintenance', '', 'uploads/equipments/68f1f832a8003.jpg', '2025-10-17 04:20:06', '2025-10-17 08:02:58'),
(2, 'ARM001', 'Robotic Arm', 3, 'Hiwonder', 'AiArm', 2, 2, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 05:51:07'),
(20, 'NF101', 'กล้วย', 5, 'adf', 'dsfaf', 5, 4, 'available', '', 'uploads/equipments/68f1fa7fbc1f7.jpg', '2025-10-17 06:39:00', '2025-10-17 08:12:47');

-- Insert Data: borrowing (ตัวอย่าง)
INSERT INTO borrowing (borrow_id, equipment_id, user_id, borrow_date, expected_return_date, actual_return_date, return_request_date, quantity, status, notes, return_notes, condition_on_return, approved_by, checked_by, created_at) VALUES
(1, 1, 3, '2025-10-17 06:58:12', '2025-10-19 23:59:59', '2025-10-17 07:00:54', '2025-10-17 06:58:19', 1, 'returned', '', '', 'good', NULL, 2, '2025-10-17 04:58:12'),
(4, 1, 1, '2025-10-17 07:12:46', '2025-10-18 23:59:59', NULL, NULL, 1, 'borrowed', '', NULL, 'good', NULL, NULL, '2025-10-17 05:12:46');

-- Insert Data: materials
INSERT INTO materials (material_id, material_code, material_name, type_id, unit, quantity, min_quantity, description, created_at, updated_at, image_url) VALUES
(1, 'N001', 'กล้วย1', 5, 'ชิ้น', 29, 1, '0', '2025-10-17 06:18:40', '2025-10-17 07:42:00', 'uploads/materials/68f1f34846016.jpg');

-- Insert Data: material_requisition
INSERT INTO material_requisition (requisition_id, material_id, user_id, quantity, requisition_date, status, purpose, approved_by, notes, created_at) VALUES
(1, 1, 1, 2, '2025-10-17 08:19:26', 'rejected', 'กิน', 1, NULL, '2025-10-17 06:19:26'),
(2, 1, 1, 1, '2025-10-17 08:26:50', 'approved', 'eat', 1, NULL, '2025-10-17 06:26:50');