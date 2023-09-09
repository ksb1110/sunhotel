/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package nextez.com.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * 세션정보
 * 파일명 : SessionUserVO.java
 * 작성일 : 2019. 6. 27. 오후 1:53:55
 * 작성자 : 김승범
 */
@Alias("SessionUserVO")
public class SessionUserVO implements Serializable {

	private static final long serialVersionUID = 2513418365489580151L;
	
	/**
	 * 직원아이디
	 */
	private String userId;
	
	/**
	 * 직원이름
	 */
	private String userName;
	
	/**
	 * 부서코드
	 */
	private String departCode;
	
	/**
	 * 부서내 직원아이디
	 */
	private String departmentUid;
	
	/**
	 * 관리자레벨 (1:전체관리자, 2:컨텐츠관리자)
	 */
	private String adminLevel;

	
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDepartCode() {
		return departCode;
	}

	public void setDepartCode(String departCode) {
		this.departCode = departCode;
	}

	public String getDepartmentUid() {
		return departmentUid;
	}

	public void setDepartmentUid(String departmentUid) {
		this.departmentUid = departmentUid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	public String getAdminLevel() {
		return adminLevel;
	}

	public void setAdminLevel(String adminLevel) {
		this.adminLevel = adminLevel;
	}

	
	
	
}
