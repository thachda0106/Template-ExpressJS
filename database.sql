-- Tạo bảng address
CREATE TABLE address (
    id INT PRIMARY KEY AUTO_INCREMENT,
    addressId INT,
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zipCode VARCHAR(10),
    country VARCHAR(255)
);

-- Tạo bảng role
CREATE TABLE role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    roleId INT,
    type VARCHAR(255) NOT NULL
);

-- Tạo bảng categories
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoryId INT,
    name VARCHAR(255) NOT NULL
);

-- Tạo bảng brand
CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    imageUrl VARCHAR(255)
);

-- Tạo bảng account
CREATE TABLE account (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    roleId INT,
    enable TINYINT,
    FOREIGN KEY (roleId) REFERENCES role(id)
);

-- Tạo bảng customer
CREATE TABLE customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customerId INT,
    fullName VARCHAR(255) NOT NULL,
    username VARCHAR(255),
    email VARCHAR(255),
    avatar VARCHAR(255),
    phoneNumber VARCHAR(20),
    shippingAddress TEXT,
    gender TINYINT,
    FOREIGN KEY (username) REFERENCES account(username)
);

-- Tạo bảng employee
CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeId INT,
    avatar VARCHAR(255),
    email VARCHAR(255),
    fullName VARCHAR(255),
    gender TINYINT,
    phoneNumber VARCHAR(20),
    identification VARCHAR(50),
    dateOfBirth DATE,
    username VARCHAR(255),
    addressId INT,
    FOREIGN KEY (username) REFERENCES account(username),
    FOREIGN KEY (addressId) REFERENCES address(id)
);

-- Tạo bảng cart
CREATE TABLE cart (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cartId INT,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES customer(id)
);

-- Tạo bảng product
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productId INT,
    name VARCHAR(255),
    price FLOAT,
    thumbnail VARCHAR(255),
    quantity INT,
    description TEXT,
    brandId INT,
    origin VARCHAR(255),
    guarantee INT,
    discountPercent FLOAT,
    dateDiscountStart DATETIME,
    dateDiscountEnd DATETIME,
    categoryId INT,
    FOREIGN KEY (categoryId) REFERENCES categories(id),
    FOREIGN KEY (brandId) REFERENCES brand(id)
);

-- Tạo bảng voucher
CREATE TABLE voucher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    voucherId INT,
    quantity INT,
    description TEXT,
    discountPercent FLOAT,
    productId INT,
    maxDiscountValue FLOAT,
    title VARCHAR(255),
    dateStart DATETIME,
    dateEnd DATETIME,
    FOREIGN KEY (productId) REFERENCES product(id)
);

-- Tạo bảng order
CREATE TABLE `order` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    customerId INT,
    shippingAddress TEXT,
    phoneNumber VARCHAR(20),
    fullName VARCHAR(255),
    employeeId INT,
    isPay TINYINT,
    orderStatus VARCHAR(255),
    dateCreate DATETIME,
    FOREIGN KEY (customerId) REFERENCES customer(id),
    FOREIGN KEY (employeeId) REFERENCES employee(id)
);

-- Tạo bảng attribute
CREATE TABLE attribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    attributeId INT,
    categoryId INT,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES categories(id)
);

-- Tạo bảng comment
CREATE TABLE comment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    commentId INT,
    username VARCHAR(255),
    productId INT,
    createdAt DATETIME,
    updatedAt DATETIME,
    content TEXT,
    FOREIGN KEY (username) REFERENCES account(username),
    FOREIGN KEY (productId) REFERENCES product(id)
);

-- Tạo bảng cartItem
CREATE TABLE cartItem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    itemId INT,
    productId INT,
    cartId INT,
    quantity INT,
    FOREIGN KEY (productId) REFERENCES product(id),
    FOREIGN KEY (cartId) REFERENCES cart(id)
);

-- Tạo bảng orderDetail
CREATE TABLE orderDetail (
    id INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    productId INT,
    quantity INT,
    priceOrder FLOAT,
    FOREIGN KEY (orderId) REFERENCES `order`(id),
    FOREIGN KEY (productId) REFERENCES product(id)
);

-- Tạo bảng orderVoucher
CREATE TABLE orderVoucher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    voucherId INT,
    FOREIGN KEY (orderId) REFERENCES `order`(id),
    FOREIGN KEY (voucherId) REFERENCES voucher(id)
);

-- Tạo bảng customerVoucher
CREATE TABLE customerVoucher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customerId INT,
    voucherId INT,
    isUsed TINYINT,
    FOREIGN KEY (customerId) REFERENCES customer(id),
    FOREIGN KEY (voucherId) REFERENCES voucher(id)
);

-- Tạo bảng productAttribute
CREATE TABLE productAttribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productId INT,
    attributeId INT,
    value VARCHAR(255),
    FOREIGN KEY (productId) REFERENCES product(id),
    FOREIGN KEY (attributeId) REFERENCES attribute(id)
);

-- Tạo bảng productImage
CREATE TABLE productImage (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productId INT,
    imageURL VARCHAR(255),
    FOREIGN KEY (productId) REFERENCES product(id)
);

-- Tạo bảng productRating
CREATE TABLE productRating (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productId INT,
    orderId INT,
    customerId INT,
    starNumber INT,
    content TEXT,
    createdAt DATETIME,
    FOREIGN KEY (productId) REFERENCES product(id),
    FOREIGN KEY (customerId) REFERENCES customer(id),
    FOREIGN KEY (orderId) REFERENCES `order`(id)
);

-- Tạo bảng reply
CREATE TABLE reply (
    id INT PRIMARY KEY AUTO_INCREMENT,
    replyId INT,
    commentId INT,
    username VARCHAR(255),
    content TEXT,
    createdAt DATETIME,
    updateAt DATETIME,
    FOREIGN KEY (commentId) REFERENCES comment(id),
    FOREIGN KEY (username) REFERENCES account(username)
);
