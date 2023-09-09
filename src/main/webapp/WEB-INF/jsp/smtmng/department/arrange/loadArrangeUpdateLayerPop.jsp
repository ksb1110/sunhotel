<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 
	해당 페이지에서 사용하는 자바스크립트 함수는 이 페이지를 로딩하는 페이지에 있다.
 -->

<!--popup content-->
<div id="arrangeUpdateLayerPop" class="layer-popup">
	<div class="content-wrap">
		<div class="content">
			<div class="head">
				<h3 class="title">배치수정</h3>
				<button type="button" class="close"><img src="/images/admin/btn/close.png" alt="닫기"></button>
			</div>
			
			<form name="update_arrange_form" id="update_arrange_form" method="post" enctype="multipart/form-data" onsubmit="updateArrange();return false;">
			
			<input type="hidden" name="facilityCode" value="${arrangeInfo.facilityCode}">
			<input type="hidden" name="arrangeCode" value="${arrangeInfo.arrangeCode}">
			<input type="hidden" name="arrangeType" value="${arrangeInfo.arrangeType}">
			<input type="hidden" name="col" value="${arrangeInfo.col}">
			<input type="hidden" name="row" value="${arrangeInfo.row}">
  					
			<div class="main">
				
				<div class="table-wrapper">   	
  						
			        <table class="table-row th-left">
			            <colgroup>
			                <col style="width: 25%">
			                <col style="width: 75%">
			            </colgroup>
			            <tbody>
			                <tr>
			                    <th>
			                    	<div class="necessary-area">
			                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
			                            배치코드
			                        </div>                    	
			                    </th>
			                    <td>
			                    	<span style="color:blue;">${arrangeInfo.arrangeCode}</span>
			                    </td>
			                </tr>
			                
			                <tr>
			                    <th>배치타입</th>
			                    <td>
			                    	<c:if test="${arrangeInfo.arrangeType == 'A'}">
			                    	제목
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.arrangeType == 'B'}">
			                    	부서장
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.arrangeType == 'C'}">
			                    	팀(팀장 + 팀원)
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.arrangeType == 'D'}">
			                    	시계
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.arrangeType == 'E'}">
			                    	유튜브
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.arrangeType == 'F'}">
			                    	홍보이미지
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.arrangeType == 'G'}">
			                    	일반이미지
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.arrangeType == 'H'}">
			                    	날씨
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.arrangeType == 'I'}">
			                    	청사안내버튼
			                    	</c:if>
			                    </td>
			            	</tr>
			            	
			                <tr class="arrangeNameTr">
			                    <th>
			                    	<span class="arrangeNameSpan">배치명</span>
			                    </th>
			                    <td>
                      				<input type="text" style="width:100%;" name="arrangeName" value="${arrangeInfo.arrangeName}">
			                    </td>
			            	</tr>
			            	
			            	<tr class="nameFlowFlagTr">
			                    <th>
			                    	<span class="nameFlowFlagSpan">팀명 슬라이딩 효과</span>
			                    </th>
			                    <td>
                      				<label><input type="radio" name="nameFlowFlag" value="Y" <c:if test="${arrangeInfo.nameFlowFlag == 'Y'}">checked</c:if>> 적용함</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="nameFlowFlag" value="N" <c:if test="${arrangeInfo.nameFlowFlag == 'N'}">checked</c:if>> 적용안함</label>
                  					<br>
                  					<span style="color:blue;">		            			
				            			* 글자가 왼쪽으로 흘러가는 효과 입니다.
				            			<br>
				            			* 글자가 길어서 전부 안보이는 경우 사용하세요.
				            		</span>
			                    </td>
			            	</tr>
			            	
			            	<tr class="sizeGubunTr">
			                    <th>사이즈구분</th>
			                    <td>
			                    	<label><input type="radio" name="sizeGubun" value="N" <c:if test="${arrangeInfo.sizeGubun == 'N'}">checked</c:if>> 기본 사이즈</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="sizeGubun" value="S" <c:if test="${arrangeInfo.sizeGubun == 'S'}">checked</c:if>> 작은 사이즈</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label id="sizeGubunB" style="display:none;"><input type="radio" name="sizeGubun" value="B" <c:if test="${arrangeInfo.sizeGubun == 'B'}">checked</c:if>> 큰 사이즈</label>
			                    </td>
			             	</tr>
			             	
			             	<tr class="timeGubunTr">
			                    <th>시간제</th>
			                    <td>
			                    	<label><input type="radio" name="timeGubun" value="A" <c:if test="${arrangeInfo.timeGubun == 'A'}">checked</c:if>> 12시간제</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="timeGubun" value="B" <c:if test="${arrangeInfo.timeGubun == 'B'}">checked</c:if>> 24시간제</label>
			                    </td>
			             	</tr>
			             	
			                <tr class="arrangeSizeTr">
			                    <th>팀원배치크기</th>
			                    <td>
                 					칸수 : ${arrangeInfo.col}
                 					&nbsp;&nbsp;
                 					줄수 : ${arrangeInfo.row}
			                    </td>
			            	</tr>
			            	
			            	
			                <tr class="teamLeaerPosTr">
			                    <th>팀장위치</th>
			                    <td>
                  					<label><input type="radio" name="teamLeaderPos" value="T" <c:if test="${arrangeInfo.teamLeaderPos == 'T'}">checked</c:if>> 팀상단</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="teamLeaderPos" value="B" <c:if test="${arrangeInfo.teamLeaderPos == 'B'}">checked</c:if>> 팀하단</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="teamLeaderPos" value="H" <c:if test="${arrangeInfo.teamLeaderPos == 'H'}">checked</c:if>> 숨김</label>
			                    </td>
			            	</tr>
			            	
			            	<tr class="bgColorTr">
			                    <th>색상타입</th>
			                    <td>
			                    	<label><input type="radio" name="bgColor" value="skin1" <c:if test="${arrangeInfo.bgColor == 'skin1'}">checked</c:if>><span style="background:#5468e1;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin2" <c:if test="${arrangeInfo.bgColor == 'skin2'}">checked</c:if>><span style="background:#45bec9;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin3" <c:if test="${arrangeInfo.bgColor == 'skin3'}">checked</c:if>><span style="background:#ae94ea;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin4" <c:if test="${arrangeInfo.bgColor == 'skin4'}">checked</c:if>><span style="background:#ef75ba;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin5" <c:if test="${arrangeInfo.bgColor == 'skin5'}">checked</c:if>><span style="background:#ffb400;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin6" <c:if test="${arrangeInfo.bgColor == 'skin6'}">checked</c:if>><span style="background:#70db1a;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<br />
			                    	<label><input type="radio" name="bgColor" value="skin7" <c:if test="${arrangeInfo.bgColor == 'skin7'}">checked</c:if>><span style="background:#ff5454;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin8" <c:if test="${arrangeInfo.bgColor == 'skin8'}">checked</c:if>><span style="background:#7dc9ff;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin9" <c:if test="${arrangeInfo.bgColor == 'skin9'}">checked</c:if>><span style="background:#ffc194;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin10" <c:if test="${arrangeInfo.bgColor == 'skin10'}">checked</c:if>><span style="background:#47d78b;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin11" <c:if test="${arrangeInfo.bgColor == 'skin11'}">checked</c:if>><span style="background:#a9b4f4;display:inline-block;width:20px;">&nbsp;</span></label>			                    	
			                    </td>
			            	</tr>
			            	
			            	<tr class="normalImgTr" style="display:none;">
			                    <th>일반이미지</th>
			                    <td>
			                    	<c:if test="${arrangeInfo.imgSavePath == null || arrangeInfo.imgSavePath == ''}">
			                    	<input type="file" name="normalImg" value="" accept="image/*"> 		   
			                    	</c:if>
			                    	
			                    	<c:if test="${arrangeInfo.imgSavePath != null && arrangeInfo.imgSavePath != ''}">
			                           	<div>
			                           		
			                           		<fmt:formatNumber value="${arrangeInfo.imgWidth}" type="number" var="imgW" />
			                           		<fmt:formatNumber value="${arrangeInfo.imgHeight}" type="number" var="imgH" />
			                           		
			                           		<c:if test="${imgW >= imgH}">
				                           		<c:if test="${imgW >= 180}">
				                           		<img src="${arrangeInfo.imgSavePath}" width="180">
				                           		</c:if>
				                           		
				                           		<c:if test="${imgW < 180}">
				                           		<img src="${arrangeInfo.imgSavePath}" width="${imgW}">
				                           		</c:if>
			                           		</c:if>
			                           		
			                           		<c:if test="${imgW < imgH}">
			                           			<c:if test="${imgH >= 80}">
			                           			<img src="${arrangeInfo.imgSavePath}" height="80">
			                           			</c:if>
			                           			
			                           			<c:if test="${imgH < 80}">
			                           			<img src="${arrangeInfo.imgSavePath}" height="${imgH}">
			                           			</c:if>
			                           		</c:if>
			                           		
			                           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn red sm" onclick="deleteNormalImg('${arrangeInfo.arrangeCode}');">삭제</button>
			                           	</div>
			                      	</c:if>
			                    	                 	
			                    </td>
			            	</tr>
			            	
			            	<tr class="arrangeDescTr">
			            		<td colspan="2"> 		
			            			<span style="color:blue;">	            			
				            			* 팀장은 배치크기에 상관없이 생성됩니다.
				            			<br>
				            			* 팀원이 없는 배치를 만들 때에는 칸:0, 줄:0 으로 설정하시면 됩니다.
				            		</span>
			            		</td>
			            	</tr>
			                
			                <tr class="utubeDescTr">
			            		<td colspan="2">
			            			<span style="color:blue;"> 			            			
			            				* 홍보영상관리에 등록된 유튜브 영상중 랜덤으로 1개가 반복재생됩니다.
			            			</span>
			            		</td>
			            	</tr>
			            	
			            	<tr class="alimyDescTr">
			            		<td colspan="2">
			            			<span style="color:blue;"> 			            			
			            				* 제주시 메인의 알리미 이미지가 슬라이드 형태로 표시됩니다.
			            			</span>
			            		</td>
			            	</tr>
			            	
			                <tr class="normalImgDescTr">
			            		<td colspan="2">
			            			<span style="color:blue;"> 			            			
			            				* 등록한 이미지 크기로 표시됩니다.
			            			</span>
			            		</td>
			            	</tr>
			            	
			            	<tr class="weatherDescTr">
			            		<td colspan="2">
			            			<span style="color:blue;"> 			            			
			            				* 기상청 날씨 및 미세먼지 정보가 표시됩니다.
			            			</span>
			            		</td>
			            	</tr>
			            	
			            </tbody>
			        </table>
		                    
			    </div> <!--//table-wrapper-->
		    
			</div>

			<div class="foot">
				<button type="submit" class="btn blue">수정</button>
				<button type="button" class="close btn">닫기</button>
			</div>
			
				<!-- 
					$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
					마지막은 다른 데이터로 변경하면 됨.
				-->
            	<input type="hidden" name="parsingPrevent" value="">
            
			</form>
			
		</div>
	</div>
</div> <!--//layer-popup-->