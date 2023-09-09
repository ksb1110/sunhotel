package nextez.com.common.service.impl;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import nextez.com.common.service.EgovUserSessionService;
import nextez.com.vo.SessionUserVO;

/**
 * 
 * @author 공통서비스 개발팀 서준식
 * @since 2011. 6. 25.
 * @version 1.0
 * @see
 *
 * <pre>
 * 개정이력(Modification Information) 
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011. 8. 12.    서준식        최초생성
 *  
 *  </pre>
 */

public class EgovUserSessionServiceImpl extends EgovAbstractServiceImpl implements EgovUserSessionService {

	public Object getAuthenticatedUser() {
		if (RequestContextHolder.getRequestAttributes() == null) {
			return null;
		}

		return RequestContextHolder.getRequestAttributes().getAttribute("sessionUserVO", RequestAttributes.SCOPE_SESSION);

	}
	
	
	
	/**
     *  최고 관리자 인증 체크
     * 메소드명 : isSuperAdminAuthenticated
     * 작성일 : 2019. 6. 27. 오후 2:33:52
     * 작성자 : 김승범
     * @return
     */
    @Override
    public Boolean isSuperAdminAuthenticated() {
    	
    	// 세션데이터가 없으면
        if (RequestContextHolder.getRequestAttributes() == null) {        	
            return false;
        } 
        // 세션데이터가 있으면
        else {
        	// 세션데이터에 sessionUserVO 가 없으면
            if (RequestContextHolder.getRequestAttributes().getAttribute("sessionUserVO", RequestAttributes.SCOPE_SESSION) == null) {
            	return false;
            }            
            // 세션데이터에 sessionUserVO 가 있으면
            else {            	
            	// sessionUserVO 값을 가져온다.
                SessionUserVO sessionUserVO = (SessionUserVO) RequestContextHolder.getRequestAttributes().getAttribute("sessionUserVO", RequestAttributes.SCOPE_SESSION);
                
                if("1".equals(sessionUserVO.getAdminLevel())){                	                	
                    return true;
                } 
                else {
                    return false;
                }
            }
        }
    }
	

    /**
     * 컨텐츠 관리자 인증 체크
     * 메소드명 : isContentsAdminAuthenticated
     * 작성일 : 2019. 6. 27. 오후 2:33:59
     * 작성자 : 김승범
     * @return
     */
    @Override
    public Boolean isContentsAdminAuthenticated() {
    	// 세션데이터가 없으면
        if (RequestContextHolder.getRequestAttributes() == null) {        	
            return false;
        } 
        // 세션데이터가 있으면
        else {
        	// 세션데이터에 sessionUserVO 가 없으면
            if (RequestContextHolder.getRequestAttributes().getAttribute("sessionUserVO", RequestAttributes.SCOPE_SESSION) == null) {
            	return false;
            }            
            // 세션데이터에 sessionUserVO 가 있으면
            else {            	
            	return false;
            }
        }
    }

}
