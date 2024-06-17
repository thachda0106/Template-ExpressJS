import { mysqlTable, mysqlSchema, AnyMySqlColumn, index, foreignKey, primaryKey, unique, int, varchar, tinyint, datetime, text, date, float } from "drizzle-orm/mysql-core"
import { sql } from "drizzle-orm"

export const account = mysqlTable("account", {
	id: int("id").autoincrement().notNull(),
	username: varchar("username", { length: 255 }).notNull(),
	password: varchar("password", { length: 255 }).notNull(),
	roleId: int("roleId").references(() => role.id),
	enable: tinyint("enable"),
},
(table) => {
	return {
		roleId: index("roleId").on(table.roleId),
		account_id: primaryKey({ columns: [table.id], name: "account_id"}),
		username: unique("username").on(table.username),
	}
});

export const address = mysqlTable("address", {
	id: int("id").autoincrement().notNull(),
	addressId: int("addressId"),
	street: varchar("street", { length: 255 }),
	city: varchar("city", { length: 255 }),
	state: varchar("state", { length: 255 }),
	zipCode: varchar("zipCode", { length: 10 }),
	country: varchar("country", { length: 255 }),
},
(table) => {
	return {
		address_id: primaryKey({ columns: [table.id], name: "address_id"}),
	}
});

export const attribute = mysqlTable("attribute", {
	id: int("id").autoincrement().notNull(),
	attributeId: int("attributeId"),
	categoryId: int("categoryId").references(() => categories.id),
	name: varchar("name", { length: 255 }).notNull(),
},
(table) => {
	return {
		categoryId: index("categoryId").on(table.categoryId),
		attribute_id: primaryKey({ columns: [table.id], name: "attribute_id"}),
	}
});

export const brand = mysqlTable("brand", {
	id: int("id").autoincrement().notNull(),
	name: varchar("name", { length: 255 }),
	imageUrl: varchar("imageUrl", { length: 255 }),
},
(table) => {
	return {
		brand_id: primaryKey({ columns: [table.id], name: "brand_id"}),
	}
});

export const cart = mysqlTable("cart", {
	id: int("id").autoincrement().notNull(),
	cartId: int("cartId"),
	customerId: int("customerId").references(() => customer.id),
},
(table) => {
	return {
		customerId: index("customerId").on(table.customerId),
		cart_id: primaryKey({ columns: [table.id], name: "cart_id"}),
	}
});

export const cartItem = mysqlTable("cartItem", {
	id: int("id").autoincrement().notNull(),
	itemId: int("itemId"),
	productId: int("productId").references(() => product.id),
	cartId: int("cartId").references(() => cart.id),
	quantity: int("quantity"),
},
(table) => {
	return {
		cartId: index("cartId").on(table.cartId),
		productId: index("productId").on(table.productId),
		cartItem_id: primaryKey({ columns: [table.id], name: "cartItem_id"}),
	}
});

export const categories = mysqlTable("categories", {
	id: int("id").autoincrement().notNull(),
	categoryId: int("categoryId"),
	name: varchar("name", { length: 255 }).notNull(),
},
(table) => {
	return {
		categories_id: primaryKey({ columns: [table.id], name: "categories_id"}),
	}
});

export const comment = mysqlTable("comment", {
	id: int("id").autoincrement().notNull(),
	commentId: int("commentId"),
	username: varchar("username", { length: 255 }).references(() => account.username),
	productId: int("productId").references(() => product.id),
	createdAt: datetime("createdAt", { mode: 'string'}),
	updatedAt: datetime("updatedAt", { mode: 'string'}),
	content: text("content"),
},
(table) => {
	return {
		productId: index("productId").on(table.productId),
		username: index("username").on(table.username),
		comment_id: primaryKey({ columns: [table.id], name: "comment_id"}),
	}
});

