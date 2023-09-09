package nextez.com.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import nextez.com.egov.EgovUserDetailsHelper;

/**
 * 관리자 세션체크 인터셉터
 * @author 넥스트이지
 * @since 2016
 * @version 1.0
 * @see
 *
 */
public class AdminAuthInterceptor extends HandlerInterceptorAdapter {
	
	//Logger log = Logger.getLogger(this.getClass());
	Logger log = (Logger) LogManager.getLogger(this.getClass());
	
    /* 관리자 세션체크 인터셉터
     * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException, ModelAndViewDefiningException {
    	
    	//최고관리자
        if(EgovUserDetailsHelper.isSuperAdminAuthenticated()) {	            
            return true;
        } 
        //컨텐츠관리자
        else if (EgovUserDetailsHelper.isContentsAdminAuthenticated()) {        
            return true;
        }
                
        if("ezax".equals(request.getRequestURI().substring(request.getRequestURI().length()-4))) {        
        	// ajax 처리 시도시 세션이 없으면 510 에러 발생시킴 -> 화면에서 캐치후 에러처리(로그인화면이동)
        	response.sendError(510);
        } 
        else {
            // 관리자페이지 이동시 세션이 없으면 사용자 메인으로 redirect
            ModelAndView modelAndView = new ModelAndView("redirect:/");
            throw new ModelAndViewDefiningException(modelAndView);
        }
        
        return false;
    }
}
