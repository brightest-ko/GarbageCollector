package customer;
/*
 * create table customer(
	customer_phone varchar2(11) not null, 
	customer_addr_front varchar2(40) not null ,
	customer_addr_detail varchar2(45) not null
);
 * 
 * 
 * */
public class CustomerVO {
	private String customer_phone;
	private String customer_addr_front;
	private String customer_addr_detail;
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_addr_front() {
		return customer_addr_front;
	}
	public void setCustomer_addr_front(String customer_addr_front) {
		this.customer_addr_front = customer_addr_front;
	}
	public String getCustomer_addr_detail() {
		return customer_addr_detail;
	}
	public void setCustomer_addr_detail(String customer_addr_detail) {
		this.customer_addr_detail = customer_addr_detail;
	}
	
	
	
}