package com.main.sheerhouse.user.domain;

import java.util.Date;

public class CommentVO {
	private int home_seq;
	private int activity_seq;
	private String name;
	private String content;
	private Date regDate;
	
	@Override
	public String toString() {
		return "CommentVO [home_seq=" + home_seq + ", activity_seq=" + activity_seq + ", name=" + name + ", content="
				+ content + ", regDate=" + regDate + "]";
	}
	public int getHome_seq() {
		return home_seq;
	}
	public void setHome_seq(int home_seq) {
		this.home_seq = home_seq;
	}
	public int getActivity_seq() {
		return activity_seq;
	}
	public void setActivity_seq(int activity_seq) {
		this.activity_seq = activity_seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
