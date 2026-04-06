CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Kapan user daftar
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
    id_order VARCHAR(10) PRIMARY KEY, -- Contoh: 'ORD-99'
    id_user INT,
    total_harga DECIMAL(12, 2),
    tanggal_order DATE, -- <--- TAHUN & BULAN DIAMBIL DARI SINI
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES users(id_user)
);

CREATE TABLE payments (
    id_payment INT PRIMARY KEY AUTO_INCREMENT,
    id_order VARCHAR(10),
    status_bayar ENUM('SUCCESS', 'FAILED', 'PENDING') DEFAULT 'PENDING',
    waktu_bayar TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Detik lunas
    FOREIGN KEY (id_order) REFERENCES orders(id_order)
);