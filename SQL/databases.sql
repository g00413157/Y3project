-- Users table for login/register
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User account-related data
CREATE TABLE UserAccounts (
    user_id INT PRIMARY KEY,
    wishlist TEXT,
    order_history TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Products table for shop
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    team VARCHAR(255) NOT NULL,
    year DATE,
    season VARCHAR(255),
    description TEXT,
    leaguetype ENUM('Mens','Women') DEFAULT 'Mens',
    league VARCHAR(255),
    size ENUM('XS','S','M','L','XL','XXL','3XL','4XL') DEFAULT 'M',
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    image_url VARCHAR(255)
);

-- Cart system
CREATE TABLE Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

-- Orders and order confirmation
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

-- Contact form
CREATE TABLE ContactUs (
    contact_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