export const customer = mysqlTable("customer", {
	id: int("id").autoincrement().notNull(),
	customerId: int("customerId"),
	fullName: varchar("fullName", { length: 255 }).notNull(),
	username: varchar("username", { length: 255 }).references(() => account.username),
	email: varchar("email", { length: 255 }),
	avatar: varchar("avatar", { length: 255 }),
	phoneNumber: varchar("phoneNumber", { length: 20 }),
	shippingAddress: text("shippingAddress"),
	gender: tinyint("gender"),
},
(table) => {
	return {
		username: index("username").on(table.username),
		customer_id: primaryKey({ columns: [table.id], name: "customer_id"}),
	}
});

export const customerVoucher = mysqlTable("customerVoucher", {
	id: int("id").autoincrement().notNull(),
	customerId: int("customerId").references(() => customer.id),
	voucherId: int("voucherId").references(() => voucher.id),
	isUsed: tinyint("isUsed"),
},
(table) => {
	return {
		customerId: index("customerId").on(table.customerId),
		voucherId: index("voucherId").on(table.voucherId),
		customerVoucher_id: primaryKey({ columns: [table.id], name: "customerVoucher_id"}),
	}
});

export const employee = mysqlTable("employee", {
	id: int("id").autoincrement().notNull(),
	employeeId: int("employeeId"),
	avatar: varchar("avatar", { length: 255 }),
	email: varchar("email", { length: 255 }),
	fullName: varchar("fullName", { length: 255 }),
	gender: tinyint("gender"),
	phoneNumber: varchar("phoneNumber", { length: 20 }),
	identification: varchar("identification", { length: 50 }),
	// you can use { mode: 'date' }, if you want to have Date as type for this column
	dateOfBirth: date("dateOfBirth", { mode: 'string' }),
	username: varchar("username", { length: 255 }).references(() => account.username),
	addressId: int("addressId").references(() => address.id),
},
(table) => {
	return {
		addressId: index("addressId").on(table.addressId),
		username: index("username").on(table.username),
		employee_id: primaryKey({ columns: [table.id], name: "employee_id"}),
	}
});

export const order = mysqlTable("order", {
	id: int("id").autoincrement().notNull(),
	orderId: int("orderId"),
	customerId: int("customerId").references(() => customer.id),
	shippingAddress: text("shippingAddress"),
	phoneNumber: varchar("phoneNumber", { length: 20 }),
	fullName: varchar("fullName", { length: 255 }),
	employeeId: int("employeeId").references(() => employee.id),
	isPay: tinyint("isPay"),
	orderStatus: varchar("orderStatus", { length: 255 }),
	dateCreate: datetime("dateCreate", { mode: 'string'}),
},
(table) => {
	return {
		customerId: index("customerId").on(table.customerId),
		employeeId: index("employeeId").on(table.employeeId),
		order_id: primaryKey({ columns: [table.id], name: "order_id"}),
	}
});

export const orderDetail = mysqlTable("orderDetail", {
	id: int("id").autoincrement().notNull(),
	orderId: int("orderId").references(() => order.id),
	productId: int("productId").references(() => product.id),
	quantity: int("quantity"),
	priceOrder: float("priceOrder"),
},
(table) => {
	return {
		orderId: index("orderId").on(table.orderId),
		productId: index("productId").on(table.productId),
		orderDetail_id: primaryKey({ columns: [table.id], name: "orderDetail_id"}),
	}
});

export const orderVoucher = mysqlTable("orderVoucher", {
	id: int("id").autoincrement().notNull(),
	orderId: int("orderId").references(() => order.id),
	voucherId: int("voucherId").references(() => voucher.id),
},
(table) => {
	return {
		orderId: index("orderId").on(table.orderId),
		voucherId: index("voucherId").on(table.voucherId),
		orderVoucher_id: primaryKey({ columns: [table.id], name: "orderVoucher_id"}),
	}
});

