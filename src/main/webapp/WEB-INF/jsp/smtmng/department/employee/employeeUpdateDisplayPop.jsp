<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>디스플레이정보 수정 - 직원정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//수정
function updateEmployee() {

	// confirm.mod=수정하시겠습니까?
	if(confirm("<spring:message code='confirm.mod'/>")){
		
		var parameters = new FormData($('#update_form')[0]);		
		
		$.ajax({
			type:"post", 
			dataType:"json",
			enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/department/employee/employeeUpdate.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					//부모창에 함수가 있으면 실행
					if(typeof(opener.updateEmployeeDisplay) == "function") {
						
						opener.updateEmployeeDisplay();
						self.close();
					}
					else {
						
						alert("호출페이지에 함수가 없습니다.");
					}
				}
			}
		});
	}
}

//담당업무내용을 디스플레이정보 업무로 가져오기
function copyJob() {
	
	var job = $("textarea[name='job']").val();
	$("textarea[name='deskJob']").val(job);
}

//이미지 보기
function viewFile(filePath) {
	
	window.open(filePath);
}

//이미지 삭제
function deleteImg() {
	
	// confirm.del=삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		
		var parameters = new FormData($('#delete_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/department/employee/employeeImageDelete.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					//부모창에 함수가 있으면 실행
					if(typeof(opener.updateEmployeeDisplay) == "function") {
						
						opener.updateEmployeeDisplay();
						self.close();
					}
					else {
						
						alert("호출페이지에 함수가 없습니다.");
					}
				}
			}
		});
	}
}
</script>

</head>
<body>	

<div class="win-popup">
    	 
    <form name="delete_form" id="delete_form" method="post">
    	<input type="hidden" name="employeeSeq" value="${employeeVO.employeeSeq}">
    </form>
    	    
    <form name="update_form" id="update_form" method="post" enctype="multipart/form-data" onsubmit="updateEmployee();return false;">
    
    <input type="hidden" name="employeeSeq" value="${employeeVO.employeeSeq}">
    <input type="hidden" name="departCode" value="${employeeVO.departCode}">
    <input type="hidden" name="teamCode" value="${employeeVO.teamCode}">
    <input type="hidden" name="name" value="${employeeVO.name}">
    <input type="hidden" name="userId" value="${employeeVO.userId}">
    
    <div class="table-wrapper">   	
    	
        <table class="table-row th-left" style="display:none;">
            <colgroup>
                <col style="width: 15%">
                <col style="width: 35%">
                <col style="width: 15%">
                <col style="width: 35%">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            부서
                        </div>  
                    </th>
                    <td>
                    	<c:if test="${not empty departmentVO.gukName}">
			   			${departmentVO.gukName}
			   			&gt;
			   			</c:if>
			   			
			   			<c:if test="${not empty departmentVO.departName}">
			   			${departmentVO.departName}
			   			</c:if>
                    </td>
                    <th>팀</th>
                    <td>
                    	<c:if test="${not empty teamVO.teamName}">
			   			${teamVO.teamName}
			   			</c:if>
                    </td>
                </tr>

                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            이름
                        </div>    
                    </th>
                    <td>
                   	 	${employeeVO.name}
                    </td>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            직원아이디
                        </div>   
                    </th>
                    <td>                    	
                   	 	${employeeVO.userId}            	 	
                    </td>
                </tr>
                <tr>
                    <th>직위</th>
                    <td>
                   	 	<input type="text" name="position" style="width:100%;" value="${employeeVO.position}">
                    </td>
                    <th>전화번호</th>
                    <td>                    	
                   	 	<input type="text" name="tel" style="width:100%;" value="${employeeVO.tel}">
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                   	 	<input type="text" name="email" style="width:100%;" value="${employeeVO.email}">
                    </td>
                    <th>정렬순서</th>
                    <td>                    	
                        <select name="employeeSort">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${employeeVO.employeeSort == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>네비정보</th>
                    <td colspan="3">
                   	 	<input type="text" name="navigator" style="width:100%;" value="${employeeVO.navigator}">
                    </td>
                </tr>
                <tr>
                    <th>담당업무<br />(수정불가)</th>
                    <td colspan="3">
                   	 	<textarea name="job" style="width:100%;height:120px;" readonly>${employeeVO.job}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>경로안내</th>
                    <td colspan="3">
                   	 	<label><input type="radio" name="routeFlag" value="Y" <c:if test="${employeeVO.routeFlag == 'Y'}">checked</c:if>> 안내함</label>
                   	 	&nbsp;&nbsp;
                   	 	<label><input type="radio" name="routeFlag" value="N" <c:if test="${employeeVO.routeFlag == 'N'}">checked</c:if>> 안내안함</label>
                   	 	&nbsp;&nbsp;&nbsp;
                   	 	<span style="color:blue;">* 직원검색 결과에서 해당 직원의 위치를 안내해줄지 여부를 설정합니다.</span>
                    </td>
                </tr>
       		</tbody>
       	</table>
       	
       	
       	<h2 class="title2">디스플레이정보</h2>
       	
       	<table class="table-row th-left">
            <colgroup>
                <col style="width: 20%">
                <col style="width: 30%">
                <col style="width: 20%">
                <col style="width: 30%">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                    	사진 (106 x 150)
                    </th>
                    <td colspan="3">
                    	
                    	<c:if test="${employeeVO.memberImgPath == null || employeeVO.memberImgPath == ''}">
                           	<div>
                           		<input class="width100" type="file" name="upfile">
                           	</div>
                          	</c:if>
                          	<c:if test="${employeeVO.memberImgPath != null && employeeVO.memberImgPath != ''}">
                           	<div>
                           		<img src="${employeeVO.memberImgPath}" width="106" height="150">
                           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           		<button type="button" class="btn green sm" onclick="viewFile('${employeeVO.memberImgPath}');">보기</button>
								<button type="button" class="btn red sm" onclick="deleteImg();">삭제</button>
                           	</div>
                      	</c:if>
                      	
                    </td>
                </tr>
                <tr>
                    <th>업무</th>
                    <td colspan="3">
                   	 	<textarea name="deskJob" style="width:100%;height:120px;">${employeeVO.deskJob}</textarea>
                        <br />
                        <button type="button" class="btn green sm" onclick="copyJob();">담당업무내용 가져오기</button>
                    </td>
                </tr>
                
            </tbody>
        </table>
                
    </div> <!--//table-wrapper-->
    
    <div class="btn-wrap center">
    	<button type="submit" class="btn blue">수정</button>
        <button type="button" class="btn" onclick="self.close();">닫기</button>
    </div>
	
		<!-- 
			$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
			마지막은 다른 데이터로 변경하면 됨.
		-->
   		<input type="hidden" name="parsingPrevent" value="">
            
	</form>
    
</div> <!--//win-popup-->

</body>
</html>