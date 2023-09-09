<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>수정 - 부서바로찾기관리 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//수정
function updateFind() {
	 
	//명칭
	var findTitle = $.trim($("textarea[name='findTitle']").val());
	if(findTitle.length < 1) {
		alert("명칭을 입력해주세요.");
		$("textarea[name='findTitle']").focus();
		
		return false;
	}
	
	/*
	//부서바로찾기
	var upfile = $.trim($("input[name=upfile]").val());
	if(upfile.length < 1) {
		alert("부서바로찾기를 입력해주세요.");
		$("input[name=upfile]").focus();
		
		return false;
	}
	*/
	
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
			url:"<c:url value='/smtmng/main/find/findUpdate.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.location.reload();
					self.close();
				}
			}
		});
	}
}

//이미지 삭제
function deleteFindImg() {
	
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
			url:"<c:url value='/smtmng/main/find/findImageDelete.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.location.reload();
					
					//적용되었습니다.
					document.location.reload();
				}
			}
		});
	}
}

//이미지 보기
function viewFile(filePath) {
	
	window.open(filePath);
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">[${findGubunCodeMap.get(searchVO.sFindGubun)}] 수정</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="delete_form" id="delete_form" method="post" action="<c:url value='/smtmng/main/find/findImageDelete.ezax'/>">
    	<input type="hidden" name="findSeq" value="${findVO.findSeq}">
    </form>
    
    <form name="update_form" id="update_form" method="post" action="<c:url value='/smtmng/main/find/findUpdate.ezax'/>" enctype="multipart/form-data" onsubmit="updateFind();return false;">
    <input type="hidden" name="findSeq" value="${findVO.findSeq}">
    <input type="hidden" name="findGubun" value="${findVO.findGubun}">
		
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
                            명칭
                        </div>                    	
                    </th>
                    <td colspan="3">
                    	<textarea class="width100" name="findTitle">${findVO.findTitle}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            아이콘이미지
                        </div> 
                    </th>
                    <td colspan="3">
                    	
                    	<c:if test="${findVO.findIconImg == null || findVO.findIconImg == ''}">
                           	<div>
                           		<input class="width100" type="file" name="upfile">
                           	</div>
                     	</c:if>
                      	<c:if test="${findVO.findIconImg != null && findVO.findIconImg != ''}">
                           	<div>
                           		<img src="${findVO.findIconImg}" height="40">
                           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           		<button type="button" class="btn green sm" onclick="viewFile('${findVO.findIconImg}');">보기</button>
								<button type="button" class="btn red sm" onclick="deleteFindImg();">삭제</button>
                           	</div>
                      	</c:if>
                          	
                    </td>
                </tr>
                <tr>
                    <th>정렬순서</th>
                    <td>
                        <select name="findSort">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${findVO.findSort == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                    <th>
                    	서브메뉴왼쪽위치
                    	<br>
                    	(숫자입력)
                    </th>
                    <td>
                        <input type="text" class="width100" name="subLeftPos" value="${findVO.subLeftPos}">
                    </td>
                </tr>
                <tr>
                    <th>표시여부</th>
                    <td colspan="3">
                        <label><input type="radio" name="findShowFlag" value="Y" <c:if test="${findVO.findShowFlag eq 'Y'}">checked</c:if>> 예, 표시합니다.</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="findShowFlag" value="N" <c:if test="${findVO.findShowFlag eq 'N'}">checked</c:if>> 아니오, 표시하지 않습니다.</label>
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