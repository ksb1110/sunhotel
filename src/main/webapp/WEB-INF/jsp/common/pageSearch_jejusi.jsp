<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script language="javascript"> 

function fn_validate_dept(){
	var search_word = $.trim($('#searchWord').val());

	search_word = specialCharRemove(search_word);
    $('#searchWord').val(search_word);
    
    if($('#searchWord').val().length <= 0 ) {
        modal_alert_txt("검색어를 입력해주세요.","1");
    	//modal_alert("검색어를 입력해주세요.");
    	//alert("검색어를 입력해주세요.");
        return false;
    } 
      
    
    //if(confirm("검색하시겠습니까?")){
    //    $('#searchForm').submit();
    //}else{
    //    return false;
    //}
        
            // 윈도우인지 다른 브라우저인지 확인 
            var ua = window.navigator.userAgent;
            var postData;
            // 윈도우라면 ? 
            if (ua.indexOf('MSIE') > 0 || ua.indexOf('Trident') > 0) {
            	postData = encodeURI(search_word);
            } else {
            	postData = search_word;
            }
            
            
        //-- 부서원정보 리스트
        $("#pop_deptEmployeeList").html("");    
        //-- ajax call  
        $.ajax({
            type: 'POST',
            url: "/ajaxDeptEmployeeList.ez?searchWord="+postData,
            success: function(data) {  
                
                $("#dept_searchword").text("‘"+search_word+"’");
            	$("#dept_cnt").text(data.SL.length);
            	
                for(var i=0; i < data.SL.length;i++){
                    var item = data.SL[i]; 
                    
                    //console.log("-----"+ i);
                    trHtml   = "<tr><td class=\"align_center\">"+ item.position +"</td><td class=\"align_center\">"+ item.name +"</td><td class=\"align_center\">"+ item.tel +"</td>";
                    var job_html = nl2br(item.job); 
                    
                    trHtml += "<td>"+ job_html +"</td><td>";
                    

                    if(  item.gukCode != "ETC" ){
	                    trHtml += "<button type=\"button\" class=\"location_btn  "+ item.employeeSeq +"\" id=\"search_list_"+ item.employeeSeq +"\" date_id=\""+ item.employeeSeq +"\" >";                    
                        trHtml += " <span class=\"icon\"><img src=\"../../../images/kiosk/icon/location_icon1.png\"></span><span class=\"text\">위치안내</span></button>";
                    }
                    
                    trHtml += "</td></tr>";
                    $("#pop_deptEmployeeList").append(trHtml);
                    

                    trHtml = "<input type=\"text\" id=\"search_facilityCode_"+ item.employeeSeq +"\" value=\""+ item.facilityCode +"\" >";
                    trHtml += "<input type=\"text\" id=\"search_facilityName_"+ item.employeeSeq +"\" value=\""+ item.facilityName +"\"   >";
                    trHtml += "<input type=\"text\" id=\"search_floorName_"+ item.employeeSeq +"\" value=\""+ item.floorName +"\"   >";
                    trHtml += "<input type=\"text\" id=\"search_buildingName_"+ item.employeeSeq +"\" value=\""+ item.buildingName +"\"   >";
                    trHtml += "<input type=\"text\" id=\"search_Name_"+ item.employeeSeq +"\" value=\""+ item.name +"\"   >";
                    trHtml += "<input type=\"text\" id=\"search_deptCode_"+ item.employeeSeq +"\" value=\""+ item.departCode +"\" >";
                    //console.log(trHtml);
                    $("#pop_deptEmployeeListInput").append(trHtml);
                   
                }
                

                var replace_searchword = "<span class=\"font_color05\">"+search_word+"</span>"; 
                $('#pop_deptEmployeeList td').each(function() {
                    var text = $(this).html();
                    $(this).html(text.replace(search_word , replace_searchword )); 
                });
                
                layer_popup('.search_detail_popup');
                
                //-- 각 위치버튼에 .bind()
                // onclick="layer_popup('.search_info_popup');$('.search_detail_popup').hide();$('.opacityBg').hide();return false;
                
                setTimeout(function() {
		                for(var i=0; i < data.SL.length;i++){
		                    var item = data.SL[i];  
		                    
		                    //console.log(" ss item.employeeSeq = "+  item.employeeSeq);
		                    
		                    var pathFinder_id = "search_list_"+ item.employeeSeq;
		                    $("#"+pathFinder_id).bind( "click", function() {

	                            var pathFinder_seq = $(this).attr("date_id");
                                //console.log("  item.employeeSeq = "+  pathFinder_seq);
		                    	fn_pathInfo(pathFinder_seq);
	                            
		                    	
		                    });
		                }
                 }, 500);
                
                
            },
            error: function(){
                //console.log("error~");
            }
        });
        
    
} 

