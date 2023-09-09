<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>수정 - 시설정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//수정
function updateFacility() {
	
	//시설명
	var facilityName = $.trim($("input[name=facilityName]").val());
	if(facilityName.length < 1) {
		alert("시설명을 선택해주세요.");
		$("input[name=facilityName]").focus();
		
		return false;
	}
	
	//경로이미지
	if($("input:radio[name=routeImgFlag]:checked").val() == 'Y' && $("input[name=routeFile]").val() != undefined) {
		var routeFile = $.trim($("input[name=routeFile]").val());
		if (routeFile.length < 1) {
			alert("경로이미지를 선택해주세요.");
			$("input[name=routeFile]").focus();
			
			return false;
		}
	}
	
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
			url:"<c:url value='/smtmng/building/facility/facilityUpdate.ezax'/>",
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
			url:"<c:url value='/smtmng/building/facility/facilityImageDelete.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					//적용되었습니다.
					document.location.reload();
				}
			}
		});
	}
}

// 경로 이미지 삭제
function deleteRouteImg() {
	
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
			url:"<c:url value='/smtmng/building/facility/routeImgDelete.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					//적용되었습니다.
					document.location.reload();
				}
			}
		});
	}
}

//조감도 보기
function facilityMapViewPop() {
	
	//건물코드를 구한다.
	var buildingCode = "${facilityVO.buildingCode}";
	
	//층코드를 구한다.
	var floorCode = "${facilityVO.floorCode}";
	
	//left, top 값을 구한다.
	var pointX = $("input[name=pointX]").val();
	var pointY = $("input[name=pointY]").val();
	
	//시설명
	var facilityName = $("input[name='facilityName']").val();
	
	var facilityMapViewPopSrc = "<c:url value='/smtmng/building/facility/facilityMapViewPop.ez'/>?buildingCode=" + buildingCode + "&floorCode=" + floorCode + "&pointX=" + pointX + "&pointY=" + pointY + "&facilityName=" + facilityName;
	
	window.open(facilityMapViewPopSrc, "facilityMapViewPop", 'resizable=yes,scrollbars=yes,width=1550,height=860');
}

//조감도 팝업으로 부터 호출되는 위치적용 메소드
//위치 적용
function applyPoint(pointX, pointY) {
	
	$("input[name=pointX]").val(pointX);
	$("input[name=pointY]").val(pointY);
}
</script>

</head>
<body>	

