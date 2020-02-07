package com.ksy.service.domain;

import java.util.List;

//==>ȸ�������� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean
public class Click {

	/// Field
	private String url;
	private int id;
	private String info;
	private String info1;
	private String info2;
	private String info3;
	private String info4;
	private String info5;
	
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
		
		//info ������ ��,��,��,��, ���·� �Ǿ��־ split��
		if(info != null && info.length() !=0) {
			String[] arrayInfo = info.split(",");
			info1 = "#"+arrayInfo[0];
			info2 = "#"+arrayInfo[1];
			info3 = "#"+arrayInfo[2];
			info4 = "#"+arrayInfo[3];
			info5 = "#"+arrayInfo[4];
		}
	}
	
	//////////////��������1
	public String getInfo1() {
		return info1;
	}
	public void setInfo1(String info) {
		this.info1 = info;
	}

	////////////////��������2
	public String getInfo2() {
		return info2;
	}
	public void setInfo2(String info) {
		this.info2 = info;
	}
	
	/////////////////��������3
	public String getInfo3() {
		return info3;
	}
	public void setInfo3(String info) {
		this.info3 = info;
	}
	
	///////////////��������4
	public String getInfo4() {
		return info4;
	}
	public void setInfo4(String info4) {
		this.info4 = info4;
	}
	
	///////////////��������5
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
		return "Click [url=" + url + ", id=" + id + ", info=" + info + ", info1=" + info1 + ", info2=" + info2
				+ ", info3=" + info3 + ", info4=" + info4 + ", info5=" + info5 + "]";
	}

	
}// end class