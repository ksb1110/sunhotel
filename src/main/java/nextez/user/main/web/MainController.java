package nextez.user.main.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import nextez.com.util.EgovStringUtil;
import nextez.com.vo.user.FormSVO;
import nextez.com.vo.user.FormVO;
import nextez.user.form.service.FormService; 

/**
 * 메인페이지 
 * 파일명 : MainController.java 
 * 작성일 : 2018. 9. 17. 오후 4:09:24 
 * 작성자 : 김승범
 */
@Controller
public class MainController {

	Logger log = (Logger) LogManager.getLogger(this.getClass());
		
	/** FormService */
    @Autowired
    private FormService formService;
    
    /**
     * 메인
     * 메소드명 : main
     * 작성일 : 2019. 6. 17. 오후 2:14:36
     * 작성자 : 김승범
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/main.ez")
    public ModelAndView main(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttr) {
        
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	//디비접속 테스트
    	FormSVO formSVO = new FormSVO();
    	FormVO formVO = formService.selectDate(formSVO);
    	
    	if(EgovStringUtil.isNotEmpty(formVO)) {
    		
    		System.out.println("ORACLE DB CONNECT TEST -> DATE : " + formVO.getDate());
    	}
        
        return new ModelAndView("user/main/main", resultMap);
    }
}
