package nextez.com.vo.user;

import org.apache.ibatis.type.Alias;

/**
 * 서식
 * 파일명 : FormVO.java
 * 작성일 : 2023. 9. 9. 오후 9:12:10
 * 작성자 : 김승범
 */
@Alias("FormVO")
public class FormVO {

	/** 디비접속 테스트 */
	private String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "FormVO [date=" + date + "]";
	}
}
