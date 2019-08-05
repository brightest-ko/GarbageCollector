package customer;
import java.util.Date;
/*
 * 
 * create table customer_apply(
serialNo number not null;// 고객신청 번호 - PK
	customer_phone varchar2(11) not null;  // 고객 전화번호 - FK
	customer_addr_first varchar2(40) not null;
	customer_addr_second varchar2(45) not null;
	customer_addr_third varchar2(45) not null;
	bag_num number not null;// 봉투갯수
	trash_type  number  not null;//분리수거종류
	wanted_time date not null; //수거예정시간
	price number ;//가격
	card_num varchar2(20);//카드번호
	helperID  varchar2(25);//대행자ID
	customer_apply_day date  ;//작성일자
	certify_status number(1);//인증상태
	review_status number(1) ;//리뷰상태
); 

 * 
 * 
 * 
 * */
public class CustomerApplyVO {
	private Integer serialNo;
	private String customer_phone;
	private String customer_addr_first;
	private String customer_addr_second;
	private String customer_addr_third;
	private Integer bag_num;
	private Integer trash_type;
	private Date wanted_time;
	private Integer price;
	private String card_num;
	private String helperID;
	private Date customer_apply_day;
	private Integer certify_status;
	private Integer review_status;
	public Integer getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_Addr_first() {
		return customer_addr_first;
	}
	public void setCustomer_Addr_first(String customer_addr_first) {
		this.customer_addr_first = customer_addr_first;
	}
	public String getHelperID() {
		return helperID;
	}
	public void setHelperID(String helperID) {
		this.helperID = helperID;
	}
	public String getCustomer_Addr_second() {
		return customer_addr_second;
	}
	public void setCustomer_Addr_second(String customer_addr_second) {
		this.customer_addr_second = customer_addr_second;
	}
	public Integer getBag_num() {
		return bag_num;
	}
	public void setBag_num(Integer bag_num) {
		this.bag_num = bag_num;
	}
	public Integer getTrash_type() {
		return trash_type;
	}
	public void setTrash_type(Integer trash_type) {
		this.trash_type =trash_type;
	}
	public Date getWanted_time() {
		return wanted_time;
	}
	public void setWanted_time(Date wanted_time) {
		
		this.wanted_time = wanted_time;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	
	public String getCustomer_Addr_third() {
		return customer_addr_third;
	}
	public void setCustomer_Addr_third(String customer_addr_third) {
		this.customer_addr_third = customer_addr_third;
	}
	
	public Integer getCertify_status() {
		return certify_status;
	}
	public void setCertify_status(Integer certify_status) {
		this.certify_status = certify_status;
	}
	public Integer getReview_status() {
		return review_status;
	}
	public void setReview_status(Integer review_status) {
		this.review_status = review_status;
	}

	
	//int vs integer
	@Override
	public String toString() {
		return "customer_applyVO [serialNo=" + serialNo + ", customer_phone=" + customer_phone + ", customer_addr_first="
				+ customer_addr_first + ", helperID=" + helperID + ", customer_addr_second=" + customer_addr_second + ", bag_num=" + bag_num
				+ ", trash_type=" + trash_type + ", wanted_time=" + wanted_time  
				+ ", price=" + price + ", card_num=" + card_num + ", customer_addr_third="+customer_addr_third+"]";
	}
	
	
}
