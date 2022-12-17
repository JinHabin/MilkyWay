package dao.bean;

public class dao {
	private int bbsID;
	private String name;
	private String addr;
	private String number;
	private String location;
	private String link;
	private String type;
	private int bbsAvailable;
	
	
	public int getBbsID() {
		return bbsID;
	}
	public String getName() {
		return name;
	}
	public String getAddr() {
		return addr;
	}
	public String getNumber() {
		return number;
	}
	public String getLocation() {
		return location;
	}
	public String getLink() {
		return link;
	}
	public String getType() {
		return type;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	
	public void setBbsID(int bbsID) {
		this.bbsID=bbsID;
	}
	public void setName(String name) {
		this.name=name;
	}
	public void setAddr(String addr) {
		this.addr=addr;
	}
	public void setNumber(String number) {
		this.number=number;
	}
	public void setLocation(String location) {
		this.location=location;
	}
	public void setLink(String link) {
		this.link=link;
	}
	public void setType(String type) {
		this.type=type;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable=bbsAvailable;
	}
}
