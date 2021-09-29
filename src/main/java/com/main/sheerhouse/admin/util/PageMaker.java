package com.main.sheerhouse.admin.util;

public class PageMaker {
	
	private PagingVO vo;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;
	
	public PagingVO getVo() {
		return vo;
	}
	
	public void setVo(PagingVO vo) {
		this.vo = vo;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData(); //총 게시글 수를 세팅할 때 calcData()메서드를 호출하여 페이징 관령 버튼 게산을 함
	}
	
	//페이징의 버튼들을 생성하는 계산식
	private void calcData() {
		
		endPage = (int)(Math.ceil(vo.getPage() / (double)displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		if(startPage <= 0) startPage = 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount / (double) vo.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * vo.getPerPageNum() < totalCount ? true : false;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	
}
