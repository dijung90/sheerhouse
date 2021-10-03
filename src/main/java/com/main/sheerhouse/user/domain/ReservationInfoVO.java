package com.main.sheerhouse.user.domain;

import java.util.Date;

public class ReservationInfoVO {
	private int home_seq;
	private int act_seq;
	private String email;
	private int totalprice;
	private String stayingDate;
	private String res_status;
	private Date res_date;
	private String cancel_reason;
	private int apply_num;
	private String title;
	private String price;
	private String host_info;
	private String info;
	private String address;
	private int headcount;
	private String rule;
	private String url;
	

	@Override
	public String toString() {
		return "ReservationInfoVO [home_seq=" + home_seq + ", act_seq=" + act_seq + ", email=" + email + ", totalprice="
				+ totalprice + ", stayingDate=" + stayingDate + ", res_status=" + res_status + ", res_date=" + res_date
				+ ", cancel_reason=" + cancel_reason + ", apply_num=" + apply_num + ", title=" + title + ", price="
				+ price + ", host_info=" + host_info + ", info=" + info + ", address=" + address + ", headcount="
				+ headcount + ", rule=" + rule + ", url=" + url + "]";
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getHost_info() {
		return host_info;
	}
	public void setHost_info(String host_info) {
		this.host_info = host_info;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getHome_seq() {
		return home_seq;
	}
	public void setHome_seq(int home_seq) {
		this.home_seq = home_seq;
	}
	public int getAct_seq() {
		return act_seq;
	}
	public void setAct_seq(int act_seq) {
		this.act_seq = act_seq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getStayingDate() {
		return stayingDate;
	}
	public void setStayingDate(String stayingDate) {
		this.stayingDate = stayingDate;
	}
	public String getRes_status() {
		return res_status;
	}
	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public String getCancel_reason() {
		return cancel_reason;
	}
	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}
	public int getApply_num() {
		return apply_num;
	}
	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}
}
