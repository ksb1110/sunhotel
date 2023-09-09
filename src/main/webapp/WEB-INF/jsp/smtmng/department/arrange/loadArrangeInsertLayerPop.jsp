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
<div id="arrangeInsertLayerPop" class="layer-popup">
	<div class="content-wrap">
		<div class="content">
			<div class="head">
				<h3 class="title">배치추가</h3>
				<button type="button" class="close"><img src="/images/admin/btn/close.png" alt="닫기"></button>
			</div>
			
			<form name="insert_arrange_form" id="insert_arrange_form" method="post" enctype="multipart/form-data" onsubmit="insertArrange();return false;">
			
			<input type="hidden" name="facilityCode" value="">
			<input type="hidden" name="arrangeCode" value="tempCode">
			<input type="hidden" name="pointX" value="0">
			<input type="hidden" name="pointY" value="0">
			
			<div class="main">
				
				<div class="table-wrapper">   	
  						
			        <table class="table-row th-left">
			            <colgroup>
			                <col style="width: 26%">
			                <col style="width: 74%">
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
			                    	<span style="color:blue;">* 배치코드는 자동 부여됩니다. ( 시설코드__000 형태 )</span>
			                    </td>
			                </tr>
			                
			                <tr>
			                    <th>배치타입</th>
			                    <td>
			                    	<div>
	                  					<label><input type="radio" name="arrangeType" value="A" onclick="changeArrangeType('insert');"> 제목</label>
	                  					&nbsp;&nbsp;&nbsp;
	                  					<label><input type="radio" name="arrangeType" value="B" onclick="changeArrangeType('insert');"> 부서장</label>
	                  					&nbsp;&nbsp;&nbsp;
	                  					<label><input type="radio" name="arrangeType" value="C" onclick="changeArrangeType('insert');" checked> 팀(팀장 + 팀원)</label>
	                  				</div>
	                  				<div>
	                  					<label><input type="radio" name="arrangeType" value="D" onclick="changeArrangeType('insert');" <c:if test="${not empty clockArrangeList}">disabled</c:if>> 시계<c:if test="${not empty clockArrangeList}">(추가됨)</c:if></label>
			                    		&nbsp;&nbsp;&nbsp;			                    	
	                  					<label><input type="radio" name="arrangeType" value="E" onclick="changeArrangeType('insert');" <c:if test="${not empty utubeArrangeList}">disabled</c:if>> 유튜브<c:if test="${not empty utubeArrangeList}">(추가됨)</c:if></label>
	                  					&nbsp;&nbsp;&nbsp;
	                  					<label><input type="radio" name="arrangeType" value="F" onclick="changeArrangeType('insert');" <c:if test="${not empty alimyArrangeList && alimyArrangeCnt > 1}">disabled</c:if>> 홍보이미지<c:if test="${not empty alimyArrangeList}">(${alimyArrangeCnt}개 추가됨)</c:if></label>	                  					
	                  				</div>
	                  				<div>
	                  					<label><input type="radio" name="arrangeType" value="G" onclick="changeArrangeType('insert');"> 일반이미지</label>
	                  					&nbsp;&nbsp;&nbsp;
	                  					<label><input type="radio" name="arrangeType" value="H" onclick="changeArrangeType('insert');" <c:if test="${not empty weatherArrangeList}">disabled</c:if>> 날씨<c:if test="${not empty weatherArrangeList}">(추가됨)</c:if></label>
			                    		&nbsp;&nbsp;&nbsp;
			                    		<label><input type="radio" name="arrangeType" value="I" onclick="changeArrangeType('insert');" <c:if test="${not empty buildingArrangeList}">disabled</c:if>> 청사안내버튼<c:if test="${not empty buildingArrangeList}">(추가됨)</c:if></label>
			                    	</div>
			                    </td>
			            	</tr>
			            	
			                <tr class="arrangeNameTr">
			                    <th>
			                    	<span class="arrangeNameSpan">팀명</span>
			                    </th>
			                    <td>
                      				<input type="text" style="width:100%;" name="arrangeName">
			                    </td>
			            	</tr>
			            	
			            	<tr class="nameFlowFlagTr">
			                    <th>
			                    	<span class="nameFlowFlagSpan">팀명 슬라이딩 효과</span>
			                    </th>
			                    <td>
                      				<label><input type="radio" name="nameFlowFlag" value="Y"> 적용함</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="nameFlowFlag" value="N" checked> 적용안함</label>
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
			                    	<label><input type="radio" name="sizeGubun" value="N" checked> 기본 사이즈</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="sizeGubun" value="S"> 작은 사이즈</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label id="sizeGubunB" style="display:none;"><input type="radio" name="sizeGubun" value="B"> 큰 사이즈</label>
			                    </td>
			             	</tr>
			             	
			             	<tr class="timeGubunTr" style="display:none;">
			                    <th>시간제</th>
			                    <td>
			                    	<label><input type="radio" name="timeGubun" value="A" checked> 12시간제</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="timeGubun" value="B"> 24시간제</label>
			                    </td>
			             	</tr>
			             	
			                <tr class="arrangeSizeTr">
			                    <th>팀원배치크기</th>
			                    <td>
                 					칸수 : 
                 					<select name="col">
                 						<c:forEach begin="0" end="12" varStatus="status">
                 							<option value="${status.count - 1}">${status.count - 1}</option>
                 						</c:forEach>
                 					</select>
                 					&nbsp;&nbsp;
                 					줄수 : 
                 					<select name="row">
                 						<c:forEach begin="0" end="10" varStatus="status">
                 							<option value="${status.count - 1}">${status.count - 1}</option>
                 						</c:forEach>
                 					</select>
			                    </td>
			            	</tr>
			            	
			            	
			                <tr class="teamLeaerPosTr">
			                    <th>팀장위치</th>
			                    <td>
                  					<label><input type="radio" name="teamLeaderPos" value="T" checked> 팀상단</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="teamLeaderPos" value="B"> 팀하단</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="teamLeaderPos" value="H"> 숨김</label>
			                    </td>
			            	</tr>
			            	
			            	<tr class="bgColorTr">
			                    <th>색상타입</th>
			                    <td>
			                    	<label><input type="radio" name="bgColor" value="skin1" checked><span style="background:#5468e1;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin2"><span style="background:#45bec9;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin3"><span style="background:#ae94ea;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin4"><span style="background:#ef75ba;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin5"><span style="background:#ffb400;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin6"><span style="background:#70db1a;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<br />
			                    	<label><input type="radio" name="bgColor" value="skin7"><span style="background:#ff5454;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin8"><span style="background:#7dc9ff;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin9"><span style="background:#ffc194;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin10"><span style="background:#47d78b;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin11"><span style="background:#a9b4f4;display:inline-block;width:20px;">&nbsp;</span></label>			                    	
			                    </td>
			            	</tr>
			            	
			            	<tr class="normalImgTr" style="display:none;">
			                    <th>일반이미지</th>
			                    <td>
			                    	<input type="file" name="normalImg" value="" accept="image/*"> 		                    	
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
			            	
			            	<tr class="utubeDescTr" style="display:none;">
			            		<td colspan="2">
			            			<span style="color:blue;"> 			            			
			            				* 홍보영상관리에 등록된 유튜브 영상중 랜덤으로 1개가 반복재생됩니다.
			            			</span>
			            		</td>
			            	</tr>
			            	
			            	<tr class="alimyDescTr" style="display:none;">
			            		<td colspan="2">
			            			<span style="color:blue;"> 			            			
			            				* 제주시 메인의 알리미 이미지가 슬라이드 형태로 표시됩니다.
			            			</span>
			            		</td>
			            	</tr>
			            	
			            	<tr class="normalImgDescTr" style="display:none;">
			            		<td colspan="2"> 		
			            			<span style="color:blue;">	            			
			            				* 등록한 이미지 크기로 출력됩니다.
			            			</span>
			            		</td>
			            	</tr>
			                
			                <tr class="weatherDescTr" style="display:none;">
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
				<button type="submit" class="btn blue">추가</button>
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