package map;

public class MapVO {
	private Integer mapNo;
	private String map_addr_front;
	private String map_addr_detail ;
	public Integer getMapNo() {
		return mapNo;
	}
	public void setMapNo(Integer mapNo) {
		this.mapNo = mapNo;
	}
	
	
	public String getMap_addr_front() {
		return map_addr_front;
	}
	public void setMap_addr_front(String map_addr_front) {
		this.map_addr_front = map_addr_front;
	}
	public String getMap_addr_detail() {
		return map_addr_detail;
	}
	public void setMap_addr_detail(String map_addr_detail) {
		this.map_addr_detail = map_addr_detail;
	}
	
	
}
/*
create table map(
mapNo number not null,
mapAddr varchar2(80) not null,
mapAddr2 varchar2(80)
);
*/