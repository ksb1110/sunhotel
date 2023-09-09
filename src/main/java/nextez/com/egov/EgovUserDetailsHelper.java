package nextez.com.egov;

import nextez.com.common.service.EgovUserSessionService;

/**
 * EgovUserDetails Helper 클래스
 *
 * @author 넥스트이지
 * @since 2016
 * @version 1.0
 * @see
 */

public class EgovUserDetailsHelper {

    static EgovUserSessionService egovUserDetailsService;

    public EgovUserSessionService getEgovUserDetailsService() {
        return egovUserDetailsService;
    }

    public void setEgovUserDetailsService(EgovUserSessionService egovUserDetailsService) {
        EgovUserDetailsHelper.egovUserDetailsService = egovUserDetailsService;
    }

    /**
     * 인증된 사용자객체를 VO형식으로 가져온다.
     * @return Object - 사용자 ValueObject
     */
    public static Object getAuthenticatedUser() {
        return egovUserDetailsService.getAuthenticatedUser();
    }

    /**
     * 최고 관리자 인증 체크
     * 메소드명 : isSuperAdminAuthenticated
     * 작성일 : 2019. 6. 27. 오후 2:44:03
     * 작성자 : 김승범
     * @return
     */
    public static Boolean isSuperAdminAuthenticated() {
        return egovUserDetailsService.isSuperAdminAuthenticated();
    }
    
    /**
     * 컨텐츠 관리자 인증 체크
     * 메소드명 : isContentsAdminAuthenticated
     * 작성일 : 2019. 6. 27. 오후 2:33:59
     * 작성자 : 김승범
     * @return
     */
    public static Boolean isContentsAdminAuthenticated() {
        return egovUserDetailsService.isContentsAdminAuthenticated();
    }
}
