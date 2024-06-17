-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
CREATE TABLE `account` (
	`id` int AUTO_INCREMENT NOT NULL,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`roleId` int,
	`enable` tinyint,
	CONSTRAINT `account_id` PRIMARY KEY(`id`),
	CONSTRAINT `username` UNIQUE(`username`)
);
--> statement-breakpoint
CREATE TABLE `address` (
	`id` int AUTO_INCREMENT NOT NULL,
	`addressId` int,
	`street` varchar(255),
	`city` varchar(255),
	`state` varchar(255),
	`zipCode` varchar(10),
	`country` varchar(255),
	CONSTRAINT `address_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `attribute` (
	`id` int AUTO_INCREMENT NOT NULL,
	`attributeId` int,
	`categoryId` int,
	`name` varchar(255) NOT NULL,
	CONSTRAINT `attribute_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `brand` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255),
	`imageUrl` varchar(255),
	CONSTRAINT `brand_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `cart` (
	`id` int AUTO_INCREMENT NOT NULL,
	`cartId` int,
	`customerId` int,
	CONSTRAINT `cart_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `cartItem` (
	`id` int AUTO_INCREMENT NOT NULL,
	`itemId` int,
	`productId` int,
	`cartId` int,
	`quantity` int,
	CONSTRAINT `cartItem_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `categories` (
	`id` int AUTO_INCREMENT NOT NULL,
	`categoryId` int,
	`name` varchar(255) NOT NULL,
	CONSTRAINT `categories_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `comment` (
	`id` int AUTO_INCREMENT NOT NULL,
	`commentId` int,
	`username` varchar(255),
	`productId` int,
	`createdAt` datetime,
	`updatedAt` datetime,
	`content` text,
	CONSTRAINT `comment_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `customer` (
	`id` int AUTO_INCREMENT NOT NULL,
	`customerId` int,
	`fullName` varchar(255) NOT NULL,
	`username` varchar(255),
	`email` varchar(255),
	`avatar` varchar(255),
	`phoneNumber` varchar(20),
	`shippingAddress` text,
	`gender` tinyint,
	CONSTRAINT `customer_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `customerVoucher` (
	`id` int AUTO_INCREMENT NOT NULL,
	`customerId` int,
	`voucherId` int,
	`isUsed` tinyint,
	CONSTRAINT `customerVoucher_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `employee` (
	`id` int AUTO_INCREMENT NOT NULL,
	`employeeId` int,
	`avatar` varchar(255),
	`email` varchar(255),
	`fullName` varchar(255),
	`gender` tinyint,
	`phoneNumber` varchar(20),
	`identification` varchar(50),
	`dateOfBirth` date,
	`username` varchar(255),
	`addressId` int,
	CONSTRAINT `employee_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `order` (
	`id` int AUTO_INCREMENT NOT NULL,
	`orderId` int,
	`customerId` int,
	`shippingAddress` text,
	`phoneNumber` varchar(20),
	`fullName` varchar(255),
	`employeeId` int,
	`isPay` tinyint,
	`orderStatus` varchar(255),
	`dateCreate` datetime,
	CONSTRAINT `order_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `orderDetail` (
	`id` int AUTO_INCREMENT NOT NULL,
	`orderId` int,
	`productId` int,
	`quantity` int,
	`priceOrder` float,
	CONSTRAINT `orderDetail_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `orderVoucher` (
	`id` int AUTO_INCREMENT NOT NULL,
	`orderId` int,
	`voucherId` int,
	CONSTRAINT `orderVoucher_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `product` (
	`id` int AUTO_INCREMENT NOT NULL,
	`productId` int,
	`name` varchar(255),
	`price` float,
	`thumbnail` varchar(255),
	`quantity` int,
	`description` text,
	`brandId` int,
	`origin` varchar(255),
	`guarantee` int,
	`discountPercent` float,
	`dateDiscountStart` datetime,
	`dateDiscountEnd` datetime,
	`categoryId` int,
	CONSTRAINT `product_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `productAttribute` (
	`id` int AUTO_INCREMENT NOT NULL,
	`productId` int,
	`attributeId` int,
	`value` varchar(255),
	CONSTRAINT `productAttribute_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `productImage` (
	`id` int AUTO_INCREMENT NOT NULL,
	`productId` int,
	`imageURL` varchar(255),
	CONSTRAINT `productImage_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `productRating` (
	`id` int AUTO_INCREMENT NOT NULL,
	`productId` int,
	`orderId` int,
	`customerId` int,
	`starNumber` int,
	`content` text,
	`createdAt` datetime,
	CONSTRAINT `productRating_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `reply` (
	`id` int AUTO_INCREMENT NOT NULL,
	`replyId` int,
	`commentId` int,
	`username` varchar(255),
	`content` text,
	`createdAt` datetime,
	`updateAt` datetime,
	CONSTRAINT `reply_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `role` (
	`id` int AUTO_INCREMENT NOT NULL,
	`roleId` int,
	`type` varchar(255) NOT NULL,
	CONSTRAINT `role_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `voucher` (
	`id` int AUTO_INCREMENT NOT NULL,
	`voucherId` int,
	`quantity` int,
	`description` text,
	`discountPercent` float,
	`productId` int,
	`maxDiscountValue` float,
	`title` varchar(255),
	`dateStart` datetime,
	`dateEnd` datetime,
	CONSTRAINT `voucher_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `account` ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `attribute` ADD CONSTRAINT `attribute_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `cart` ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `cartItem` ADD CONSTRAINT `cartItem_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `cartItem` ADD CONSTRAINT `cartItem_ibfk_2` FOREIGN KEY (`cartId`) REFERENCES `cart`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `comment` ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account`(`username`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `comment` ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `customer` ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account`(`username`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `customerVoucher` ADD CONSTRAINT `customerVoucher_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `customerVoucher` ADD CONSTRAINT `customerVoucher_ibfk_2` FOREIGN KEY (`voucherId`) REFERENCES `voucher`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `employee` ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account`(`username`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `employee` ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `order` ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `order` ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`employeeId`) REFERENCES `employee`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `orderDetail` ADD CONSTRAINT `orderDetail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `orderDetail` ADD CONSTRAINT `orderDetail_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `orderVoucher` ADD CONSTRAINT `orderVoucher_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `orderVoucher` ADD CONSTRAINT `orderVoucher_ibfk_2` FOREIGN KEY (`voucherId`) REFERENCES `voucher`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product` ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product` ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brand`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `productAttribute` ADD CONSTRAINT `productAttribute_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `productAttribute` ADD CONSTRAINT `productAttribute_ibfk_2` FOREIGN KEY (`attributeId`) REFERENCES `attribute`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `productImage` ADD CONSTRAINT `productImage_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `productRating` ADD CONSTRAINT `productRating_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `productRating` ADD CONSTRAINT `productRating_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `productRating` ADD CONSTRAINT `productRating_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `order`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `reply` ADD CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `comment`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `reply` ADD CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`username`) REFERENCES `account`(`username`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `voucher` ADD CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX `roleId` ON `account` (`roleId`);--> statement-breakpoint
CREATE INDEX `categoryId` ON `attribute` (`categoryId`);--> statement-breakpoint
CREATE INDEX `customerId` ON `cart` (`customerId`);--> statement-breakpoint
CREATE INDEX `cartId` ON `cartItem` (`cartId`);--> statement-breakpoint
CREATE INDEX `productId` ON `cartItem` (`productId`);--> statement-breakpoint
CREATE INDEX `productId` ON `comment` (`productId`);--> statement-breakpoint
CREATE INDEX `username` ON `comment` (`username`);--> statement-breakpoint
CREATE INDEX `username` ON `customer` (`username`);--> statement-breakpoint
CREATE INDEX `customerId` ON `customerVoucher` (`customerId`);--> statement-breakpoint
CREATE INDEX `voucherId` ON `customerVoucher` (`voucherId`);--> statement-breakpoint
CREATE INDEX `addressId` ON `employee` (`addressId`);--> statement-breakpoint
CREATE INDEX `username` ON `employee` (`username`);--> statement-breakpoint
CREATE INDEX `customerId` ON `order` (`customerId`);--> statement-breakpoint
CREATE INDEX `employeeId` ON `order` (`employeeId`);--> statement-breakpoint
CREATE INDEX `orderId` ON `orderDetail` (`orderId`);--> statement-breakpoint
CREATE INDEX `productId` ON `orderDetail` (`productId`);--> statement-breakpoint
CREATE INDEX `orderId` ON `orderVoucher` (`orderId`);--> statement-breakpoint
CREATE INDEX `voucherId` ON `orderVoucher` (`voucherId`);--> statement-breakpoint
CREATE INDEX `brandId` ON `product` (`brandId`);--> statement-breakpoint
CREATE INDEX `categoryId` ON `product` (`categoryId`);--> statement-breakpoint
CREATE INDEX `attributeId` ON `productAttribute` (`attributeId`);--> statement-breakpoint
CREATE INDEX `productId` ON `productAttribute` (`productId`);--> statement-breakpoint
CREATE INDEX `productId` ON `productImage` (`productId`);--> statement-breakpoint
CREATE INDEX `customerId` ON `productRating` (`customerId`);--> statement-breakpoint
CREATE INDEX `orderId` ON `productRating` (`orderId`);--> statement-breakpoint
CREATE INDEX `productId` ON `productRating` (`productId`);--> statement-breakpoint
CREATE INDEX `commentId` ON `reply` (`commentId`);--> statement-breakpoint
CREATE INDEX `username` ON `reply` (`username`);--> statement-breakpoint
CREATE INDEX `productId` ON `voucher` (`productId`);
*/