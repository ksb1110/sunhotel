package nextez.user.form.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nextez.com.vo.user.FormSVO;
import nextez.com.vo.user.FormVO;
import nextez.user.form.service.FormService;

/**
 * 관리자 > 시스템관리 > 관리자
 * 파일명 : AdminServiceImpl.java
 * 작성일 : 2019. 7. 2. 오후 3:47:10
 * 작성자 : 김승범
 */
@Service("FormService")
public class FormServiceImpl implements FormService {

	@Autowired
	private FormMapper formMapper;
	
	/**
	 * 관리자 > 시스템관리 > 관리자 > 정보
	 * 메소드명 : selectAdmin
	 * 작성일 : 2019. 7. 2. 오후 3:45:01
	 * 작성자 : 김승범
	 * @param adminSVO
	 * @return
	 */
	@Override
	public FormVO selectDate(FormSVO formSVO) {
		
		return formMapper.selectDate(formSVO);
	}
}
