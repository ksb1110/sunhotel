/* ====================================================================================================================
* browser start
* ====================================================================================================================*/
//HTML5 표준이 정해져 있다.
var winWidth = window.innerWidth,                                       //창가로 사이즈
    winHeight = window.innerHeight,                                     //창세로 사이즈
    bodyScoll = $(window).scrollTop();                                  //스크롤 위치



//브라우저 버전 체크
var IEVersionCheck = function() {

    var word,
        version = "N/A",
        agent = navigator.userAgent.toLowerCase(),
        name = navigator.appName;

    // IE old version ( IE 10 or Lower )
    if ( name == "Microsoft Internet Explorer" ) word = "msie ";

    else {
        // IE 11
        if ( agent.search("trident") > -1 ) word = "trident/.*rv:";

        // IE 12  ( Microsoft Edge )
        else if ( agent.search("edge/") > -1 ) word = "edge/";
    }

    var reg = new RegExp( word + "([0-9]{1,})(\\.{0,}[0-9]{0,1})" );
    if (  reg.exec( agent ) != null  )
        version = RegExp.$1 + RegExp.$2;

    return version;
};





/* ====================================================================================================================
* function
* ====================================================================================================================*/
/* 화면 확대 축소 시작 IE 전용 */
var nowZoom = 100;                                          // 현재비율
var maxZoom = 150;                                          // 최대비율(500으로하면 5배 커진다)
var minZoom = 80;                                           // 최소비율

//브라우저 확대
function zoomIn()
{
    if(nowZoom < maxZoom){
        nowZoom += 5;                                       //25%씩 커진다.
    }
    else
    {
        return;
    }
    document.body.style.zoom = nowZoom + "%";

    var body_w = $(document).width();
    var win_w = $(window).width();

    $(window).scrollLeft((body_w - win_w) / 2);
}

//브라우저 축소
function zoomOut(){
    if(nowZoom > minZoom){
        nowZoom -= 5;                                       //25%씩 작아진다.
    }
    else
    {
        return;
    }

    document.body.style.zoom = nowZoom + "%";

    var body_w = $(document).width();
    var win_w = $(window).width();

    $(window).scrollLeft((body_w - win_w) / 2);
}

//브라우저 리셋
function zoomReset()
{
    nowZoom = 100;
    document.body.style.zoom = "100%";
}



//top button
function go_topBtn() {
    $('html, body').animate( { scrollTop : 0 }, 500);
}



//footer quick site
function site_move(strUrl){
    if(strUrl!=""){
        window.open(strUrl, '_blank');
    }
}





/* ====================================================================================================================
* scroll event
* ====================================================================================================================*/
var didScroll,
    start = 200;                                                        //스크롤 시작 이벤트 위치

$(window).scroll(function(event){
    didScroll = true;                                                   //스크롤 이벤트 부하에 따른 setInterval 사용
});

function header() {                                                     //동작구현
    var scrollHeight = $(window).scrollTop();

    if(scrollHeight > start) {
        //$('#header').addClass('active');
        //$('#main').addClass('active');
    }
    else {
        //$('#header').removeClass('active');
        //$('#main').removeClass('active');
    }
}

//top button fadeIn/Out
function scroll_topBtn() {
    var scrollHeight2 = $(window).scrollTop();
    var obj = '.go-top';

    if(scrollHeight2 > 200) {
        //$(obj).fadeIn('500');
    }
    else {
        //$(obj).fadeOut('100');
    }
}





/* ====================================================================================================================
* setInterval
* ====================================================================================================================*/
/*
setInterval(function() {
    if (didScroll) {
        
        didScroll = false;
    }
}, 250);
*/




/* ====================================================================================================================
* document ready
* ====================================================================================================================*/
$(document).ready(function(){
    
    //IE 하위 브라우저시 실행
    if(IEVersionCheck() == 9 || IEVersionCheck() == 8 || IEVersionCheck() == 7 || IEVersionCheck() == 5) {
        var error_browser = '';
        error_browser += '<div class="not-browser">';
        error_browser += '  <div class="warning"><span></span></div>';
        error_browser += '  <h1 class="error-title">현재 사용중인 브라우저는 지원되지 않습니다.<br><span class="sub">(In this broser isn&#39;t supported.)</span></h1>';
        error_browser += '  <p class="error-text">Microsoft의 지원 종료 된 브라우저를 사용하고 있습니다.</p>';
        error_browser += '  <p class="error-text">최신 버전의 Internet Explorer, Chroem, Safari, Firefox, Microsoft Edge<br>브라우저를 이용해 주세요.</p>';
        error_browser += '</div>';

        $('body').html(error_browser);
    }
    else {
        
    }

});





/* ====================================================================================================================
* window resize
* ====================================================================================================================*/
/*
$(window).resize(function(){
    if(this.resizeTO) {
        clearTimeout(this.resizeTO);
    }
    this.resizeTO = setTimeout(function() {
        $(this).trigger('resizeEnd');
    }, 200);
})
$(window).on('resizeEnd', function() {

});
*/


//자릿수만큼 앞에 빈공간은 0으로 채우는 함수
function pad(n, width) {
	n = n + '';
	return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}


