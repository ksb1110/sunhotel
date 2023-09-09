<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

 
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %> 

<%@ page import="java.util.Calendar" %>
<%
    DecimalFormat df = new DecimalFormat("00");
    Calendar currentCalendar = Calendar.getInstance();

  //현재 날짜 구하기
    String strYear   = Integer.toString(currentCalendar.get(Calendar.YEAR));
    String strMonth  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
    String strDay   = df.format(currentCalendar.get(Calendar.DATE));
    String strDate = strYear +"-"+ strMonth +"-"+ strDay;

  //일주일 전 날짜 구하기
    currentCalendar.add(currentCalendar.DATE, -7);
    String strYear7   = Integer.toString(currentCalendar.get(Calendar.YEAR));
    String strMonth7  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
    String strDay7   = df.format(currentCalendar.get(Calendar.DATE));
    String strDate7 = strYear7 +"-"+ strMonth7 +"-"+ strDay7;

  //한달 전 날짜 구하기
    currentCalendar.add(currentCalendar.DATE, -24);
    String strYear31   = Integer.toString(currentCalendar.get(Calendar.YEAR));
    String strMonth31  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
    String strDay31   = df.format(currentCalendar.get(Calendar.DATE));
    String strDate31 = strYear31 +"-"+ strMonth31 +"-"+ strDay31;
%>

<!-- 현재날짜 -->
<c:set var="today" value='<%=strDate%>' />
<!-- 일주일전 -->
<c:set var="toweek" value='<%=strDate7%>' />
<!-- 한달전 -->
<c:set var="tomonth" value='<%=strDate31%>' />  
 
   
 <c:if test="${searchVO.sDttm ne null }">
    <c:set var="sDttm" value='${searchVO.sDttm}' />
    <c:set var="eDttm" value='${searchVO.eDttm}' />
 </c:if>
   


<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>이용 만족도 관리 - 커뮤니티 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

 
var pageIndex = 1;
var curPageCnt = 1;
var maxPageCnt = "${paginationInfo.totalPageCount}";
    
$(document).ready(function() {


	 
	$(function(){
	    
	    //시작일
	    $("input[name=sDttm]").datepicker({
	        showOn: "both",
	        buttonImage: "/images/comm/jquery/calendar.gif",
	        buttonImageOnly: true,
	        onSelect: function(selectedDate) {     
	            $("input[name=endDay]").datepicker("option","minDate", selectedDate)
	        },
	        defaultDate:'c'
	    });
	    
	    //종료일
	    $("input[name=eDttm]").datepicker({
	        showOn: "both",
	        buttonImage: "/images/comm/jquery/calendar.gif",
	        buttonImageOnly: true,
	        onSelect: function(selectedDate) {     
	            $("input[name=startDay]").datepicker("option","maxDate", selectedDate)
	        }
	    });
	})
	
	
    // 최초 컨테츠 수가 UnitSize미만을 경우 더보기 버튼 비활성화 
    if(curPageCnt == maxPageCnt){
        $("#btn_more").hide();
    }
    
});

function fn_setDate(date){
	
	$("input[name=sDttm]").val(date);
    $("input[name=eDttm]").val("${today}");
}
 
/**
 * 조회 & 페이징
 */
