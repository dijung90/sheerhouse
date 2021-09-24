package com.main.sheerhouse.host.domain;

import java.sql.Timestamp;

public class HostVO {

	private long host_seq;
	private String email;
	private String name;
	private String host_info;
	private Timestamp regdate;
	private int certificateNum;
	private String certificateTitle;
	
	public HostVO() {}

	public HostVO(long host_seq, String email, String name, String host_info, Timestamp regdate, int certificateNum,
			String certificateTitle) {
		super();
		this.host_seq = host_seq;
		this.email = email;
		this.name = name;
		this.host_info = host_info;
		this.regdate = regdate;
		this.certificateNum = certificateNum;
		this.certificateTitle = certificateTitle;
	}

	public long getHost_seq() {
		return host_seq;
	}

	public void setHost_seq(long host_seq) {
		this.host_seq = host_seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHost_info() {
		return host_info;
	}

	public void setHost_info(String host_info) {
		this.host_info = host_info;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getCertificateNum() {
		return certificateNum;
	}

	public void setCertificateNum(int certificateNum) {
		this.certificateNum = certificateNum;
	}

	public String getCertificateTitle() {
		return certificateTitle;
	}

	public void setCertificateTitle(String certificateTitle) {
		this.certificateTitle = certificateTitle;
	}

	@Override
	public String toString() {
		return "HostVO [host_seq=" + host_seq + ", email=" + email + ", name=" + name + ", host_info=" + host_info
				+ ", regdate=" + regdate + ", certificateNum=" + certificateNum + ", certificateTitle="
				+ certificateTitle + "]";
	}
	
	
}
