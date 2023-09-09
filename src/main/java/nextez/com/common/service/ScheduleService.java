package nextez.com.common.service;

public interface ScheduleService {
	
	/**
	 * 싱글톤 데이터 refresh
	 * 파일명 : refreshSingletonData
	 * 작성일 : 2019. 6. 5. 오후 1:45:50
	 * 작성자 : 최영철
	 * @throws Exception 
	 */
	public void refreshSingletonData() throws Exception;
	
	/**
	 * 싱글톤 데이터 > js,css 갱신버전 refresh
	 * 메소드명 : refreshSingletonDataJsCssVersion
	 * 작성일 : 2019. 9. 7. 오전 9:46:14
	 * 작성자 : 김승범
	 * @throws Exception
	 */
	public void refreshSingletonDataJsCssVersion() throws Exception;
}
