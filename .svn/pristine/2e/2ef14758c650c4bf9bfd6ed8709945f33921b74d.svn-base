package xyz.itwill.enums;

public enum EOrderStatus {
	BEFORE_DEPOSIT(0, "입금전"),
	DELIVERY_PREPARE(1, "배송준비중"),
	DELIVERY_PENDING(2, "배송보류"),
	DELIVERY_WAIT(3, "배송대기"),
	DELIVERY_ING(4, "배송중"),
	DELIVERY_COMPLETE(5, "배송완료"),
	ORDER_CANCLE(6, "주문취소"),
	ORDER_EXCHANGE(7, "교환"),
	ORDER_RETURN(8, "반품"),
	ORDER_REFUND(9, "환불")
	;

	private final int number;
	private final String str;
	
	private EOrderStatus(int number, String str) {this.number = number; this.str = str;}
	
	public static int size() {return values().length;}
	public String getString() {return str;}
	public int getNumber() {return number;}
}
