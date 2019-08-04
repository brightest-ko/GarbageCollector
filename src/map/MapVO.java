package map;

public class MapVO {
	private Integer mapNo;
	private String mapAddr;
	private String mapAddr2;
	public Integer getMapNo() {
		return mapNo;
	}
	public void setMapNo(Integer mapNo) {
		this.mapNo = mapNo;
	}
	public String getMapAddr() {
		return mapAddr;
	}
	public void setMapAddr(String mapAddr) {
		this.mapAddr = mapAddr;
	}
	public String getMapAddr2() {
		return mapAddr2;
	}
	public void setMapAddr2(String mapAddr2) {
		this.mapAddr2 = mapAddr2;
	}
	
	
	
}
/*
create table map(
mapNo number not null,
mapAddr varchar2(80) not null,
mapAddr2 varchar2(80)
);
*/