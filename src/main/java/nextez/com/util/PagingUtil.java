package nextez.com.util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class PagingUtil {
	
	static final int PAGE_UNIT = 10;
	static final int PAGE_SIZE = 10;

	/**
	 * Pagination 생성
	 * 파일명 : setPaging
	 * 작성일 : 2018. 7. 30. 오후 2:48:01
	 * 작성자 : 최영철
	 * @param pageIndex		조회 할 페이지
	 * @return
	 */
	public static PaginationInfo setPaging(int pageIndex) {
		PaginationInfo paginationInfo = new PaginationInfo();
		
		int pageUnit = PAGE_UNIT;
		int pageSize = PAGE_SIZE;
		
		paginationInfo.setCurrentPageNo(pageIndex);
		paginationInfo.setRecordCountPerPage(pageUnit);
		paginationInfo.setPageSize(pageSize);
		
		return paginationInfo;
	}
	
	/**
	 * Pagination 생성
	 * 파일명 : setPaging
	 * 작성일 : 2018. 7. 30. 오후 2:54:02
	 * 작성자 : 최영철
	 * @param pageIndex		조회 할 페이지
	 * @param pageUnit		한페이지 당 표현 갯수
	 * @return
	 */
	public static PaginationInfo setPaging(int pageIndex, int pageUnit){
		PaginationInfo paginationInfo = new PaginationInfo();
		
		int pageSize = PAGE_SIZE;
		
		paginationInfo.setCurrentPageNo(pageIndex);
		paginationInfo.setRecordCountPerPage(pageUnit);
		paginationInfo.setPageSize(pageSize);
		
		return paginationInfo;
	}

}
