package certify;
import java.util.*;

/* 
create table certify(
	serialNo number(8) not null,
	helperID varchar2(25) not null,
	details varchar2(300) not null,
	housePlace varchar2(80) not null,
	certify_photo_ofn varchar2(100) not null,
	certify_photo_fsn varchar2(100) not null,
	certify_day date not null
);
 */
public class CertifyVO {
	private Integer serialNo = null;
	private String helperID = null;
	private String details = null;
	private String housePlace = null;
	private String certify_photo_ofn  = null;
	private String certify_photo_fsn  = null;
	private Integer certify_status  = 0;
	private Date certify_day = null;
	
	public Integer getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}
	public String getHelperID() {
		return helperID;
	}
	public void setHelperID(String helperID) {
		this.helperID = helperID;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getHousePlace() {
		return housePlace;
	}
	public void setHousePlace(String housePlace) {
		this.housePlace = housePlace;
	}
	public String getCertify_photo_ofn() {
		return certify_photo_ofn;
	}
	public void setCertify_photo_ofn(String certify_photo_ofn) {
		this.certify_photo_ofn = certify_photo_ofn;
	}
	public String getCertify_photo_fsn() {
		return certify_photo_fsn;
	}
	public void setCertify_photo_fsn(String certify_photo_fsn) {
		this.certify_photo_fsn = certify_photo_fsn;
	}
	public Integer getCertify_status() {
		return certify_status;
	}
	public void setCertify_status(Integer certify_status) {
		this.certify_status = certify_status;
	}
	public Date getCertify_day() {
		return certify_day;
	}
	public void setCertify_day(Date certify_day) {
		this.certify_day = certify_day;
	}

	
}
