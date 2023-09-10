<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/user/include/top.jsp" %>

<title>보고서1 - 제주 썬호텔</title>

<script>

</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/user/header.ez" flush="false">
		<jsp:param name="admin_menu" value="main"/>
		<jsp:param name="admin_menu2" value="form1"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">              
           	           	
           	<div class="search-form">
	            <form>
	                <dl>
	                    <dt>검색기간</dt>
	                    <dd>
	                        <span class="date-wrap"><input class="datepicker" type="text"></span>
	                        <span class="date-guide">~</span>
	                        <span class="date-wrap"><input class="datepicker" type="text"></span>
	                        
	                        <script>
	                            //datepicker 임시용
	                            $( ".datepicker" ).datepicker({
	                                showOn: "both",
	                                buttonImage: "../../images/comm/jquery/calendar.gif",
	                                buttonImageOnly: true
	                            });
	                        </script>
	                    </dd>
	                    <dt>조건1</dt>
	                    <dd>
	                        <select style="width: 170px">
	                            <option value="">전체</option>
	                            <option value="">조건1</option>
	                            <option value="">조건2</option>
	                            <option value="">조건3</option>
	                        </select>
	                        <select style="width: 170px">
	                            <option value="" selected>전체</option>
	                            <option value="">조건1</option>
	                            <option value="">조건2</option>
	                            <option value="">조건3</option>
	                        </select>
	                    </dd>
	                    <dt>조건2</dt>
	                    <dd>
	                        <select style="width: 170px">
	                            <option value="">전체</option>
	                            <option value="">조건1</option>
	                            <option value="">조건2</option>
	                            <option value="">조건3</option>
	                        </select>
	                        <select style="width: 170px">
	                            <option value="" selected>전체</option>
	                            <option value="">조건1</option>
	                            <option value="">조건2</option>
	                            <option value="">조건3</option>
	                        </select>
	                        
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        
	                        <button type="button" class="btn blue">검색</button>
	                    </dd>
	                </dl>
	            </form>
	        </div> <!--//search-form-->
           
		    <h3 class="title2">
				보고서1
				<span class="side-wrap">
					<button type="button" class="btn green">인쇄하기</button>
				</span>
			</h3>
			
			<div class="table-wrapper">
	    		<table class="table center">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>항목1</th>
							<th>항목2</th>
							<th>항목3</th>
							<th>항목4</th>
							<th>항목5</th>
							<th>항목6</th>
							<th>항목7</th>
							<th>항목8</th>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
					</tbody>
				</table>
					
		    </div> <!-- //table-wrapper -->
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

</body>
</html>