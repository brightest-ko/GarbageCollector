package customer;
import java.sql.Date;

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
		this.trash_type = trash_type;
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
	public String getHelperID() {
		return helperID;
	}
	public void setHelperID(String helperID) {
		this.helperID = helperID;
	}
	public Date getCustomer_apply_day() {
		return customer_apply_day;
	}
	public void setCustomer_apply_day(Date customer_apply_day) {
		this.customer_apply_day = customer_apply_day;
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
	public CustomerApplyVO(){}
	public CustomerApplyVO(String customer_phone, String card_num)
	 {
		this.customer_phone = customer_phone;
		this.card_num = card_num;
		
	 }
	public CustomerApplyVO(String customer_phone, String customer_addr_first,
			String customer_addr_second, String customer_addr_third, Integer bag_num, Integer trash_type,
			Date wanted_time, Integer price, String card_num, String helperID
			) {
	
		this.customer_phone = customer_phone;
		this.customer_addr_first = customer_addr_first;
		this.customer_addr_second = customer_addr_second;
		this.customer_addr_third = customer_addr_third;
		this.bag_num = bag_num;
		this.trash_type = trash_type;
		this.wanted_time = wanted_time;
		this.price = price;
		this.card_num = card_num;
		this.helperID = helperID;

	}
	@Override
	public String toString() {
		return "CustomerApplyVO [serialNo=" + serialNo + ", customer_phone=" + customer_phone + ", customer_addr_first="
				+ customer_addr_first + ", customer_addr_second=" + customer_addr_second + ", customer_addr_third="
				+ customer_addr_third + ", bag_num=" + bag_num + ", trash_type=" + trash_type + ", wanted_time="
				+ wanted_time + ", price=" + price + ", card_num=" + card_num + ", helperID=" + helperID
				+ ", customer_apply_day=" + customer_apply_day + ", certify_status=" + certify_status
				+ ", review_status=" + review_status + "]";
	}
	
	
}

/*

	serialNo number not null, // 怨좉컼�떊泥� 踰덊샇 - PK
	customer_phone varchar2(11) not null, // 怨좉컼 �쟾�솕踰덊샇 - FK
	customer_addr_front varchar2(40) not null , // 蹂몄씤二쇱냼 (�긽�꽭二쇱냼�젣�쇅)
	customer_addr_detail varchar2(45) not null, // �긽�꽭二쇱냼
	bag_num number not null, // 遊됲닾媛��닔
	trash_type number not null, // 遺꾨━�닔嫄곗쥌瑜�
//�삤�뒛�궇吏� 泥댄겕�빐�꽌 �빐�떦�릺�뒗 醫낅쪟  radio or selectbox
//�샎�빀:�삤�뒛�궇吏쒖븘�땶寃�,�꽎�씤寃� 
	wanted_time date not null, // �썝�븯�뒗�닔嫄곗떆媛꾨�
	
	// �궇吏� �꽑�깮 �븷吏� 留먯� �젙�븯�옄 

	price number not null, // 媛�寃�
//�떦�씪 �닔嫄� 臾쇳뭹(�겢由고븯�슦�뒪濡� 諛곗텧 媛��뒫�븳 臾쇳뭹) :  1500
//�떦�씪 �닔嫄� �씠�쇅 臾쇳뭹 & �샎�빀 : 2500

	card_num varchar2(20) not null // 移대뱶踰덊샇
	helperID varchar2(25), // ���뻾ID
customer_apply_day date not null 


*/
