<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>이용가이드  - 제주시 스마트청사 안내</title> 


 
    
<script language="javascript">
$(document).ready(function(){
       
    
});
</script>



</head>
<body>

<div id="wrap">
    <!--Side 영역-->
    <div id="side_wrap">
    
    <%@ include file="/WEB-INF/jsp/common/pageHeader.jsp" %>
    

    <%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
    
    </div>
    <!--//Side 영역-->
    
    <!--Contents 영역-->
    <main id="main_wrap">
        <section id="container_wrap">
            
            <%/* home btn, search area - content_top_wrap */%>
            <%@ include file="/WEB-INF/jsp/common/pageSearch.jsp" %>
            
            
            <div class="content_area">          
                <div class="container">
                    <div id="contents"> 
	                    <!--실제 컨텐츠-->    
	                   	<iframe src="/htmls/kiosk/guide/guide_content.htm" frameborder="0" style="width: 100%; height: 920px;"></iframe>
	                    <!--//실제 컨텐츠--> 
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!--//Contents 영역--> 
    
    
</div>
</body>
</html> 

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>  