function fn_Search(pageIndex){
	document.frm.pageIndex.value = pageIndex;
	document.frm.action = "<c:url value='/smtmng/community/satiList.ez'/>";
	document.frm.submit();
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="community"/>
		<jsp:param name="admin_menu2" value="community"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">이용 만족도 관리</h2>     
             
		    <div class="item-col3-wrapper">
		    			    	
		    	<!--  //${searchVO.pageIndex}//${searchVO.sGender}//${searchVO.sAgeGroup}//${searchVO.sDttm}//${searchVO.eDttm}// -->
		    	
		    	<form name="frm" id="frm" method="post" onSubmit="fn_Search('1');return false;">
		    	
				<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
				
					<div class="table-wrapper">
						<table class="table">
							<colgroup>
								<col style="width:80px;">
							   	<col>
							</colgroup>
							<tbody>
							   	<tr>
							   		<th class="text-left">성별</th> 
							   		<td>
							   			<select name="sGender">
				                        	<option value="">==전체==</option>
                                                <option value="M" <c:if test="${searchVO.sGender == 'M'}">selected</c:if>>남 자</option>
                                                <option value="F" <c:if test="${searchVO.sGender == 'F'}">selected</c:if>>여 자</option>
				                        </select>
							   		</td>
							   		
							   	 
									<td style="border:0;" rowspan=3>
										<button type="submit" class="btn blue">검색</button>
										<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/community/satiList.ez'/>';">전체</button>
									</td>									
							    </tr>
							    
                                <tr>
                                    <th class="text-left">연령대</th>
                                    <td> 
                                            <c:forEach begin="10" end="70" step="10" var="item" >
                                                  <c:set var="checked_val" value='' />
			                                      <c:if test="${ null ne searchVO.sAgeGroup }" >
			                                          <c:forEach var="sAgeGroup" items="${searchVO.sAgeGroup}">  
			                                               <c:if test="${sAgeGroup eq item}">
                                                                <c:set var="checked_val" value='checked' />
                                                          </c:if>
                                                      </c:forEach>                    
			                                       </c:if>
                                              
                                                <input type="checkbox" name="sAgeGroup" value="${item}"   ${checked_val} > ${item} 대
                                                <c:if test="${item == 30 }"><br></c:if>
                                                <c:if test="${item == 70 }">이상</c:if>
                                            </c:forEach>   
                                    </td>
                                </tr>    
                                <tr>
                                    <th class="text-left">참여기간</th>
                                    <td> 
                                            <span class="date-wrap"><input class="datepicker" name="sDttm" type="text" value="${sDttm}"></span>
                                            <span class="date-guide">~</span>
                                            <span class="date-wrap"><input class="datepicker" name="eDttm" type="text" value="${eDttm}"></span>
	                                             
	                                        <button type="button" class="btn green" onclick="fn_setDate('${toweek}');">일주일</button>
	                                        <button type="button" class="btn green" onclick="fn_setDate('${tomonth}');">1개월</button>   
                                    </td>
                                </tr>     
                                
							</tbody>
						</table>
					</div>
				</form>
				
				<h3 class="title2">
					검색결과 <small>[총 <strong class="text-blue">${paginationInfo.totalRecordCount}</strong>건]</small>
				</h3>
				
		    	<div class="table-wrapper">
		    	
		    	     <table class="table center" style="width:500px;" >
                        <colgroup>
                            <col style="width:250px;"> 
                            <col style="width:100px;"> 
                            <col style="width:100px;">
                            <col style="width:100px;">
                            <col style="width:100px;"> 
                        </colgroup>
                        <thead>
                            <tr>
                                <th rowspan=2>참여일시</th> 
                                <th rowspan=2>응답수</th>
                                <th colspan=3>성별 </th>
                            </tr>
                            <tr>
                                <th>남자 </th>
                                <th>여자</th>
                                <th>무응답</th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr> 
                                <td >${sDttm} ~ ${eDttm}</td> 
                                <td >${resultList02.cnt }</td> 
                                <td >${resultList02.gm}</td> 
                                <td >${resultList02.gf }</td> 
                                <td >${resultList02.gn }</td>    
                            </tr>
                        </tbody>
                        </table>
                        <br><br>
                        
                        <table class="table center" style="width:900px;" >
                        <colgroup>
                            <col style="width:100px;"> 
                            <col style="width:100px;"> 
                            <col style="width:100px;">
                            <col style="width:100px;">
                            <col style="width:100px;">
                            <col style="width:100px;"> 
                            <col style="width:100px;"> 
                            <col style="width:100px;"> 
                            <col style="width:100px;">  
                        </colgroup>
                        <thead>
                            <tr>
                                <th colspan=8>연령대</th> 
                                <th rowspan=2>평균점수</th>
                            </tr>
                            <tr>
                                <th>10대</th>
                                <th>20대</th>
                                <th>30대</th>
                                <th>40대</th>
                                <th>50대</th>
                                <th>60대</th>
                                <th>70대 이상</th>
                                <th>무응답</th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr> 
                                <td >${resultList02.a1}</td>
                                <td >${resultList02.a2}</td>  
                                <td >${resultList02.a3}</td>  
                                <td >${resultList02.a4}</td>  
                                <td >${resultList02.a5}</td>  
                                <td >${resultList02.a6}</td>  
                                <td >${resultList02.a7}</td>  
                                <td >${resultList02.an}</td>    
                                <td >${resultList02.cav }</td>    
                            </tr>
                        </tbody>
                        </table>
                        <br><br>

		    		<table class="table center">
						<colgroup>
							<col style="width:100px;"> 
							<col style="width:250px;"> 
                            <col style="width:150px;">
							<col style="width:100px;">
							<col style="width:150px;"> 
						</colgroup>
						<thead>
							<tr>
								<th>번호</th> 
								<th>참여일시</th>
								<th>성별</th>
								<th>연령대</th>
								<th>점수</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td ><c:out value="${(searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count}"/></td> 
                                <td>${item.regDttm}</td> 
                                <td>${item.gender}</td> 
                                <td>${item.ageGroup}</td> 
                                <td>${item.point}</td>  
                                
                         
                                
                                 
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="5">등록된 정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					 
		    	</div>
		    	
		    	<!--페이징-->
				<div class="paging-wrap">
					<ul>
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_Search" />
					</ul>
				</div>
		    	
		    </div> <!-- //item-col3-wrapper -->
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

</body>
</html>