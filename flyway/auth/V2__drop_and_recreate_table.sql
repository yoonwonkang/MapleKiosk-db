-- origin table delete
DROP TABLE IF EXISTS kiosk_device;
DROP TABLE IF EXISTS shop_admin;
DROP TABLE IF EXISTS shop;

-- Admin Table
CREATE TABLE IF NOT EXISTS admin (
    admin_id VARCHAR(50) PRIMARY KEY,
    admin_name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    roles VARCHAR(50) NOT NULL
);

-- Shop Table
CREATE TABLE IF NOT EXISTS shop (
    shop_id VARCHAR(50) PRIMARY KEY,
    shop_name VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    api_key VARCHAR(100)
);

-- Kiosk Table
CREATE TABLE IF NOT EXISTS kiosk (
    kiosk_id VARCHAR(50) PRIMARY KEY,
    shop_id VARCHAR(50) NOT NULL,
    kiosk_name VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (shop_id) REFERENCES shop (shop_id) ON DELETE CASCADE
);