package customer;
/*
 * create table customer(
	customer_phone varchar2(11) not null, 
	customer_addr_first varchar2(40) not null ,
	customer_addr_second varchar2(45) not null,
	customer_addr_third varchar2(45) not null
);
 * 
 * 
 * */
public class CustomerVO {
	private String customer_phone;
	private String customer_addr_first;
	private String customer_addr_second;
	private String customer_addr_third;
	
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_addr_first() {
		return customer_addr_first;
	}
	public void setCustomer_addr_first(String customer_addr_first) {
		this.customer_addr_first = customer_addr_first;
	}
	public String getCustomer_addr_second() {
		return customer_addr_second;
	}
	public void setCustomer_addr_second(String customer_addr_second) {
		this.customer_addr_second = customer_addr_second;
	}
	public String getCustomer_addr_third() {
		return customer_addr_third;
	}
	public void setCustomer_addr_third(String customer_addr_third) {
		this.customer_addr_third = customer_addr_third;
	}
	@Override
	public String toString() {
		return "CustomerVO [customer_phone=" + customer_phone + ", customer_addr_first=" + customer_addr_first
				+ ", customer_addr_second=" + customer_addr_second + ", customer_addr_third=" + customer_addr_third
				+ "]";
	}
		
	
}