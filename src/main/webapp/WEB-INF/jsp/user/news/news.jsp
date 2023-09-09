<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>제주시소식  - 제주시 스마트청사 안내</title> 


 
    
<script language="javascript">

function fn_newsList(){
	
	//-- ajax call  
    $.ajax({
        type: 'POST',
        url: "/api/ajaxNewsList.ez?nid=", 
        success: function(data) {
            //jsonNewsList:[{noticeId,regDttm,subject},{noticeId,regDttm,subject},{noticeId,regDttm,subject},{noticeId,regDttm,subject},...]            
            //console.log(data);
            $("#newsList_UL li").remove();
            //console.log(" data.newsList.length = "+ data.newsList.length);
            $.each(data.newsList, function(index, val) {
            	//console.log(" index = "+ index + "val = "+val.noticeId);
                
            	if(index == 0){
            		fn_newsDetail(val.noticeId);
            	}
            	li ='<li id="'+ val.noticeId+'" ><a onclick="fn_newsDetail(\''+ val.noticeId+'\');" ><em>'+ val.subject +'</em><span class="date">'+val.regDttm+'</span></a></li>';
                   
            	$("#newsList_UL").append(li);
            });
            
            
            
        },
        error: function(){
            //console.log("error~");
                
        }
    });
}
function fn_newsDetail(idx){
	
    //-- ajax call  
    $.ajax({
        type: 'POST',
        url: "/api/ajaxNewsView.ez?nid="+idx, 
        success: function(data) {  

            //console.log(data);
            //http://www.jejusi.go.kr/webservice/jejusiNewsDetail.ac?noticeId=ebcc45f235ad4294bc3333168ba882f4
            //jsonNewsDetail{contents,depart,writeName,regDttm,subject,tel,inqCnt}
            //jsonNewsImgList[]
            $("#newsList_UL li").removeClass();
            
            $.each(data.newsView, function(index, val) {
                //console.log(" index = "+ index + "val = "+val.noticeId);
                
                if(index == 0){

                    var depart       = val.depart;
                    var contents    = val.contents;
                    var inqCnt       = val.inqCnt;
                    var regDttm     = val.regDttm;
                    var subject      = val.subject;
                    var tel            = val.tel;
                    var writeName = val.writeName;
                    
                    contents = nl2br (contents); //-- console.log(subject);
                    $("#view_title").html(subject);
                    $("#view_dttm").html(regDttm);
                    $("#view_content").html(contents); 
                    $("#writerInfo").html("<dl><dt>작성자</dt><dd>"+writeName+"</dd></dl><dl><dt>조회수</dt><dd>"+inqCnt+"</dd></dl><dl><dt>부서</dt><dd>"+depart+"</dd></dl><dl><dt>연락처</dt><dd>"+tel+"</dd></dl>");
                     
                    //-- 추후 제거예정 
                    /*
                    setTimeout(function() {

                        var img =  $("#view_content img").attr("src");
                        var img_front = img.replace("http://www.jejusi.go.kr/storage/files/board/","");
                        var img_moddle = img_front.substring( 0, 8 );
                        var img_end = img_front.substring( 8, img_front.length   );
                        console.log(img);
                        console.log(img_moddle);
                        console.log(img_end);
                        
                        $("#view_content img").attr("src", "http://www.jejusi.go.kr/storage/files/board/" +img_moddle +"/"+ img_end);
                        //http://www.jejusi.go.kr/storage/files/board/201907181563410787594_89e515909a7b40829fc398c3d5b8e59e.jpg
                        
                        
                    }, 500);
                    */
                    //-- 추후 제거예정
                    
                    setTimeout(function() {
                        $("#view_content img").css("max-width","1200px");
                    }, 500);
                    
                    
                }else{
                    var imgFullPath = val.imgFullPath;
                    $("#view_content").append("<p><img src=\""+ imgFullPath  +"\" ></p>");
                }
                   
            });
                        
            $("#"+idx).addClass("active");
            
            
            

        },
        error: function(){
            //console.log("error~");
                
        }
    });
			
}

function nl2br (str, is_xhtml) {
    if (typeof str === 'undefined' || str === null) {
        return '';
    }
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
}

$(document).ready(function(){
       
	fn_newsList();
    
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
                    
                       
                        <div class="news_wrap">
                            <div class="news_list_area">
                                <h2><img src="/images/kiosk/icon/notice_icon1.png" alt=""><span>제주시</span> 새소식</h2>
                                <div class="news_list">
                                    <ul id="newsList_UL" >
                                        <!-- 
                                        <li>
                                            <a href="#"><em>2019년 저소득주민 등 재래식화장실 정비 지원사업 4차 모집공고</em>
                                            <span class="date">2019-06-24</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><em>제주시 시간선택제임기제공무원(문화도시조성사업) 임용시험 계획 재공고</em>
                                            <span class="date">2019-06-24</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><em>제주시 일반임기제지방공무원(무대기계, 무대음향) 서류전형 합격자 발표 및 시험계획 재공고</em>
                                            <span class="date">2019-06-24</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><em>2019년 하계 대학생아르바이트 선발자 명단 공개</em>
                                            <span class="date">2019-06-24</span></a>
                                        </li>
                                        <li class="active">
                                            <a href="#"><em>2019년 7월1일부터 차고지증명제 확대 시행됩니다.</em>
                                            <span class="date">2019-06-24</span></a>
                                        </li> 
                                        -->
                                    </ul>
                                </div>
                            </div>  
                            
                            
                            <div class="news_detail_area">
                                <div class="title">
                                    <h2><span  id="view_title" >_</span></h2>
                                    <span class="date"  id="view_dttm">_</span>
                                </div>
                                <div class="news_detail">
                                    <div class="view_content" id="view_content" >
                                        <!-- 
                                        2019년 7월 1일부터 차고지증명제가 제주도 전지역에 확대 시행됩니다. 
                                        <br/>차고지증명제 홍보동영상입니다.<br>
                                        2019년 7월 1일부터 차고지증명제가 제주도 전지역에 확대 시행됩니다. 
                                        <br/>차고지증명제 홍보동영상입니다.<br>
                                        2019년 7월 1일부터 차고지증명제가 제주도 전지역에 확대 시행됩니다. 
                                        <br/>차고지증명제 홍보동영상입니다.
                                        
                                        <div class="video">
                                            <iframe src="https://www.youtube.com/embed/4BWhU9HQ5_k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>   
                                        </div>
                                        -->
                                        
                                    </div>
                                    <div class="view_info" id="writerInfo" >
                                        <dl>
                                            <dt>작성자</dt>
                                            <dd></dd>
                                        </dl>
                                        <dl>
                                            <dt>조회수</dt>
                                            <dd></dd>
                                        </dl>
                                        <dl>
                                            <dt>부서</dt>
                                            <dd></dd>
                                        </dl>
                                        <dl>
                                            <dt>연락처</dt>
                                            <dd></dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>  
                        
                        <!-- <div class="paging_wrap"><button type="button" class="prev_btn">이전페이지</button> <button type="button" class="next_btn">다음페이지</button></div> -->
 
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