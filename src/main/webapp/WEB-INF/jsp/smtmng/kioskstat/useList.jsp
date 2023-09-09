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

<title>키오스크 이용통계 - 통계 - 제주시 스마트청사안내 관리자페이지</title>

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
    document.frm.action = "<c:url value='/smtmng/kioskstat/useList.ez'/>";
    document.frm.submit();
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="kioskstat"/>
		<jsp:param name="admin_menu2" value="useList"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">키오스크 이용통계</h2>    
           	
		    <div class="item-col3-wrapper">
		    
                <!-- //${searchVO.pageIndex}//${searchVO.sDttm}//${searchVO.eDttm}//${searchVO.kioskCode}// -->
		    	
		    	<form name="frm" id="frm" method="post" onSubmit="fn_Search('1');return false;">
		    	
				<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
                
                    <div class="table-wrapper">
                        <table class="table">
                            <colgroup>
                                <col style="width:80px;">
                                <col  > 
                                <col style="width:180px;">
                                <col>
                            </colgroup>
                            <tbody>
                                
                                <tr>
                                    <th class="text-left">키오스크</th> 
                                    <td>
                                        <select name="kioskCode">
                                            <option value="">==전체==</option>
                                                <option value="k01" <c:if test="${searchVO.kioskCode == 'k01'}">selected</c:if>>본관</option>
                                                <option value="k02" <c:if test="${searchVO.kioskCode == 'k02'}">selected</c:if>>1별관</option>
                                                <option value="k03" <c:if test="${searchVO.kioskCode == 'k03'}">selected</c:if>>2별관</option>
                                                <option value="k04" <c:if test="${searchVO.kioskCode == 'k04'}">selected</c:if>>4별관</option>
                                                <option value="k05" <c:if test="${searchVO.kioskCode == 'k05'}">selected</c:if>>5별관</option>
                                                <option value="k06" <c:if test="${searchVO.kioskCode == 'k06'}">selected</c:if>>본관중앙</option>
                                                <option value="k07" <c:if test="${searchVO.kioskCode == 'k07'}">selected</c:if>>6별관</option>
                                        </select>
                                    </td>                                
                                </tr>
                                <tr>
                                    <th class="text-left">검색기간</th>
                                    <td> 
                                            <span class="date-wrap"><input class="datepicker" name="sDttm" type="text" value="${sDttm}"></span>
                                            <span class="date-guide">~</span>
                                            <span class="date-wrap"><input class="datepicker" name="eDttm" type="text" value="${eDttm}"></span>
                                                 
                                            <button type="button" class="btn green" onclick="fn_setDate('${toweek}');">일주일</button>
                                            <button type="button" class="btn green" onclick="fn_setDate('${tomonth}');">1개월</button>   
                                    </td>
                                    
                                 
                                    <td style="border:0;"  >
                                        <button type="submit" class="btn blue">검색</button>
                                        <button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/kioskstat/useList.ez'/>';">전체</button>
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
                
                     <table class="table center" style="width:1000px;" >
                        <colgroup>
                            <col style="width:100px;"> 
                            <col style="width:300px;"> 
                            <col style="width:100px;"> 
                            <col style="width:100px;"> 
                            <col style="width:300px;"> 
                            <col style="width:100px;"> 
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순위</th> 
                                <th>페이지</th>
                                <th>빈도</th>
                                <th>페이지</th> 
                                <th>키워드</th>
                                <th>빈도</th>
                            </tr>
                        </thead>
                        <tbody>
                           <tr>
                            
                            <c:if test="${fn:length(resultList02) > 0}"> 
                                <c:forEach items="${resultList02}" var="item" varStatus="status" >
                                    <c:if test="${status.index < 10}">
                                        <td><!-- (${status.index})  --> ${item.rank}</td> 
                                        <td>${item.kioskAction}</td> 
                                        <td>${item.count}  </td>   
                                         
                                         <c:if test="${ status.index mod 2 eq 1 }"></tr><tr></c:if>
                                     </c:if>
                                </c:forEach>
                            </c:if>
                                                           
                            </tr>
                            
                        </tbody>
                        </table>
                        <br><br>
                        

                    <table class="table center">
                        <colgroup>
                            <col style="width:80px;"> 
                            <col style="width:100px;">
                            <col> 
                            <col> 
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th> 
                                <th>Kiosk</th> 
                                <th>페이지방문일시</th>
                                <th>페이지</th>
                                <th>경로</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:if test="${fn:length(resultList) > 0}">
                            <c:forEach items="${resultList}" var="item" varStatus="status">
                            <tr>
                                <td ><c:out value="${(searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count}"/></td> 
                                <td>${item.kioskCode}</td> 
                                <td>${item.regDttm}</td> 
                                <td>${item.kioskAction}</td>  
                                <td>${item.kioskUrl}</td>   
                            </tr>
                            </c:forEach>
                            </c:if>
                            
                            <c:if test="${fn:length(resultList) == 0}">
                            <!-- 조회된 자료가 없을 시 -->
                            <tr>
                                <td colspan="4">등록된 정보가 없습니다.</td>
                            </tr>
                            </c:if>
                            
                        </tbody>
                    </table>
                    
                     
                </div>
                
                <!--페이징-->
                <div class="paging-wrap" style="width:800px;" >
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