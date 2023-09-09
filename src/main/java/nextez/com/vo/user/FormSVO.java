package nextez.com.vo.user;

import org.apache.ibatis.type.Alias;

/**
 * 서식 (검색용)
 * 파일명 : FormSVO.java
 * 작성일 : 2023. 9. 9. 오후 9:12:20
 * 작성자 : 김승범
 */
@Alias("FormSVO")
public class FormSVO {

	/** 디비접속 테스트 */
	private String sDate;

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	@Override
	public String toString() {
		return "FormSVO [sDate=" + sDate + "]";
	}	
}