export const product = mysqlTable("product", {
	id: int("id").autoincrement().notNull(),
	productId: int("productId"),
	name: varchar("name", { length: 255 }),
	price: float("price"),
	thumbnail: varchar("thumbnail", { length: 255 }),
	quantity: int("quantity"),
	description: text("description"),
	brandId: int("brandId").references(() => brand.id),
	origin: varchar("origin", { length: 255 }),
	guarantee: int("guarantee"),
	discountPercent: float("discountPercent"),
	dateDiscountStart: datetime("dateDiscountStart", { mode: 'string'}),
	dateDiscountEnd: datetime("dateDiscountEnd", { mode: 'string'}),
	categoryId: int("categoryId").references(() => categories.id),
},
(table) => {
	return {
		brandId: index("brandId").on(table.brandId),
		categoryId: index("categoryId").on(table.categoryId),
		product_id: primaryKey({ columns: [table.id], name: "product_id"}),
	}
});

export const productAttribute = mysqlTable("productAttribute", {
	id: int("id").autoincrement().notNull(),
	productId: int("productId").references(() => product.id),
	attributeId: int("attributeId").references(() => attribute.id),
	value: varchar("value", { length: 255 }),
},
(table) => {
	return {
		attributeId: index("attributeId").on(table.attributeId),
		productId: index("productId").on(table.productId),
		productAttribute_id: primaryKey({ columns: [table.id], name: "productAttribute_id"}),
	}
});

export const productImage = mysqlTable("productImage", {
	id: int("id").autoincrement().notNull(),
	productId: int("productId").references(() => product.id),
	imageURL: varchar("imageURL", { length: 255 }),
},
(table) => {
	return {
		productId: index("productId").on(table.productId),
		productImage_id: primaryKey({ columns: [table.id], name: "productImage_id"}),
	}
});

export const productRating = mysqlTable("productRating", {
	id: int("id").autoincrement().notNull(),
	productId: int("productId").references(() => product.id),
	orderId: int("orderId").references(() => order.id),
	customerId: int("customerId").references(() => customer.id),
	starNumber: int("starNumber"),
	content: text("content"),
	createdAt: datetime("createdAt", { mode: 'string'}),
},
(table) => {
	return {
		customerId: index("customerId").on(table.customerId),
		orderId: index("orderId").on(table.orderId),
		productId: index("productId").on(table.productId),
		productRating_id: primaryKey({ columns: [table.id], name: "productRating_id"}),
	}
});

export const reply = mysqlTable("reply", {
	id: int("id").autoincrement().notNull(),
	replyId: int("replyId"),
	commentId: int("commentId").references(() => comment.id),
	username: varchar("username", { length: 255 }).references(() => account.username),
	content: text("content"),
	createdAt: datetime("createdAt", { mode: 'string'}),
	updateAt: datetime("updateAt", { mode: 'string'}),
},
(table) => {
	return {
		commentId: index("commentId").on(table.commentId),
		username: index("username").on(table.username),
		reply_id: primaryKey({ columns: [table.id], name: "reply_id"}),
	}
});

export const role = mysqlTable("role", {
	id: int("id").autoincrement().notNull(),
	roleId: int("roleId"),
	type: varchar("type", { length: 255 }).notNull(),
},
(table) => {
	return {
		role_id: primaryKey({ columns: [table.id], name: "role_id"}),
	}
});

export const voucher = mysqlTable("voucher", {
	id: int("id").autoincrement().notNull(),
	voucherId: int("voucherId"),
	quantity: int("quantity"),
	description: text("description"),
	discountPercent: float("discountPercent"),
	productId: int("productId").references(() => product.id),
	maxDiscountValue: float("maxDiscountValue"),
	title: varchar("title", { length: 255 }),
	dateStart: datetime("dateStart", { mode: 'string'}),
	dateEnd: datetime("dateEnd", { mode: 'string'}),
},
(table) => {
	return {
		productId: index("productId").on(table.productId),
		voucher_id: primaryKey({ columns: [table.id], name: "voucher_id"}),
	}
});

export * from './relations';
