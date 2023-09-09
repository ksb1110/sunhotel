<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>수정 - 관리자 - 시스템관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//관리자 수정
function updateAdmin() {
	 
	//관리자명
	var userNm = $.trim($("input[name=userNm]").val());
	if(userNm.length < 1) {
		alert("관리자명을 입력해주세요.");
		$("input[name=userNm]").focus();
		
		return false;
	}
		
	// confirm.mod=수정하시겠습니까?
	if(confirm("<spring:message code='confirm.mod'/>")){
		
		var parameters = new FormData($('#update_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/system/admin/adminUpdate.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					alert(data.errorMessage);
					opener.location.reload();
					self.close();
				}
			}
		});
	}
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">관리자 수정</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="update_form" id="update_form" method="post" onsubmit="updateAdmin();return false;">
    
    <input type="hidden" name="seq" value="${adminVO.seq}">
    <input type="hidden" name="userId" value="${adminVO.userId}">
		
    <div class="table-wrapper">   	
    	
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
                        <div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            관리자아이디
                        </div>
                    </th>
                    <td>
                        ${adminVO.userId}
                    </td>
                    <th>
                        <div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            관리자명
                        </div>
                    </th>
                    <td>
                        <input type="text" style="width:200px;" name="userNm" value="${adminVO.userNm}">
                    </td>
                </tr>
                <tr>
                    <th>비고</th>
                    <td colspan="3">
                        <textarea name="memo" style="width:100%;height:80px;">${adminVO.memo}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>
                        <div class="necessary-area">
                            등록정보
                        </div>
                    </th>
                    <td colspan="3">
                        ${adminVO.regId} / ${adminVO.regDttm}
                    </td>
                </tr>
                <tr>
                    <th>
                        <div class="necessary-area">
                            수정정보
                        </div>
                    </th>
                    <td colspan="3">
                    	<c:if test="${not empty adminVO.modId}">
                        ${adminVO.modId} / ${adminVO.modDttm}
                        </c:if>
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