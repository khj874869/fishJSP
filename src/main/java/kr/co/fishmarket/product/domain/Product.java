package kr.co.fishmarket.product.domain;

public class Product {
	private int cartId;
	private String userId;
	private int ProductId;
	private int amount;
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Product [장바구니번호=" + cartId + ", 회원아이디=" + userId + ", 상품아이디=" + ProductId + ", 총 수량=" + amount
				+ "]";
	}
	
}
