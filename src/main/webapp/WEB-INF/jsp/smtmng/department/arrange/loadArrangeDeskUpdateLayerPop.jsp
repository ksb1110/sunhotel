<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
pageContext.setAttribute("cr", "\r");
pageContext.setAttribute("cn", "\n");
pageContext.setAttribute("crcn", "\r\n");
pageContext.setAttribute("sp", "&nbsp;");
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("lt1", "&lt;");
pageContext.setAttribute("gt1", "&gt;");
pageContext.setAttribute("lt2", "<");
pageContext.setAttribute("gt2", ">");
%>

<!-- 
	해당 페이지에서 사용하는 자바스크립트 함수는 이 페이지를 로딩하는 페이지에 있다.
 -->

<!--popup content-->
<div id="arrangeDeskUpdateLayerPop" class="layer-popup">
	<div class="content-wrap">
		<div class="content">
			<div class="head">
				<h3 class="title">좌석배치정보수정</h3>
				<button type="button" class="close"><img src="/images/admin/btn/close.png" alt="닫기"></button>
			</div>
			
			<form name="update_arrange_desk_form" id="update_arrange_desk_form" method="post" onsubmit="updateArrangeDesk();return false;">
			
			<input type="hidden" name="deskSeq" value="${arrangeDeskInfo.deskSeq}">
			<input type="hidden" name="facilityCode" value="${arrangeDeskInfo.facilityCode}">
			<input type="hidden" name="arrangeCode" value="${arrangeDeskInfo.arrangeCode}">
			<input type="hidden" name="employeeSeq" value="">
  					
			<div class="main">
				
				<div class="table-wrapper">   	
  						
			        <table class="table-row th-left">
			            <colgroup>
			                <col style="width: 30%">
			                <col style="width: 70%">
			            </colgroup>
			            <tbody>		                
			                
			                <tr>
			                    <th>
			                    	직원연결
			                    	<c:if test="${not empty arrangeDeskInfo.employeeSeq && arrangeDeskInfo.employeeSeq > 0}">
			                    	<button type="button" class="btn red sm" onclick="choiceEmployee('0','');">연결해제</button>
			                    	</c:if>
			                    </th>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${not empty arrangeDeskInfo.employeeSeq && arrangeDeskInfo.employeeSeq > 0}">
					                    	${arrangeDeskInfo.navigator} (${arrangeDeskInfo.name})
			                    		</c:when>
			                    		<c:otherwise>
			                    			<button type="button" class="btn blue sm" onclick="selectEmployeePop();">직원검색</button>
			                    		</c:otherwise>
			                    	</c:choose>
			                    </td>
			                </tr>
			                
			                <c:if test="${not empty arrangeDeskInfo.employeeSeq && arrangeDeskInfo.employeeSeq > 0}">
			                <tr>
			                    <th>
			                    	사진			                    	
			                    	<button type="button" class="btn blue sm" onclick="updateEmployeeDisplayPop('${arrangeDeskInfo.employeeSeq}');">수정</button>
			                    	<br />
			                    	(109 x 150)
			                    </th>
			                    <td>
			                    	 <c:if test="${not empty arrangeDeskInfo.memberImgPath}">
			                    	 <img src="${arrangeDeskInfo.memberImgPath}" style="width:120px;">
			                    	 </c:if>
			                    	 <c:if test="${empty arrangeDeskInfo.memberImgPath}">
			                    	 미등록
			                    	 </c:if>
			                    </td>
			                </tr>
			                
			                <tr>
			                    <th>
			                    	업무
			                    	<button type="button" class="btn blue sm" onclick="updateEmployeeDisplayPop('${arrangeDeskInfo.employeeSeq}');">수정</button>
			                    </th>
			                    <td>
			                    	
			                    	<c:if test="${not empty arrangeDeskInfo.deskJob}">
			                    	<!-- jstl로 변환처리 -->
									<c:set var="cmt" value="${fn:replace(arrangeDeskInfo.deskJob,lt2,lt1)}" />
									<c:set var="cmt" value="${fn:replace(cmt,gt2,gt1)}" />
									<c:set var="cmt" value="${fn:replace(cmt,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									
									<!-- 화면에 출력하기 -->
									<c:out value="${cmt}" escapeXml="false"/> 
									</c:if>
									
									<c:if test="${empty arrangeDeskInfo.deskJob}">
									미등록
									</c:if>
									
			                    </td>
			                </tr>
			                </c:if>
			                
			                <c:if test="${arrangeDeskInfo.col == '0'}"> <!-- 팀장인 경우에만  -->
			            	<tr class="arrangeNameTr">
			                    <th>
			                    	<span class="arrangeNameSpan">직책명</span>
			                    </th>
			                    <td>
                      				<input type="text" style="width:100%;" name="positionNm" value="${arrangeDeskInfo.positionNm}">
			                    </td>
			            	</tr>
			            	</c:if>
			            	
			                <tr class="teamLeaerPosTr">
			                    <th>노출여부</th>
			                    <td>
                  					<label><input type="radio" name="showFlag" value="Y" <c:if test="${arrangeDeskInfo.showFlag == 'Y'}">checked</c:if>> 노출함.</label>
                  					&nbsp;&nbsp;&nbsp;
                  					<label><input type="radio" name="showFlag" value="N" <c:if test="${arrangeDeskInfo.showFlag == 'N'}">checked</c:if>> 노출안함.</label>
			                    </td>
			            	</tr>
			            	
			            	<tr class="bgColorTr">
			                    <th>색상타입</th>
			                    <td>
			                    	<label><input type="radio" name="bgColor" value="skin1" <c:if test="${arrangeDeskInfo.bgColor == 'skin1'}">checked</c:if>><span style="background:#5468e1;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin2" <c:if test="${arrangeDeskInfo.bgColor == 'skin2'}">checked</c:if>><span style="background:#45bec9;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin3" <c:if test="${arrangeDeskInfo.bgColor == 'skin3'}">checked</c:if>><span style="background:#ae94ea;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin4" <c:if test="${arrangeDeskInfo.bgColor == 'skin4'}">checked</c:if>><span style="background:#ef75ba;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin5" <c:if test="${arrangeDeskInfo.bgColor == 'skin5'}">checked</c:if>><span style="background:#ffb400;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin6" <c:if test="${arrangeDeskInfo.bgColor == 'skin6'}">checked</c:if>><span style="background:#70db1a;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<br />
			                    	<label><input type="radio" name="bgColor" value="skin7" <c:if test="${arrangeDeskInfo.bgColor == 'skin7'}">checked</c:if>><span style="background:#ff5454;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin8" <c:if test="${arrangeDeskInfo.bgColor == 'skin8'}">checked</c:if>><span style="background:#7dc9ff;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin9" <c:if test="${arrangeDeskInfo.bgColor == 'skin9'}">checked</c:if>><span style="background:#ffc194;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin10" <c:if test="${arrangeDeskInfo.bgColor == 'skin10'}">checked</c:if>><span style="background:#47d78b;display:inline-block;width:20px;">&nbsp;</span></label>
			                    	<label><input type="radio" name="bgColor" value="skin11" <c:if test="${arrangeDeskInfo.bgColor == 'skin11'}">checked</c:if>><span style="background:#a9b4f4;display:inline-block;width:20px;">&nbsp;</span></label>			                    	
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