package nextez.com.vo.file;

import org.apache.ibatis.type.Alias;

@Alias("CommonFileVO")
public class CommonFileVO {

	/** 파일아이디 */
	private String fileId;
	/** 관련아이디 */
	private String relationId;
	/** 순번 */
	private String sn;
	/** 파일구분 */
	private String fileDiv;
	/** 실제파일명 */
	private String realFileNm;
	/** 저장파일명 */
	private String saveFileNm;
	/** 저장경로 */
	private String savePath;
	/** 파일크기 */
	private String fileSize;
	/** 파일확장자 */
	private String fileExt;
	/** 다운로드수 */
	private String dwldCnt;
	/** 등록일시 */
	private String regDttm;
	/** 등록아이디 */
	private String regId;
	/** 사용여부 */
	private String useYn;

	/**
	 * @return 파일아이디
	 */
	public String getFileId() {
		return fileId;
	}

	/**
	 * @param 파일아이디
	 */
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	/**
	 * @return 관련아이디
	 */
	public String getRelationId() {
		return relationId;
	}

	/**
	 * @param 관련아이디
	 */
	public void setRelationId(String relationId) {
		this.relationId = relationId;
	}

	/**
	 * @return 순번
	 */
	public String getSn() {
		return sn;
	}

	/**
	 * @param 순번
	 */
	public void setSn(String sn) {
		this.sn = sn;
	}

	/**
	 * @return 파일구분
	 */
	public String getFileDiv() {
		return fileDiv;
	}

	/**
	 * @param 파일구분
	 */
	public void setFileDiv(String fileDiv) {
		this.fileDiv = fileDiv;
	}

	/**
	 * @return 실제파일명
	 */
	public String getRealFileNm() {
		return realFileNm;
	}

	/**
	 * @param 실제파일명
	 */
	public void setRealFileNm(String realFileNm) {
		this.realFileNm = realFileNm;
	}

	/**
	 * @return 저장파일명
	 */
	public String getSaveFileNm() {
		return saveFileNm;
	}

	/**
	 * @param 저장파일명
	 */
	public void setSaveFileNm(String saveFileNm) {
		this.saveFileNm = saveFileNm;
	}

	/**
	 * @return 저장경로
	 */
	public String getSavePath() {
		return savePath;
	}

	/**
	 * @param 저장경로
	 */
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	/**
	 * @return 파일크기
	 */
	public String getFileSize() {
		return fileSize;
	}

	/**
	 * @param 파일크기
	 */
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	/**
	 * @return 파일확장자
	 */
	public String getFileExt() {
		return fileExt;
	}

	/**
	 * @param 파일확장자
	 */
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	/**
	 * @return 다운로드수
	 */
	public String getDwldCnt() {
		return dwldCnt;
	}

	/**
	 * @param 다운로드수
	 */
	public void setDwldCnt(String dwldCnt) {
		this.dwldCnt = dwldCnt;
	}

	/**
	 * @return 등록일시
	 */
	public String getRegDttm() {
		return regDttm;
	}

	/**
	 * @param 등록일시
	 */
	public void setRegDttm(String regDttm) {
		this.regDttm = regDttm;
	}

	/**
	 * @return 등록아이디
	 */
	public String getRegId() {
		return regId;
	}

	/**
	 * @param 등록아이디
	 */
	public void setRegId(String regId) {
		this.regId = regId;
	}

	/**
	 * @return 사용여부
	 */
	public String getUseYn() {
		return useYn;
	}

	/**
	 * @param 사용여부
	 */
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

}
