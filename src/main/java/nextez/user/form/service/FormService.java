package nextez.user.form.service;

import nextez.com.vo.user.FormSVO;
import nextez.com.vo.user.FormVO;

/**
 * 관리자 > 시스템관리 > 관리자
 * 파일명 : AdminService.java
 * 작성일 : 2019. 7. 2. 오후 3:40:15
 * 작성자 : 김승범
 */
public interface FormService {

	/**
	 * 디비접속 테스트
	 * 메소드명 : selectDate
	 * 작성일 : 2023. 9. 9. 오후 10:07:44
	 * 작성자 : 김승범
	 * @param formSVO
	 * @return
	 */
	FormVO selectDate(FormSVO formSVO);
}
