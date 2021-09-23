package com.main.sheerhouse.user.domain;

import java.util.Date;

public class ResultVO {
	private int home_seq;
	private int host_seq;
	private String title;
	private int price;
	private String info;
	private String rule;
	private String host_info;
	private String type;
	private String status;
	private String address;
	private String unused_date;
	private String url;
	private Date regdate;
	@Override
	public String toString() {
		return "ResultVO [home_seq=" + home_seq + ", host_seq=" + host_seq + ", title=" + title + ", price=" + price
				+ ", info=" + info + ", rule=" + rule + ", host_info=" + host_info + ", type=" + type + ", status="
				+ status + ", address=" + address + ", unused_date=" + unused_date + ", url=" + url + ", regdate="
				+ regdate + "]";
	}
	public int getHome_seq() {
		return home_seq;
	}
	public void setHome_seq(int home_seq) {
		this.home_seq = home_seq;
	}
	public int getHost_seq() {
		return host_seq;
	}
	public void setHost_seq(int host_seq) {
		this.host_seq = host_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public String getHost_info() {
		return host_info;
	}
	public void setHost_info(String host_info) {
		this.host_info = host_info;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUnused_date() {
		return unused_date;
	}
	public void setUnused_date(String unused_date) {
		this.unused_date = unused_date;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}



