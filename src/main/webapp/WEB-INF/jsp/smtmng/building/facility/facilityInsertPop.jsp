<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 시설정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertFacility() {
	
	//건물
	var buildingCode = $.trim($("select[name=buildingCode]").val());
	if(buildingCode.length < 1) {
		alert("건물을 선택해주세요.");
		$("select[name=buildingCode]").focus();
		
		return false;
	}
	
	//층
	var floorCode = $.trim($("select[name=floorCode]").val());
	if(floorCode.length < 1) {
		alert("층을 선택해주세요.");
		$("select[name=floorCode]").focus();
		
		return false;
	}
	
	
	//시설
	var facilityGubun = $.trim($("select[name=facilityGubun]").val());
	if(facilityGubun.length < 1) {
		alert("시설구분을 선택해주세요.");
		$("select[name=facilityGubun]").focus();
		
		return false;
	}
	
	//시설명
	var facilityName = $.trim($("input[name=facilityName]").val());
	if(facilityName.length < 1) {
		alert("시설명을 선택해주세요.");
		$("input[name=facilityName]").focus();
		
		return false;
	}
	
	//경로이미지
	var routeFile = $.trim($("input[name=routeFile]").val());
	if($("input:radio[name=routeImgFlag]:checked").val() == 'Y' && routeFile.length < 1) {
		alert("경로이미지를 선택해주세요.");
		$("input[name=routeFile]").focus();
		
		return false;
	}
	
	
	/*
	//시설정보
	var upfile = $.trim($("input[name=upfile]").val());
	if(upfile.length < 1) {
		alert("시설정보를 입력해주세요.");
		$("input[name=upfile]").focus();
		
		return false;
	}
	*/
	
	// confirm.ins=등록하시겠습니까?
	if(confirm("<spring:message code='confirm.ins'/>")){
		
		var parameters = new FormData($('#insert_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/building/facility/facilityInsert.ezax'/>",
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

//조감도 보기
function facilityMapViewPop() {
	
	//건물코드를 구한다.
	var buildingCode = $("select[name='buildingCode']").val();
	
	//층코드를 구한다.
	var floorCode = $("select[name='floorCode']").val();
	
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

//층 검색
function searchFloorList(buildingCode) {
	
	$("form[name='search_floor_form'] input[name='sBuildingCode']").val(buildingCode);
	
	var parameters = new FormData($('#search_floor_form')[0]);
	
	$.ajax({
		type:"post", 
		dataType:"json",
		//enctype:"multipart/form-data",
		contentType:false,
		processData:false,
		async:false,
		url:"<c:url value='/smtmng/building/route/searchFloorCodeList.ezax'/>",
		data:parameters ,
		success:function(data) {
			
			if(data.result == "${Constant.FLAG_N}"){
				
				alert(data.errorMessage);
			} 
			else {
				
				var html_options = "<option value='''>== 층선택 ==</option>";
				
				if(data.floorList.length > 0) {
					
					$.each(data.floorList,function(i,item) {
						
						html_options += "<option value='" + item.code + "' >" + item.name + "</option>";
						
					});
				}
				
				$("select[name='floorCode']").html(html_options);
			}
		}
	});
	
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">시설정보 등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    	   
	<form name="search_floor_form" id="search_floor_form" method="post" action="">
       	<input type="hidden" name="sBuildingCode" value="">
    </form>
        	    
    <form name="insert_form" id="insert_form" method="post" enctype="multipart/form-data" onsubmit="insertFacility();return false;">
    
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
                    <td>
                        <select name="buildingCode" onchange="searchFloorList($(this).val());">
                        	<option value="">==건물선택==</option>
                        	<c:forEach var="item" items="${buildingCodeList}">                        	
                        		<option value="${item.code}" <c:if test="${item.code == searchVO.sBuildingCode}">selected</c:if>>${item.name}</option>
                        	</c:forEach>                    	
                        </select>
                    </td>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            층
                        </div>  
                    </th>
                    <td>
                    	<select name="floorCode">
                    		<option value="">==층선택==</option>   
                        	<c:forEach var="item" items="${floorCodeList}">                        	
                        		<option value="${item.code}">${item.name}</option>
                        	</c:forEach>                    		
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            시설구분
                        </div>    
                    </th>
                    <td>
                    	<select name="facilityGubun">
                        	<option value="">==시설구분==</option>
                        	<c:forEach var="item" items="${facilityGubunCodeList}">                        	
                        		<option value="${item.code}">${item.name}</option>
                        	</c:forEach>                    	
                        </select>
                    </td>
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
                    <td colspan="3" style="color:blue;">
                    	시설코드는 자동 생성됩니다. (건물코드 + 층코드 + 시설구분코드 + 순차증가값 조합으로 생성)
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            시설명
                        </div>    
                    </th>
                    <td colspan="3"  style="color:blue;">
                    	<input type="text" name="facilityName" style="width:100%;">
                    	<br> 청사안내에서 시설명 푯말에 줄내림을 하시려면 밑으로 내릴 단어 앞에 "_"를 넣어주세요.<br> ex)세무과_(과표관리계)
                    </td>
                </tr>
                <tr>                    
                    <th>위치정보</th>
                    <td colspan="3">
                    	<input type="text" name="pointX" readonly>
                    	<input type="text" name="pointY" readonly>
                    	<button type="button" class="btn green" onclick="facilityMapViewPop();">조감도보기</button>
                    </td>
                </tr>
                <tr>
                    <th>시설이미지</th>
                    <td colspan="3">
                        <input type="file" class="width100" name="upfile">
                    </td>
                </tr>
                <tr>
                    <th>경로이미지여부</th>
                    <td colspan="3">                    	
                		<label><input type="radio" name="routeImgFlag" value="Y"><span>사용</span></label> 
                		<label><input type="radio" name="routeImgFlag" value="N" checked><span>미사용</span></label>
                    </td>
                </tr>
                <tr>
                    <th>경로이미지</th>
                    <td colspan="3">
                        <input type="file" class="width100 disabled" name="routeFile">
                    </td>
                </tr>
                <tr>
                    <th>사용여부</th>
                    <td>                    	
                		<label><input type="radio" name="useYn" value="Y" checked><span>사용</span></label>
                		<label><input type="radio" name="useYn" value="N" ><span>미사용</span></label>
                    </td>
                    <th>시설정보창형태</th>
                    <td>
                        <c:forEach var="item" items="${infoCodeList}">    
                        	<label><input type="radio" name="infoType" value="${item.code}" <c:if test="${item.code == 'A'}">checked</c:if>><span>${item.name}</span></label>
                       	</c:forEach>     
                    </td>
                </tr>
            </tbody>
        </table>
                
    </div> <!--//table-wrapper-->
    
    <div class="btn-wrap center">
        <button type="submit" class="btn blue">등록</button>
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
	//건물코드를 파라메터로 갖고 들어오는 경우도 있기 때문에 층정보를 페이지 로딩후 실행해준다.
	searchFloorList('${searchVO.sBuildingCode}');
	
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