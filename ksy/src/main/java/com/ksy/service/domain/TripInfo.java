package com.ksy.service.domain;

//==>회원정보를 모델링(추상화/캡슐화)한 Bean
public class TripInfo {

	/// Field
	private String url;
	private int id;
	private String info;
	private String info1;
	private String info2;
	private String info3;
	private String info4;
	private String info5;
	private String conName;
	private String conIso;
	
	
	
	public String getConName() {
		return conName;
	}
	public void setConName(String conName) {
		this.conName = conName;
	}
	public String getConIso() {
		return conIso;
	}
	public void setConIso(String conIso) {
		this.conIso = conIso;
	}

	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
		
		//info 정보가 가,나,다,라, 형태로 되어있어서 split함
		if(info != null && info.length() !=0) {
			String[] arrayInfo = info.split(",");
			info1 = "#"+arrayInfo[0].trim();
			info2 = "#"+arrayInfo[1].trim();
			info3 = "#"+arrayInfo[2].trim();
			info4 = "#"+arrayInfo[3].trim();
			info5 = "#"+arrayInfo[4].trim();
		}
	}
	
	//////////////사진정보1
	public String getInfo1() {
		return info1;
	}
	public void setInfo1(String info) {
		this.info1 = info;
	}

	////////////////사진정보2
	public String getInfo2() {
		return info2;
	}
	public void setInfo2(String info) {
		this.info2 = info;
	}
	
	/////////////////사진정보3
	public String getInfo3() {
		return info3;
	}
	public void setInfo3(String info) {
		this.info3 = info;
	}
	
	///////////////사진정보4
	public String getInfo4() {
		return info4;
	}
	public void setInfo4(String info4) {
		this.info4 = info4;
	}
	
	///////////////사진정보5
	public String getInfo5() {
		return info5;
	}

	public void setInfo5(String info5) {
		this.info5 = info5;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "TripInfo [url=" + url + ", id=" + id + ", info=" + info + ", info1=" + info1 + ", info2=" + info2
				+ ", info3=" + info3 + ", info4=" + info4 + ", info5=" + info5 + "]";
	}

	
}// end class