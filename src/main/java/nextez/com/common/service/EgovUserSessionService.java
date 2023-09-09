package nextez.com.common.service;

public interface EgovUserSessionService {

	Object getAuthenticatedUser();

    /**
     *  최고 관리자 인증 체크
     * 메소드명 : isSuperAdminAuthenticated
     * 작성일 : 2019. 6. 27. 오후 2:33:52
     * 작성자 : 김승범
     * @return
     */
    Boolean isSuperAdminAuthenticated();
    
    /**
     * 컨텐츠 관리자 인증 체크
     * 메소드명 : isContentsAdminAuthenticated
     * 작성일 : 2019. 6. 27. 오후 2:33:59
     * 작성자 : 김승범
     * @return
     */
    Boolean isContentsAdminAuthenticated();

}