<div class="win-popup">
   
   	<!-- 3Depth Menu (메뉴없을 시 삭제) -->
    <nav class="depth3-menu">
        <ul>
            <li class="active">
                <a href="#connectFacilityInfo">시설정보</a>
            </li>
            
            <li>
                <a href="<c:url value="/smtmng/building/facility/connectEmployeeListPop.ez?sFacilityCode=${searchVO.sFacilityCode}"/>">연결직원</a>
            </li>
        </ul>
    </nav>
    <!-- //3Depth Menu (메뉴없을 시 삭제) -->
    
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">시설정보 수정</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="delete_form" id="delete_form" method="post">
    	<input type="hidden" name="facilityCode" value="${facilityVO.facilityCode}">
    </form>
    
    <form name="update_form" id="update_form" method="post" enctype="multipart/form-data" onsubmit="updateFacility();return false;">
    
    <input type="hidden" name="facilityCode" value="${facilityVO.facilityCode}">
    <input type="hidden" name="buildingCode" value="${facilityVO.buildingCode}">
    <input type="hidden" name="floorCode" value="${facilityVO.floorCode}">
    <input type="hidden" name="facilityGubun" value="${facilityVO.facilityGubun}">
		
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
                            건물
                        </div>                    	
                    </th>
                    <td>${buildingNameMap.get(facilityVO.buildingCode)}</td>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            층
                        </div>  
                    </th>
                    <td>${floorNameMap.get(facilityVO.floorCode)}</td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            시설구분
                        </div>    
                    </th>
                    <td>${gubunNameMap.get(facilityVO.facilityGubun)}</td>
                    <th>시설위치</th>
                    <td>                    	
                		<label><input type="radio" name="inOutGubun" value="I" checked><span>건물내부</span></label>
                		<label><input type="radio" name="inOutGubun" value="O" ><span>건물외부</span></label>
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            시설코드
                        </div>    
                    </th>
                    <td colspan="3" style="color:blue;">${facilityVO.facilityCode}</td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            시설명
                        </div>    
                    </th>
                    <td colspan="3" style="color:blue;">
                    	<input type="text" name="facilityName" style="width:100%;" value="${facilityVO.facilityName}">
                            <br> 청사안내에서 시설명 푯말에 줄내림을 하시려면 밑으로 내릴 단어 앞에 "_"를 넣어주세요.<br> ex)세무과_(과표관리계)
                    </td>
                </tr>
                <tr>                    
                    <th>위치정보</th>
                    <td colspan="3">
                    	LEFT : <input type="text" name="pointX" value="<c:if test="${facilityVO.pointX > 0}">${facilityVO.pointX}</c:if>">
                    	&nbsp;&nbsp;
                    	TOP : <input type="text" name="pointY" value="<c:if test="${facilityVO.pointY > 0}">${facilityVO.pointY}</c:if>">
                    	<button type="button" class="btn green" onclick="facilityMapViewPop();">조감도보기</button>
                    </td>
                </tr>
                <tr>
                    <th>시설이미지</th>
                    <td colspan="3">
                    
                    	<c:if test="${facilityVO.facilityImgPath == null || facilityVO.facilityImgPath == ''}">
                           	<div>
                           		<input class="width100" type="file" name="upfile">
                           	</div>
                          	</c:if>
                          	<c:if test="${facilityVO.facilityImgPath != null && facilityVO.facilityImgPath != ''}">
                           	<div>
                           		<img src="${facilityVO.facilityImgPath}" width="180">
                           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           		<button type="button" class="btn green sm" onclick="viewFile('${facilityVO.facilityImgPath}');">보기</button>
								<button type="button" class="btn red sm" onclick="deleteImg();">삭제</button>
                           	</div>
                      	</c:if>

                    </td>
                </tr>
                <tr>
                    <th>경로이미지여부</th>
                    <td colspan="3">                    	
                		<label><input type="radio" name="routeImgFlag" value="Y" <c:if test="${facilityVO.routeImgFlag eq 'Y'}">checked</c:if>><span>사용</span></label>
                		<label><input type="radio" name="routeImgFlag" value="N" <c:if test="${facilityVO.routeImgFlag eq 'N'}">checked</c:if>><span>미사용</span></label>
                    </td>
                </tr>
                <tr>
                    <th>경로이미지</th>
                    <td colspan="3">
                      <c:if test="${facilityVO.routeImgPath == null || facilityVO.routeImgPath == ''}">
                        <div>
                        	<input type="file" class="width100 <c:if test="${facilityVO.routeImgFlag eq 'N'}">disabled</c:if>" name="routeFile">
                        </div>
                      </c:if>
                      <c:if test="${facilityVO.routeImgPath != null && facilityVO.routeImgPath != ''}">
                       	<div>
                       		<img src="${facilityVO.routeImgPath}" width="180">
                       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       		<button type="button" class="btn green sm" onclick="viewFile('${facilityVO.routeImgPath}');">보기</button>
							<button type="button" class="btn red sm" onclick="deleteRouteImg();">삭제</button>
                        </div>
                      </c:if>
                    </td>
                </tr>
                <tr>
                    <th>사용여부</th>
                    <td>                    	
                		<label><input type="radio" name="useYn" value="Y" <c:if test="${facilityVO.useYn == 'Y'}">checked</c:if>><span>사용</span></label>
                		<label><input type="radio" name="useYn" value="N" <c:if test="${facilityVO.useYn == 'N'}">checked</c:if>><span>미사용</span></label>
                    </td>
                    <th>시설정보창형태</th>
                    <td>
                        <c:forEach var="item" items="${infoCodeList}">    
                        	<label><input type="radio" name="infoType" value="${item.code}" <c:if test="${item.code == facilityVO.infoType}">checked</c:if>><span>${item.name}</span></label>
                       	</c:forEach>     
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

<script>
$(function() {
	// 경로이미지 파일
	$("input:radio[name=routeImgFlag]").click(function() {
		if ($(this).val() == 'Y') {
			$("input:file[name=routeFile]").removeClass('disabled').prop('disabled', false);
		} else {
			$("input:file[name=routeFile]").addClass('disabled').prop('disabled', true);
		}
	});
});
</script>

</body>
</html>