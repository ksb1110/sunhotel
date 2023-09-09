<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>설정 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//설정 수정
function updateSetting() {
	
	// confirm.mod=수정하시겠습니까?
	if(confirm("<spring:message code='confirm.mod'/>")){
		
		var parameters = new FormData($('#update_form')[0]);
		
		//$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
		//마지막은 다른 데이터로 변경하면 됨.
		$.ajax({
			type:"post", 
			dataType:"json",
			enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/main/setting/settingUpdate.ezax'/>",
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

//로고이미지 삭제
function deleteLogoImg() {
	
	// confirm.del=삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")) {
		
		var parameters = new FormData($('#delete_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/main/setting/settingLogoImageDelete.ezax'/>",
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

//로고/청사안내 이미지 보기
function viewFile(filePath) {

	window.open(filePath);
}

//청사안내 이미지 삭제
function deleteBuildingImg() {
	
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
			url:"<c:url value='/smtmng/main/setting/settingBuildingImageDelete.ezax'/>",
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

//날씨정보 가져오기 테스트
function getWeatherService() {
	
	$.ajax({
		type:"post", 
		dataType:"json",
		//enctype:"multipart/form-data",
		contentType:false,
		processData:false,
		async:false,
		url:"<c:url value='/smtmng/main/setting/getWeatherService.ezax'/>",
		success:function(data) {
			
			if(data.result == "${Constant.FLAG_N}") {
				
				alert(data.errorMessage);
			} 
			else {
				
				//적용되었습니다.
				//document.location.reload();
				
				//결과값 조합
				var html = "";
				
				//날씨데이터가 있으면
				if(data && data.weatherResult) {

					html += "weatherUrl : " + data.weatherResult.weatherUrl;
					html += "<br>hour : " + data.weatherResult.hour;
					html += "<br>wfKor : " + data.weatherResult.wfKor;
					html += "<br>temp : " + data.weatherResult.temp;
					html += "<br>sky : " + data.weatherResult.sky;
					html += "<br>pop : " + data.weatherResult.pop;
					html += "<br>pty : " + data.weatherResult.pty;
					html += "<br>pm10Val : " + data.weatherResult.pm10Val;
					html += "<br>pm10Cai : " + data.weatherResult.pm10Cai;
				}
				//날씨데이터가 없으면
				else {
					
					html += "날씨데이터가 없습니다.";
				}
				
				$("#weatherInfoDiv").html(html);
				
			}
		}
	});
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="main"/>
		<jsp:param name="admin_menu2" value="setting"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">설정</h2>                    
            
            <form name="delete_form" id="delete_form" method="post" action="">
            	<input type="hidden" name="seq" value="${settingVO.seq}">
            </form>
            
            <form name="update_form" id="update_form" method="post" enctype="multipart/form-data" onsubmit="updateSetting();return false;">
            <input type="hidden" name="seq" value="${settingVO.seq}">
            
            <div class="table-wrapper" style="width:800px;">
                <table class="table th-left">
                    <colgroup>
                        <col style="width: 25%">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th> 
                                <div class="necessary-area">
                                    로고이미지
                                </div>
                            </th>
                            <td>
                            	<c:if test="${settingVO.logoImgPath == null || settingVO.logoImgPath == ''}">
	                            	<div>
	                            		<input class="width100" type="file" name="upfile">
	                            	</div>
                            	</c:if>
                            	<c:if test="${settingVO.logoImgPath != null && settingVO.logoImgPath != ''}">
	                            	<div>
	                            		<img src="${settingVO.logoImgPath}" width="180">
	                            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            		<button type="button" class="btn green sm" onclick="viewFile('${settingVO.logoImgPath}');">보기</button>
										<button type="button" class="btn red sm" onclick="deleteLogoImg();">삭제</button>
	                            	</div>
                            	</c:if>
                            </td>
                        </tr>
                        <tr>
                            <th> 
                                <div class="necessary-area">
                                    로고이미지표시
                                </div>
                            </th>
                            <td>
                                <label><input type="radio" name="logoImgShowFlag" value="Y" <c:if test="${settingVO.logoImgShowFlag == null || settingVO.logoImgShowFlag == 'Y'}">checked</c:if>><span>표시함</span></label>
                                <label><input type="radio" name="logoImgShowFlag" value="N" <c:if test="${settingVO.logoImgShowFlag == 'N'}">checked</c:if>><span>표시안함</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th>메인출력콘텐츠</th>
                            <td>
                                <label><input type="radio" name="imgMovieChoice" value="M" <c:if test="${settingVO.imgMovieChoice == null || settingVO.imgMovieChoice == 'M'}">checked</c:if>><span>홍보영상</span></label>
                                <label><input type="radio" name="imgMovieChoice" value="I" <c:if test="${settingVO.imgMovieChoice == 'I'}">checked</c:if>><span>캠페인이미지</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th>홍보영상표시</th>
                            <td>
                                <label><input type="radio" name="movieShowFlag" value="Y" <c:if test="${settingVO.movieShowFlag == null || settingVO.movieShowFlag == 'Y'}">checked</c:if>><span>표시함</span></label>
                                <label><input type="radio" name="movieShowFlag" value="N" <c:if test="${settingVO.movieShowFlag == 'N'}">checked</c:if>><span>표시안함</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th>캠페인이미지표시</th>
                            <td>
                                <label><input type="radio" name="campaignShowFlag" value="Y" <c:if test="${settingVO.campaignShowFlag == null || settingVO.campaignShowFlag == 'Y'}">checked</c:if>><span>표시함</span></label>
                                <label><input type="radio" name="campaignShowFlag" value="N" <c:if test="${settingVO.campaignShowFlag == 'N'}">checked</c:if>><span>표시안함</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th>날씨정보표시</th>
                            <td>
                                <label><input type="radio" name="weatherShowFlag" value="Y" <c:if test="${settingVO.weatherShowFlag == null || settingVO.weatherShowFlag == 'Y'}">checked</c:if>><span>표시함</span></label>
                                <label><input type="radio" name="weatherShowFlag" value="N" <c:if test="${settingVO.weatherShowFlag == 'N'}">checked</c:if>><span>표시안함</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th>자막정보표시</th>
                            <td>
                                <label><input type="radio" name="subtitleShowFlag" value="Y" <c:if test="${settingVO.subtitleShowFlag == null || settingVO.subtitleShowFlag == 'Y'}">checked</c:if>><span>표시함</span></label>
                                <label><input type="radio" name="subtitleShowFlag" value="N" <c:if test="${settingVO.subtitleShowFlag == 'N'}">checked</c:if>><span>표시안함</span></label>
                            </td>
                        </tr>
                        
                        <tr>
                            <th> 
                                <div class="necessary-area">
                                    청사안내 이미지
                                    <br />
                                    (1160 x 680)                                   
                                </div>
                            </th>
                            <td>
                            	<c:if test="${settingVO.buildingImgPath == null || settingVO.buildingImgPath == ''}">
	                            	<div>
	                            		<input class="width100" type="file" name="upfile2">
	                            		<p style="color:blue;">
	                                    	* 직원안내도에 나오는 청사안내도 이미지 입니다.
	                                    </p>
	                            	</div>
                            	</c:if>
                            	<c:if test="${settingVO.buildingImgPath != null && settingVO.buildingImgPath != ''}">
	                            	<div>
	                            		<img src="${settingVO.buildingImgPath}" width="180">
	                            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            		<button type="button" class="btn green sm" onclick="viewFile('${settingVO.buildingImgPath}');">보기</button>
										<button type="button" class="btn red sm" onclick="deleteBuildingImg();">삭제</button>
	                            		<p style="color:blue;">
	                                    	* 직원안내도에 나오는 청사안내도 이미지 입니다.
	                                    </p>
	                            	</div>
                            	</c:if>
                            </td>
                        </tr>
                        
                        <tr>
                            <th>JS, CSS 갱신버전</th>
                            <td>
                                <input type="text" name="jsCssVersion" value="${settingVO.jsCssVersion}">
                                * js 및 css 를 변경하고 적용이 안될 경우 해당 버전을 변경해주세요.
                            </td>
                        </tr>
                        
                        <!-- 
                        <tr>
                            <th>음성서비스적용</th>
                            <td>
                                <label><input type="radio" name="voiceApplyFlag" value="Y" <c:if test="${settingVO.voiceApplyFlag == null || settingVO.voiceApplyFlag == 'Y'}">checked</c:if>><span>적용함</span></label>
                                <label><input type="radio" name="voiceApplyFlag" value="N" <c:if test="${settingVO.voiceApplyFlag == 'N'}">checked</c:if>><span>적용안함</span></label>
                            </td>
                        </tr>
                        -->
                         
                        
                        
                        <tr>
                            <th>웹에서 키오스크 지정위치</th>
                            <td>
                                <select name="webKioskCode">
                           			<c:forEach var="kioskCode" items="${kioskCodeList}">
                                     	<option value="${fn:toLowerCase(kioskCode.code)}" <c:if test="${fn:toLowerCase(settingVO.webKioskCode) == fn:toLowerCase(kioskCode.code)}">selected</c:if>>${kioskCode.name}</option>
                               		</c:forEach> 
                                </select>
                            </td>
                        </tr>
                        
                        <!-- 
                        <tr>
                            <th>앱 자동실행 상태 변경</th>
                            <td>
                                <label><input type="radio" name="KioskAppAccessFlag" value="Y" <c:if test="${settingVO.kioskAppAccessFlag == null || settingVO.kioskAppAccessFlag == 'Y'}">checked</c:if>><span>Y</span></label>
                                <label><input type="radio" name="KioskAppAccessFlag" value="N" <c:if test="${settingVO.kioskAppAccessFlag == 'N'}">checked</c:if>><span>N</span></label>
                            </td>
                        </tr>
                        -->
                        
                        <tr>
                            <th>날씨정보가져오기</th>
                            <td>
                                <button type="button" class="btn black sm" onclick="getWeatherService();">실행</button>
                                <div id="weatherInfoDiv" style="padding:5px;">
                                
                                </div>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <th>최종수정시각</th>
                            <td>
                                ${settingVO.lastUpdateDttm}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div> <!--//table-wrapper-->
            
            <div class="btn-wrap" style="width:800px;">
				<button type="submit" class="btn blue">수정</button>
			</div>
			
			<!-- 
				$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
				마지막은 다른 데이터로 변경하면 됨.
			-->
            <input type="hidden" name="parsingPrevent" value="">
            
			</form>
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

</body>
</html>