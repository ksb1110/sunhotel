package nextez.com.util;

import nextez.com.egov.EgovProperties;

public class Constant {

	public static final String FLAG_Y = "Y";
	public static final String FLAG_N = "N";
	
    public static final String ADMIN_AUTH_GRP_ID = "ADMINISTRATOR";         // 관리자 권한 그룹

    public static final int PW_RESET_LENGTH = 8;					// 패스워드 재설정시 길이
    public static final String DUMMY_FRAME_ID = "dummy";            // 더미 프레임 아이디

    // 코드그룹
    public static final String CON_PRDT_DIV = "TKTDIV";				// 입장권구분
    public static final String CON_EDC_DIV = "EDCDIV";				// 교육구분
    public static final String CON_EDA_DIV = "EDCAMT";				// 교육요금구분
    public static final String CON_EDT_DIV = "EDCTGT";				// 교육대상
    
    //Naver Clova Speech Synthesis 개발가이드 : https://apidocs.ncloud.com/ko/ai-naver/clova_speech_synthesis/#api-url
    public static final String CON_CLOVA_APP_NAME = "smartJeju-Kiosk";
    public static final String CON_X_NCP_APIGW_API_KEY_ID = "zmnq7c23ed";
    public static final String CON_X_NCP_APIGW_API_KEY =  "Gf6csuPCSm0gmWGRufYBEhlQLTmm3BCCnUo3oMux";
    
    public static final String PUBLIC_DATA_SERVICE_KEY = "GlUlChKDdYhk99DGrZYSRoLsqIa3ACYR0LCLSR0kqZKaVJ705FAXZ2OgOtAPKfpFZ28d3ELut%2BBRMXAmnY97ig%3D%3D"; // 공공데이터 서비스키
    //qhMq0iWSbT7jRgVpu%2BZchLWhFQQKxNAE%2ByuaK0NAw5bxxC3CqvXJBBNXhJhUDDZQKCPCg6Al2NqTqIl6rM93dg%3D%3D
    
    public static final String QR_URL = EgovProperties.getProperty("QR.URL");
}
