package com.main.sheerhouse.admin.domain;

import java.sql.Date;

public class NoticeVO {
	int notice_num;
	String title;
	String contetn;
	Date regist_date;
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContetn() {
		return contetn;
	}
	public void setContetn(String contetn) {
		this.contetn = contetn;
	}
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", title=" + title + ", contetn=" + contetn + ", regist_date="
				+ regist_date + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
