<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>홍보영상관리 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//홍보영상 수정
function updatePromotionMovie() {
	
	//제목 체크
	var title = $.trim($("#update_form input[name='title']").val());
	if(title.length < 1) {
		alert("제목을 입력해주세요.");
		return false;
	}
	
	//유튜브 URL 체크
	var utubeUrl = $.trim($("#update_form input[name='utubeUrl']").val());
	if(utubeUrl.length < 1) {
		alert("유튜브 URL을 입력해주세요.");
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
			url:"<c:url value='/smtmng/main/promotionMovie/promotionMovieUpdate.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				}
				else {
					
					//적용되었습니다.
					//alert("<spring:message code='success.apply'/>");
					opener.location.reload();
					document.location.reload();
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
            <h3 class="title2">홍보영상 수정</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->           
            
          <form name="update_form" id="update_form" method="post" action="<c:url value='/smtmng/main/promotionMovie/promotionMovieUpdate.ezax'/>" onsubmit="updatePromotionMovie();return false;">
          <input type="hidden" name="seq" value="${promotionMovieVO.seq}">
          
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
                                  제목
                              </div>
                          </th>
                          <td>
                          	<input type="text" name="title" value="${promotionMovieVO.title}" style="width:100%;">
                          </td>
                      </tr>
                      <tr>
                          <th> 
                              <div class="necessary-area">
                                  유튜브URL
                              </div>
                          </th>
                          <td>
                              <input type="text" name="utubeUrl" value="${promotionMovieVO.utubeUrl}" style="width:100%;">
                              <br> ex) https://www.youtube.com/embed/vn6b2gj4EVc
                          </td>
                      </tr>
                      
                      <c:if test="${promotionMovieVO.utubeUrl != null && promotionMovieVO.utubeUrl != ''}">
                      <tr>
                      	<td colspan="2">
                      		<!--유튜브정보-->
						<div class="photo_info">
							<div class="video" style="text-align:center;padding-top:20px;">
								<iframe width="700" height="440" src="${promotionMovieVO.utubeUrl}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
						</div>
						<!--//유튜브정보-->
                      	</td>
                      </tr>
                      </c:if>
                      
                      
	                <tr>
	                    <th>표시여부</th>
	                    <td>
	                        <label><input type="radio" name="showFlag" value="Y" <c:if test="${promotionMovieVO.showFlag eq 'Y'}">checked</c:if>> 예, 표시합니다.</label>
	                        &nbsp;&nbsp;&nbsp;
	                        <label><input type="radio" name="showFlag" value="N" <c:if test="${promotionMovieVO.showFlag eq 'N'}">checked</c:if>> 아니오, 표시하지 않습니다.</label>
	                    </td>
	                </tr>
                
                      <tr>
                          <th>최종수정정보</th>
                          <td>
                              ${promotionMovieVO.updateId}
                              /
                              ${promotionMovieVO.updateDttm}
                          </td>
                      </tr>
                  </tbody>
              </table>
          </div> <!--//table-wrapper-->
          
          <div class="btn-wrap" style="width:800px;">
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