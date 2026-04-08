CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Kapan user daftar
);

CREATE TABLE user_addresses (
    id_address INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    label_alamat VARCHAR(50), -- Contoh: 'Rumah', 'Kantor', 'Kost'
    alamat_lengkap TEXT,
    is_primary BOOLEAN DEFAULT FALSE, -- Untuk alamat utama
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES users(id_user)
);

CREATE TABLE categories (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id_product VARCHAR(10) PRIMARY KEY, -- Contoh: 'P01'
    id_category INT,
    nama_produk VARCHAR(100),
    harga DECIMAL(12, 2),
    stok INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_category) REFERENCES categories(id_category)
);

CREATE TABLE carts (
    id_cart VARCHAR(10) PRIMARY KEY, -- Contoh: 'C101'
    id_user INT,
    status_cart ENUM('ACTIVE', 'CHECKOUT') DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Detik mulai belanja
    FOREIGN KEY (id_user) REFERENCES users(id_user)
);

CREATE TABLE cart_items (
    id_detail INT PRIMARY KEY AUTO_INCREMENT,
    id_cart VARCHAR(10),
    id_product VARCHAR(10),
    qty INT NOT NULL, -- <--- QTY ADA DI SINI
    status_item ENUM('PENDING', 'ORDERED') DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cart) REFERENCES carts(id_cart),
    FOREIGN KEY (id_product) REFERENCES products(id_product)
);

CREATE TABLE orders (
    id_order VARCHAR(10) PRIMARY KEY,
    id_user INT,
    id_address INT,
    total_harga DECIMAL(12, 2),
    tanggal_order DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_address) REFERENCES user_addresses(id_address)
);

CREATE TABLE payments (
    id_payment INT PRIMARY KEY AUTO_INCREMENT,
    id_order VARCHAR(10),
    status_bayar ENUM('SUCCESS', 'FAILED', 'PENDING') DEFAULT 'PENDING',
    waktu_bayar TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Detik lunas
    FOREIGN KEY (id_order) REFERENCES orders(id_order)
);

--
-- Soal 1 :
-- Tampilkan total pendapatan dan jumlah barang (qty) yang terjual selama bulan Maret 2026.
SELECT 
    SUM(o.total_harga) AS total_pendapatan,
    SUM(ci.qty) AS total_barang_terjual
FROM orders o
JOIN users u ON o.id_user = u.id_user
JOIN carts c ON u.id_user = c.id_user
JOIN cart_items ci ON c.id_cart = ci.id_cart
WHERE MONTH(o.tanggal_order) = 3
  AND YEAR(o.tanggal_order) = 2026
  AND ci.status_item = "ORDERED"

-- 
-- Soal 2 :
-- Tampilkan daftar nama produk yang pernah dibeli di bulan Maret 2026, tapi saat ini stoknya sisa kurang dari 5.
SELECT DISTINCT
    p.nama_produk,
    p.stok
FROM products p
JOIN cart_items ci ON p.id_product = ci.id_product
JOIN cart c ON ci.id_cart = c.id_cart
JOIN users u ON c.id_user = u.id_user
JOIN orders o ON o.id_user = u.id_user
WHERE MONTH(o.tanggal_order) = 3
    AND YEAR(O.tanggal_order) = 2026
    AND ci.status_item = "ORDERED"
    AND p.stok < 5