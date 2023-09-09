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

<title>등록 - 직원부재중관리 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertEmptyLog() {
	 
	//직원 연결여부
	var employeeSeq = $.trim($("input[name='employeeSeq']").val());
	if(employeeSeq.length < 1) {
		alert("직원정보를 연결해주세요.");
		return false;
	}
	
	//시작일 종료일 날짜 체크
	var emptyStartDay = $("input[name=emptyStartDay]").val();
	var emptyStartHour = $("select[name=emptyStartHour]").val();
	var emptyStartMinute = $("select[name=emptyStartMinute]").val();
	var emptyEndDay = $("input[name=emptyEndDay]").val();
	var emptyEndHour = $("select[name=emptyEndHour]").val();
	var emptyEndMinute = $("select[name=emptyEndMinute]").val();
	
	var emptyStartDateStr = emptyStartDay + emptyStartHour + emptyStartMinute;
	var emptyStartDateStr2 = emptyStartDateStr.replace(/-/gi,"");
	var emptyStartDateStr3 = eval(emptyStartDateStr2);
	var emptyEndDateStr = emptyEndDay + emptyEndHour + emptyEndMinute;
	var emptyEndDateStr2 = emptyEndDateStr.replace(/-/gi,"");
	var emptyEndDateStr3 = eval(emptyEndDateStr2);
	
	if(emptyStartDateStr3 > emptyEndDateStr3) {
		alert("시작일이 종료일보다 클 수는 없습니다. 일시를 확인해주세요.");
		return false;
	}
	
	//시작일 종료일 셋팅
	$("input[name=emptyStartDttm]").val(emptyStartDay + " " + emptyStartHour + ":" + emptyStartMinute + ":00");
	$("input[name=emptyEndDttm]").val(emptyEndDay + " " + emptyEndHour + ":" + emptyEndMinute + ":00");
	
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
			url:"<c:url value='/smtmng/department/emptyLog/emptyLogInsert.ezax'/>",
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
	
//직원연결 검색
function selectEmployeePop() {
	
	window.open("/smtmng/department/employee/selectEmployeePop.ez", "employeeSelect", 'resizable=yes,scrollbars=yes,width=1000,height=750');
}

//직원검색창에서 직원을 선택해서 실행하는 함수
function choiceEmployee(employeeSeq, name) {	
	
	$("#employeeChoiceDiv").html(name).show();
	$("input[name='employeeSeq']").val(employeeSeq);
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">직원부재중정보 등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" onsubmit="insertEmptyLog();return false;">
    
    <input type="hidden" name="emptyStartDttm" value="">
    <input type="hidden" name="emptyEndDttm" value="">
    <input type="hidden" name="employeeSeq" value="${employeeVO.employeeSeq}">
		
    <div class="table-wrapper">   	
    	
        <table class="table-row th-left">
            <colgroup>
                <col style="width: 30%">
                <col style="width: 70%">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                    		직원연결
                    	</div>
                    </th>
                    <td>
                    	<c:choose>
                    		<c:when test="${empty employeeVO.employeeSeq}">
                    			<span class="label black" id="employeeChoiceDiv" style="display:none;">선택됨</span>
                    			<button type="button" class="btn blue sm" onclick="selectEmployeePop();">직원검색</button>
                    		</c:when>
                    		<c:otherwise>
                    			<span class="label black" id="employeeChoiceDiv">${employeeVO.name}</span>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            부재중 시작일시
                        </div> 
                    </th>
                    <td>
                    	<span class="date-wrap">
                        <input type="text" class="width100 datepicker" name="emptyStartDay" value="<fmt:formatDate value='${today}' pattern='yyyy-MM-dd' />">
                        </span>
                        
                        <select name="emptyStartHour">
                        	<c:forEach begin="0" end="23" step="1" var="no">
	                        	<fmt:formatNumber var="hour" minIntegerDigits="2" value="${no}" type="number"/>
	                        	<option value="${hour}">${hour}시</option>
                        	</c:forEach>	
                        </select>
                        
                        <select name="emptyStartMinute">
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
                            부재중 종료일시
                        </div> 
                    </th>
                    <td>
                    	<span class="date-wrap">
                        <input type="text" class="width100 datepicker" name="emptyEndDay" value="<fmt:formatDate value='${tomorrow}' pattern='yyyy-MM-dd' />">
                        </span>
                        
                        <select name="emptyEndHour">
                        	<c:forEach begin="0" end="23" step="1" var="no">
	                        	<fmt:formatNumber var="hour" minIntegerDigits="2" value="${no}" type="number"/>
	                        	<option value="${hour}">${hour}시</option>
                        	</c:forEach>	         	
                        </select>
                        
                        <select name="emptyEndMinute">
                        	<c:forEach begin="0" end="50" step="10" var="no">
	                        	<fmt:formatNumber var="minute" minIntegerDigits="2" value="${no}" type="number"/>
	                        	<option value="${minute}">${minute}분</option>
                        	</c:forEach>	        	
                        </select>
                    </td>
                </tr>
                
                <!-- 
                <tr>
                    <th>부재중내용</th>
                    <td>
                        <textarea name="emptyDesc" style="width:100%;height:80px;"></textarea>
                    </td>
                </tr>
                -->
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
    $("input[name=emptyStartDay]").datepicker({
    	showOn: "both",
        buttonImage: "/images/comm/jquery/calendar.gif",
        buttonImageOnly: true,
    	onSelect: function(selectedDate) {     
    		$("input[name=emptyEndDay]").datepicker("option","minDate", selectedDate)
		}
    });
	
  	//종료일
	$("input[name=emptyEndDay]").datepicker({
		showOn: "both",
        buttonImage: "/images/comm/jquery/calendar.gif",
        buttonImageOnly: true,
		onSelect: function(selectedDate) {     
			$("input[name=emptyStartDay]").datepicker("option","maxDate", selectedDate)
		}
	});
})
</script>
</body>
</html>