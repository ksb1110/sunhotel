<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date" %>
<c:set var="today" value="<%=new Date()%>" />
<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>" />



<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 자막관리 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertSubtitle() {
	 
	//자막
	var subtitle = $.trim($("textarea[name=subtitle]").val());
	if(subtitle.length < 1) {
		alert("자막을 입력해주세요.");
		$("textarea[name=subtitle]").focus();
		
		return false;
	}
	
	//시작일 종료일 날짜 체크
	var startDay = $("input[name=startDay]").val();
	var startHour = $("select[name=startHour]").val();
	var startMinute = $("select[name=startMinute]").val();
	var endDay = $("input[name=endDay]").val();
	var endHour = $("select[name=endHour]").val();
	var endMinute = $("select[name=endMinute]").val();
	
	var startDateStr = startDay + startHour + startMinute;
	var startDateStr2 = startDateStr.replace(/-/gi,"");
	var startDateStr3 = eval(startDateStr2);
	var endDateStr = endDay + endHour + endMinute;
	var endDateStr2 = endDateStr.replace(/-/gi,"");
	var endDateStr3 = eval(endDateStr2);
	
	if(startDateStr3 > endDateStr3) {
		alert("시작일이 종료일보다 클 수는 없습니다. 일시를 확인해주세요.");
		return false;
	}
	
	//시작일 종료일 셋팅
	$("input[name=startDttm]").val(startDay + " " + startHour + ":" + startMinute + ":00");
	$("input[name=endDttm]").val(endDay + " " + endHour + ":" + endMinute + ":00");
	
	// confirm.ins=등록하시겠습니까?
	if(confirm("<spring:message code='confirm.ins'/>")){
		
		var parameters = new FormData($('#insert_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/main/subtitle/subtitleInsert.ezax'/>",
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
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">자막 등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" action="<c:url value='/smtmng/main/subtitle/subtitleInsert.ezax'/>" onsubmit="insertSubtitle();return false;">
    
    <input type="hidden" name="startDttm" value="">
    <input type="hidden" name="endDttm" value="">
		
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
                            자막
                        </div>                    	
                    </th>
                    <td colspan="3">
                        <textarea name="subtitle" style="width:100%;"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            시작일
                        </div> 
                    </th>
                    <td colspan="3">
                    	<span class="date-wrap">
                        <input type="text" class="width100 datepicker" name="startDay" value="<fmt:formatDate value='${today}' pattern='yyyy-MM-dd' />">
                        </span>
                        
                        <select name="startHour">
                        	<c:forEach begin="0" end="23" step="1" var="no">
	                        	<fmt:formatNumber var="hour" minIntegerDigits="2" value="${no}" type="number"/>
	                        	<option value="${hour}">${hour}시</option>
                        	</c:forEach>	
                        </select>
                        
                        <select name="startMinute">
                        	<c:forEach begin="0" end="50" step="10" var="no">
	                        	<fmt:formatNumber var="minute" minIntegerDigits="2" value="${no}" type="number"/>
	                        	<option value="${minute}">${minute}분</option>
                        	</c:forEach>	     	
                        </select>
                    </td>
            	</tr>
            	<tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            종료일
                        </div> 
                    </th>
                    <td colspan="3">
                    	<span class="date-wrap">
                        <input type="text" class="width100 datepicker" name="endDay" value="<fmt:formatDate value='${tomorrow}' pattern='yyyy-MM-dd' />">
                        </span>
                        
                        <select name="endHour">
                        	<c:forEach begin="0" end="23" step="1" var="no">
	                        	<fmt:formatNumber var="hour" minIntegerDigits="2" value="${no}" type="number"/>
	                        	<option value="${hour}">${hour}시</option>
                        	</c:forEach>	         	
                        </select>
                        
                        <select name="endMinute">
                        	<c:forEach begin="0" end="50" step="10" var="no">
	                        	<fmt:formatNumber var="minute" minIntegerDigits="2" value="${no}" type="number"/>
	                        	<option value="${minute}">${minute}분</option>
                        	</c:forEach>	        	
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>정렬순서</th>
                    <td colspan="3">
                        <select name="sort">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${nextSort == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>표시여부</th>
                    <td colspan="3">
                        <label><input type="radio" name="showFlag" value="Y" checked> 예, 표시합니다.</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="showFlag" value="N"> 아니오, 표시하지 않습니다.</label>
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
$(function(){
	
	//시작일
    $("input[name=startDay]").datepicker({
    	showOn: "both",
        buttonImage: "/images/comm/jquery/calendar.gif",
        buttonImageOnly: true,
    	onSelect: function(selectedDate) {     
    		$("input[name=endDay]").datepicker("option","minDate", selectedDate)
		}
    });
	
  	//종료일
	$("input[name=endDay]").datepicker({
		showOn: "both",
        buttonImage: "/images/comm/jquery/calendar.gif",
        buttonImageOnly: true,
		onSelect: function(selectedDate) {     
			$("input[name=startDay]").datepicker("option","maxDate", selectedDate)
		}
	});
})
</script>
</body>
</html>