function fn_pathInfo(seq){
    console.log(seq);
    

    var deptCode = $("#search_deptCode_"+seq).val();
    
    
    if( deptCode == "1001001003000" || deptCode == "1001001004000" || deptCode == "1001001005000" ){
         
                switch(deptCode){
                    case "1001001003000": 
                        var dept_nm = "제주보건소";
                        var dept_position = "<dt>제주보건소：</dt><dd>제주특별자치도 제주시 연삼로 264<br>(우) 63219 (지번) 도남동 567-1</dd>";
                        var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_jeju_img.jpg\" alt=\"제주보건소\" >";
                    break;
                    case "1001001005000": 
                        var dept_nm = "동부보건소";
                        var dept_position = "<dt>동부보건소：</dt><dd>제주특별자치도 제주시 구좌읍 김녕로14길 6<br>(우) 63357 (지번) 구좌읍 김녕리 1696</dd>";
                        var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_ejeju_img.jpg\" alt=\"동부보건소\">";
                    break;
                    case "1001001004000": 
                        var dept_nm = "서부보건소";
                        var dept_position = "<dt>서부보건소：</dt><dd>제주특별자치도 제주시 한림읍 강구로5<br>(우) 63028 (지번) 한림읍 한림리 966-1</dd>";
                        var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_wjeju_img.jpg\" alt=\"서부보건소\">";
                    break;
                    default:
                
                }   
              
                $("#pop_name03").html(dept_nm);         
                $("#pop_position03").html(dept_position);
                $("#popup_photo03").html(dept_img);
                
                layer_popup('.location_popup2');
                $('.search_detail_popup').hide();
                $('.opacityBg').hide();
        
    }else{
    
			    $("#search_pop_name").text($("#search_Name_"+seq).val());
			    $("#search_pop_path").text( $("#search_buildingName_"+seq).val() +" "+ $("#search_floorName_"+seq).val() +" "+ $("#search_facilityName_"+seq).val());
			        
			    layer_popup('.search_info_popup');
			    $('.search_detail_popup').hide();
			    $('.opacityBg').hide();
			    
			
			    var facility_code = $("#search_facilityCode_"+seq).val();
			    var bc = facility_code.substring(0,3);
			    var fc = facility_code.substring(6,7);
			    
			    console.log(facility_code  +", "+ bc +", "+ fc);
			    
			    
			    /*
			    setTimeout(function() {
			    	fn_gomap02(bc,fc,facility_code);
			    }, 1000);
			    */
    }
    
}

function modal_alert_txt(msg,imgchk){
    
    $(".alert_pop_img").hide();
    $(".alert_pop_img0"+imgchk).show();
    $(".alert_popup_txt").text(msg);
    layer_popup('.alert_popup');
}

function modal_alert(msg){
	 //alert
        modal({
            type: 'alert',
            title: '부서 바로찾기',
            text: msg
        });
} 

//정규식 특수문자 제거하기
function specialCharRemove(obj) {
	 var str = obj;

	    var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	
    	 if(regExp.test(str)){
    	        //특수문자 제거
    	        var str = str.replace(regExp, "");
    	        console.log("특수문자를 제거했습니다. ==>" + str);
    	    }else{
    	        console.log("정상적인 문자입니다. ==>" + str);
    	    }
    	    //특수문자 검증 end
    return str
}
 

$(document).ready(function(e) {
 
	
});
    
</script>
 
 
                <!--상단 검색-->
                <div class="search_area">
                    <form name="searchForm" id="searchForm" method="post" >
                    <div class="container">
                        <input id="searchKioskCode" name="searchKioskCode"  value="${kioskCode}" style="display:none;" >
                        <input id="searchWord" name="searchWord" type="text" placeholder="터치 하고 직원ㆍ업무ㆍ부서 검색"><button type="button" class="search_btn" onclick="fn_validate_dept();">검색</button>
                    </div>
                    </form> 
                </div>
                <!--//상단 검색-->
      

  
                <!--검색어를 입력해 주세요. 레이어팝업-->
                <div class="popup_area alert_popup">
                    <div class="detail_popup">
                        <div class="detail">
                            <div class="popup_contents">
                                <div class="alert_info">
                                    <img src="../../../images/kiosk/icon/popup_icon2.png" alt="">
                                    <p class="text">검색어를 입력해 주세요.</p>
                                <button type="button" class="confirm_btn" onclick="layer_close('alert_popup');$('.alert_popup').hide();" ><span>확인</span></button>
                                </div>
                            </div>
                            <span class="close"><button type="button">닫기</button></span>
                        </div>
                    </div>
                </div>
                <!--//검색어를 입력해 주세요. 레이어팝업-->