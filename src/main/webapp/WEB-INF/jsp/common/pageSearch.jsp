<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script language="javascript"> 

function fn_chosearchWord(){
	
    var search_word = $.trim($('#searchWord').val());

    search_word = specialCharRemove(search_word);
    $('#searchWord').val(search_word);
	
	var choKeyword = choHangul($("#searchWord").val());
	//초성검색 구분
	if (search_word!="" && choKeyword==""){ 
	    choDiv = 'Y'; 
	}else{ 
	    choDiv = 'N'; 
	} 
    //console.log(" choDiv =======> "+ choDiv);
	//console.log(search_word +" =======> "+ choKeyword);
    //console.log(":: =======> "+ search_word.length);
	
	//-- 초성입력시 검색 레이어 노출
	//if( choDiv == "Y" ){
    
    //--검색어가 있으면 일단 ajax Call~
	if(search_word.length > 1 ){
		
        $("#suggest_boxList").html("");
        
        //-- ajax call  
        $.ajax({
            type: 'POST',
            url: "/ajaxDeptEmployeeListChoYN.ez?choYN="+choDiv+"&searchWord="+search_word,
            success: function(data) {

                $("#suggest_boxList").html("");
                
                for(var i=0; i < data.SL.length;i++){
                    var item = data.SL[i]; 
                    //console.log("-----"+ i);
                    //trHtml   = "<li alt=\""+ item.name +"\" >"+ item.name + " : " + item.teamName +"과</li>";
                    
                    trHtml   = "<li alt=\""+ item.name +"\" ><span alt=\""+ item.name +"\" >"+ item.name + "</span>";
                    if( item.teamName != "" ){
                    	trHtml +=" : <span alt=\""+ item.teamName +"\" >" + item.teamName +"</span>";
                    }
                    if( item.departName != "" ){
                    	trHtml +=" : <span alt=\""+ item.departName +"\" >" + item.departName +"</span></li>";
                    }
                   	
                    
                    $("#suggest_boxList").append(trHtml);
                }
                
                //-- 검색어 반전색상
                var replace_searchword = "<strong>"+search_word+"</strong>"; 
                $('#suggest_boxList li span').each(function() {
                    var text = $(this).html();
                    $(this).html(text.replace(search_word , replace_searchword )); 
                });
                
                //-- 자동완성 span 영역 테스트
                $("#suggest_boxList li span").css("color","blue");
                $("#suggest_boxList li span").css("background-color","#ffffcc");
                
                $("#suggest_boxList li span").bind("click", function(){
                    //alert(" 초성검색  클릭 이벤트 발생");
                    $('#searchWord').val($(this).attr("alt"));
                    $("#suggest_box").hide();
                    
                    //검색시작
                    fn_validate_dept();                    
                }); 
                
                     
            },
            error: function(){
                console.log("error~");
            }
        });
        
		//--초성검색 후 노출
	    $("#suggest_box").show();
		
		
	}else{
        $("#suggest_box").hide();
        //$("#suggest_boxList").html("");
	}
	

}

/* 초성추출 */ 
function choHangul(str) { 
  cho = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]; 
  result = ""; 
  for(i=0;i<str.length;i++) { 
      code = str.charCodeAt(i)-44032; 
    if(code>-1 && code<11172) result += cho[Math.floor(code/588)]; 
  } 
  return result; 
} 

 
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
        $('#searchForm').submit();
    //}else{
    //    return false;
    //}
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


function onKeyDownEnter()
{
     if(event.keyCode == 13)
     {
          //TODO : 실행시킬 코드
    	 fn_validate_dept();
     }
}
 

$(document).ready(function(e) {
   /*
	//alert
    $('a#alert').click(function() {
        modal({
            type: 'alert',
            title: 'Alert',
            text: "Simple Message!"
        });
    });
    //confirm
    $('a#confirm').click(function() {
        modal({
            type: 'confirm',
            title: 'Confirm',
            text: 'Are you sure you want to delete your brain?',
            callback: function(result) {
                alert(result);
            }
        });
    });
    */
});
    
</script>
 
<%/* modal alert test 
	<a href="#" id="alert">Alert</a>
	<br> <a href="#" id="confirm">Confirm</a>
	*/
%>


<div class="content_top_wrap">
	<!--홈버튼-->
	<div class="home_btn_area">
		<button type="button" class="home_btn"
			onclick="location.href='/infomain.ez';">제주시 스마트 청사안내 메인 바로가기</button>
	</div>

	<!--상단 검색-->
	<div class="search_area">
		<form name="searchForm" id="searchForm" method="post"
			action="/dept.ez">
			<div class="container">
			    <input id="searchKioskCode" name="searchKioskCode"  value="${kioskCode}" style="display:none;" >
				<input id="searchWord" name="searchWord" type="text" placeholder="터치 하고 직원ㆍ업무ㆍ부서 초성 검색"  autocomplete="off"  onkeyup="fn_chosearchWord()" onKeyDown="onKeyDownEnter();">
				<button type="button" class="search_btn" onclick="fn_validate_dept();" >검색</button>
                        
                        <!--자동완성 레이어-->
                        <div class="suggest_box" id="suggest_box" style="display:none;" >
                            <div class="box_detail">
                                <ul class="data_list"  id="suggest_boxList" >
                                    <li alt="제주시청" ><strong>제주시</strong>청</li>
                                    <li><strong>제주시</strong> 청사</li>
                                    <li><strong>제주시</strong> 스마트 청사안내</li>
                                </ul>   
                            </div>  
                        </div>
                        <!--//자동완성 레이어-->
                        
			</div>
		</form>
	</div>
	<!--//상단 검색-->
</div>

 
            <!--검색어를 입력해 주세요. 레이어팝업-->
            <div class="popup_area alert_popup">
                <div class="detail_popup">
                    <div class="detail">
                        <div class="popup_contents">
                            <div class="alert_info">
                                <img src="/images/kiosk/icon/popup_icon2.png" alt="" class="alert_pop_img alert_pop_img01" style="display:none;" >
                                <img src="/images/kiosk/icon/popup_icon3.png" alt="" class="alert_pop_img alert_pop_img02" style="display:none;" >
                                <p class="text alert_popup_txt " >검색어를 입력해 주세요.</p>
                                <button type="button" class="confirm_btn" onclick="layer_close('alert_popup');$('.alert_popup').hide();" ><span>확인</span></button>
                            </div>
                        </div>
                        <span class="close"><button type="button">닫기</button></span>
                    </div>
                </div>
            </div>
            <!--//검색어를 입력해 주세요. 레이어팝업-->
            