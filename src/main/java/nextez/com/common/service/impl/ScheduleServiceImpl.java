package nextez.com.common.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import nextez.com.common.service.ScheduleService;

@Service("ScheduleService")
public class ScheduleServiceImpl implements ScheduleService {

	Logger log = (Logger) LogManager.getLogger(ScheduleServiceImpl.class);
		
	/**
	 * 싱글톤 데이터 refresh
	 * 파일명 : refreshSingletonData
	 * 작성일 : 2019. 6. 5. 오후 1:45:50
	 * 작성자 : 최영철
	 * @throws Exception 
	 */
	@Override
	public void refreshSingletonData() throws Exception {
	    
        /** 20190907 승범 추가 */
        this.refreshSingletonDataJsCssVersion();
	}
	
	/**
	 * 싱글톤 데이터 > js,css 갱신버전 refresh
	 * 메소드명 : refreshSingletonDataJsCssVersion
	 * 작성일 : 2019. 9. 7. 오전 9:46:14
	 * 작성자 : 김승범
	 * @throws Exception
	 */
	@Override
	public void refreshSingletonDataJsCssVersion() throws Exception {

		
	}

}
