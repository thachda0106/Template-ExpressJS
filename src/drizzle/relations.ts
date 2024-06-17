import { relations } from "drizzle-orm/relations";
import { role, account, categories, attribute, customer, cart, product, cartItem, comment, customerVoucher, voucher, employee, address, order, orderDetail, orderVoucher, brand, productAttribute, productImage, productRating, reply } from "./schema";

export const accountRelations = relations(account, ({one, many}) => ({
	role: one(role, {
		fields: [account.roleId],
		references: [role.id]
	}),
	comments: many(comment),
	customers: many(customer),
	employees: many(employee),
	replies: many(reply),
}));

export const roleRelations = relations(role, ({many}) => ({
	accounts: many(account),
}));

export const attributeRelations = relations(attribute, ({one, many}) => ({
	category: one(categories, {
		fields: [attribute.categoryId],
		references: [categories.id]
	}),
	productAttributes: many(productAttribute),
}));

export const categoriesRelations = relations(categories, ({many}) => ({
	attributes: many(attribute),
	products: many(product),
}));

export const cartRelations = relations(cart, ({one, many}) => ({
	customer: one(customer, {
		fields: [cart.customerId],
		references: [customer.id]
	}),
	cartItems: many(cartItem),
}));

export const customerRelations = relations(customer, ({one, many}) => ({
	carts: many(cart),
	account: one(account, {
		fields: [customer.username],
		references: [account.username]
	}),
	customerVouchers: many(customerVoucher),
	orders: many(order),
	productRatings: many(productRating),
}));

export const cartItemRelations = relations(cartItem, ({one}) => ({
	product: one(product, {
		fields: [cartItem.productId],
		references: [product.id]
	}),
	cart: one(cart, {
		fields: [cartItem.cartId],
		references: [cart.id]
	}),
}));

export const productRelations = relations(product, ({one, many}) => ({
	cartItems: many(cartItem),
	comments: many(comment),
	orderDetails: many(orderDetail),
	category: one(categories, {
		fields: [product.categoryId],
		references: [categories.id]
	}),
	brand: one(brand, {
		fields: [product.brandId],
		references: [brand.id]
	}),
	productAttributes: many(productAttribute),
	productImages: many(productImage),
	productRatings: many(productRating),
	vouchers: many(voucher),
}));

export const commentRelations = relations(comment, ({one, many}) => ({
	account: one(account, {
		fields: [comment.username],
		references: [account.username]
	}),
	product: one(product, {
		fields: [comment.productId],
		references: [product.id]
	}),
	replies: many(reply),
}));

export const customerVoucherRelations = relations(customerVoucher, ({one}) => ({
	customer: one(customer, {
		fields: [customerVoucher.customerId],
		references: [customer.id]
	}),
	voucher: one(voucher, {
		fields: [customerVoucher.voucherId],
		references: [voucher.id]
	}),
}));

export const voucherRelations = relations(voucher, ({one, many}) => ({
	customerVouchers: many(customerVoucher),
	orderVouchers: many(orderVoucher),
	product: one(product, {
		fields: [voucher.productId],
		references: [product.id]
	}),
}));

export const employeeRelations = relations(employee, ({one, many}) => ({
	account: one(account, {
		fields: [employee.username],
		references: [account.username]
	}),
	address: one(address, {
		fields: [employee.addressId],
		references: [address.id]
	}),
	orders: many(order),
}));

export const addressRelations = relations(address, ({many}) => ({
	employees: many(employee),
}));

export const orderRelations = relations(order, ({one, many}) => ({
	customer: one(customer, {
		fields: [order.customerId],
		references: [customer.id]
	}),
	employee: one(employee, {
		fields: [order.employeeId],
		references: [employee.id]
	}),
	orderDetails: many(orderDetail),
	orderVouchers: many(orderVoucher),
	productRatings: many(productRating),
}));

export const orderDetailRelations = relations(orderDetail, ({one}) => ({
	order: one(order, {
		fields: [orderDetail.orderId],
		references: [order.id]
	}),
	product: one(product, {
		fields: [orderDetail.productId],
		references: [product.id]
	}),
}));

export const orderVoucherRelations = relations(orderVoucher, ({one}) => ({
	order: one(order, {
		fields: [orderVoucher.orderId],
		references: [order.id]
	}),
	voucher: one(voucher, {
		fields: [orderVoucher.voucherId],
		references: [voucher.id]
	}),
}));

export const brandRelations = relations(brand, ({many}) => ({
	products: many(product),
}));

export const productAttributeRelations = relations(productAttribute, ({one}) => ({
	product: one(product, {
		fields: [productAttribute.productId],
		references: [product.id]
	}),
	attribute: one(attribute, {
		fields: [productAttribute.attributeId],
		references: [attribute.id]
	}),
}));

export const productImageRelations = relations(productImage, ({one}) => ({
	product: one(product, {
		fields: [productImage.productId],
		references: [product.id]
	}),
}));

export const productRatingRelations = relations(productRating, ({one}) => ({
	product: one(product, {
		fields: [productRating.productId],
		references: [product.id]
	}),
	customer: one(customer, {
		fields: [productRating.customerId],
		references: [customer.id]
	}),
	order: one(order, {
		fields: [productRating.orderId],
		references: [order.id]
	}),
}));

export const replyRelations = relations(reply, ({one}) => ({
	comment: one(comment, {
		fields: [reply.commentId],
		references: [comment.id]
	}),
	account: one(account, {
		fields: [reply.username],
		references: [account.username]
	}),
}));