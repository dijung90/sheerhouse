package com.main.sheerhouse.host.domain;

import java.sql.Timestamp;

public class HomeVO {
	private int homeSeq;
	private int hostSeq;
	private String title;
	private String type;
	private String status;
	private String address;
	private String unusedDate;
	private String peakSeason;
	private String offSeason;
	private int peakPricePer;
	private int offPricePer;
	private int weekendPrice;
	private int price;
	private int headcount;
	private String info;
	private String rule;
	private String url;
	private String hostInfo;
	private Timestamp regdate;
	private Timestamp updataDate;
	private int minDateCount;
	private int maxDateCount;
	private int longPricePer;
	private int cnt;
	
	public HomeVO() {}

	public HomeVO(int homeSeq, int hostSeq, String title, String type, String status, String address, String unusedDate,
			String peakSeason, String offSeason, int peakPricePer, int offPricePer, int weekendPrice, int price,
			int headcount, String info, String rule, String url, String hostInfo, Timestamp regdate,
			Timestamp updataDate, int minDateCount, int maxDateCount, int longPricePer, int cnt) {
		super();
		this.homeSeq = homeSeq;
		this.hostSeq = hostSeq;
		this.title = title;
		this.type = type;
		this.status = status;
		this.address = address;
		this.unusedDate = unusedDate;
		this.peakSeason = peakSeason;
		this.offSeason = offSeason;
		this.peakPricePer = peakPricePer;
		this.offPricePer = offPricePer;
		this.weekendPrice = weekendPrice;
		this.price = price;
		this.headcount = headcount;
		this.info = info;
		this.rule = rule;
		this.url = url;
		this.hostInfo = hostInfo;
		this.regdate = regdate;
		this.updataDate = updataDate;
		this.minDateCount = minDateCount;
		this.maxDateCount = maxDateCount;
		this.longPricePer = longPricePer;
		this.cnt = cnt;
	}

	public int getHomeSeq() {
		return homeSeq;
	}

	public void setHomeSeq(int homeSeq) {
		this.homeSeq = homeSeq;
	}

	public int getHostSeq() {
		return hostSeq;
	}

	public void setHostSeq(int hostSeq) {
		this.hostSeq = hostSeq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getUnusedDate() {
		return unusedDate;
	}

	public void setUnusedDate(String unusedDate) {
		this.unusedDate = unusedDate;
	}

	public String getPeakSeason() {
		return peakSeason;
	}

	public void setPeakSeason(String peakSeason) {
		this.peakSeason = peakSeason;
	}

	public String getOffSeason() {
		return offSeason;
	}

	public void setOffSeason(String offSeason) {
		this.offSeason = offSeason;
	}

	public int getPeakPricePer() {
		return peakPricePer;
	}

	public void setPeakPricePer(int peakPricePer) {
		this.peakPricePer = peakPricePer;
	}

	public int getOffPricePer() {
		return offPricePer;
	}

	public void setOffPricePer(int offPricePer) {
		this.offPricePer = offPricePer;
	}

	public int getWeekendPrice() {
		return weekendPrice;
	}

	public void setWeekendPrice(int weekendPrice) {
		this.weekendPrice = weekendPrice;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getHostInfo() {
		return hostInfo;
	}

	public void setHostInfo(String hostInfo) {
		this.hostInfo = hostInfo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getUpdataDate() {
		return updataDate;
	}

	public void setUpdataDate(Timestamp updataDate) {
		this.updataDate = updataDate;
	}

	public int getMinDateCount() {
		return minDateCount;
	}

	public void setMinDateCount(int minDateCount) {
		this.minDateCount = minDateCount;
	}

	public int getMaxDateCount() {
		return maxDateCount;
	}

	public void setMaxDateCount(int maxDateCount) {
		this.maxDateCount = maxDateCount;
	}

	public int getLongPricePer() {
		return longPricePer;
	}

	public void setLongPricePer(int longPricePer) {
		this.longPricePer = longPricePer;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "HomeVO [homeSeq=" + homeSeq + ", hostSeq=" + hostSeq + ", title=" + title + ", type=" + type
				+ ", status=" + status + ", address=" + address + ", unusedDate=" + unusedDate + ", peakSeason="
				+ peakSeason + ", offSeason=" + offSeason + ", peakPricePer=" + peakPricePer + ", offPricePer="
				+ offPricePer + ", weekendPrice=" + weekendPrice + ", price=" + price + ", headcount=" + headcount
				+ ", info=" + info + ", rule=" + rule + ", url=" + url + ", hostInfo=" + hostInfo + ", regdate="
				+ regdate + ", updataDate=" + updataDate + ", minDateCount=" + minDateCount + ", maxDateCount="
				+ maxDateCount + ", longPricePer=" + longPricePer + ", cnt=" + cnt + "]";
	}
	
}
