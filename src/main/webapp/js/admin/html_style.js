/* ====================================================================================================================
* style (layer popup 등)
* ====================================================================================================================*/

//layer popup (타켓지정)
function layer_popup(obj){
	if($(obj).is(":hidden")){
		$(obj).show();
		$('body').after('<div class="lock-bg"></div>'); // 검은 불투명 배경

		//position > absolute에 따른 높이 제어
		var winHeight = $(window).height()/2;
		var objHeight = $(obj).height()/2;
		var scrollHeight = $(document).scrollTop();
		var winHeight2 = $(window).height();
		var scrollHeight2 = $(window).scrollTop();
		var popupHeight = $('.layer-popup').height()+100;
		
		//$('.layer-popup').css('top', scrollHeight+winHeight-objHeight);
		//$('.layer-popup').css('top', scrollHeight+winHeight-objHeight-150); //#main 속성에 따른 추가			
		
		/*if(scrollHeight2 < 100 || winHeight2 < popupHeight) {
			$('.layer-popup').animate( {'top' : '50px'}, 200);
		}
		else {
			$('.layer-popup').animate( {'top' : scrollHeight+winHeight-objHeight-150}, 200);
		}
		*/
		
		if(scrollHeight2 > 100 ) {
			$('.layer-popup').animate( {'top' : scrollHeight+winHeight-objHeight}, 200);
		}
		else {
			if( winHeight2 < popupHeight) {
				$('.layer-popup').animate( {'top' : '10px'}, 200);
			} else {
				$('.layer-popup').animate( {'top' : '50px'}, 200);
			}
		}		

		//배경클릭시 닫기
		$('.lock-bg').click(function(){
			$(obj).hide();
			$(this).remove();
			
			//애니에 따른 추가
			$('.layer-popup').css('top', '0px');
		});
		
		
	}
	else {
		$(obj).hide();
		$('.lock-bg').remove();
		
		//애니에 따른 추가
		$('.layer-popup').css('top', '0px');
	}
	
	//자동 닫기 추가
	$(obj+' .close').on('click', function() {
		$(obj).hide();
		$('.lock-bg').remove();
		
		//애니에 따른 추가
		$('.layer-popup').css('top', '0px');
	});
}

function layer_close(obj){
	$(obj).hide();
	$('.lock-bg').remove();
	
	//애니에 따른 추가
	$('.layer-popup').css('top', '0px');
}



//window popup
function win_popup(file, name, width, height) {
	var myWindow = window.open(file, name, "width="+width+", height="+height+", menubar=no, status=no, toolbar=no");
	return myWindow;
}

//Window Popup, Print Popup 배경제거
function win_popup_bgHide() {
	$('body').css('background', '#ffffff');
}

function print_popup_bgHide() {
	$('body').css('background', '#ffffff');
}



//tooltip
function tooltip(obj){
	if($(obj).is(":hidden")){
		$(obj).show();
	}else{
		$(obj).hide();
	}
}
function tooltip_close(obj){
	$(obj).hide();
}



//default Accordion
function accordion() {
	var speed = 300;
	$('#accordion dt a.open').click(function(event) {
		if ($(this).parents('dt').next('dd').css('display')=='none') {
			$('#accordion dd').slideUp(speed);
			$(this).parents('dt').next('dd').slideDown(speed);
		}
		else {
			$('#accordion dd').slideUp(speed);
		}
		
		return false;
	});
};



//tab panel (detailTabMenu1)
function tabPanel(params) {
	var defaults = {
		container: "#tabs", 	//item wrap id
		firstItem: "#tabs-1", 	//first show item
		active: 0 				//ul li > menu on
	};
	for (var def in defaults) { //array object 확인
		if (typeof params[def] === 'undefined') {
			params[def] = defaults[def];
		}
		else if (typeof params[def] === 'object') {
			for (var deepDef in defaults[def]) {
				if (typeof params[def][deepDef] === 'undefined') {
					params[def][deepDef] = defaults[def][deepDef];
				}
			}
		}
	};

	//변수선언
	var item = params.container+' ';
	var firstItem = params.firstItem;
	var active = params.active;


	$(item + '.tabPanel').css('display', 'none');				//전체 콘텐츠 hide
	$(firstItem).css('display', 'block');						//해당 콘텐츠 show
	$(item + '.nav-menu li').eq(active).addClass('active');		//해당 메뉴 active
	
	$(item+'.nav-menu li a').click(function() {
		var show = $(this).attr('href');
		//메뉴 css 추가
		$(item+'.nav-menu li').removeClass('active');
		$(this).parent().addClass('active');
		//tab panel show, hide
		$(item+' .tabPanel').css('display', 'none');
		$(show).css('display', 'block');

		return false;
	});
};

//tab panel (웹접근성용)
function tabPanel2(params) {
	var defaults = {
		container: "#tab_wrap",		//item wrap id
		active: 0					//show item
	};
	for (var def in defaults) { //array object 확인
		if (typeof params[def] === 'undefined') {
			params[def] = defaults[def];
		}
		else if (typeof params[def] === 'object') {
			for (var deepDef in defaults[def]) {
				if (typeof params[def][deepDef] === 'undefined') {
					params[def][deepDef] = defaults[def][deepDef];
				}
			}
		}
	};

	//변수선언
	var item = params.container+' ';
	var active = params.active;


	$(item + '.tab-contents').hide();												//전체 콘텐츠 hide
	$(item + '.tab-list > li').eq(active).find('.tab-contents').show();				//해당 콘텐츠 show
	$(item + '.tab-list > li').eq(active).find('.tab-menu').addClass('active');		//해당 메뉴 class active

	$(item + '.tab-menu').click(function() {
		$(item + '.tab-contents').hide();						//전체 콘텐츠 hide
		$(this).parents('li').find('.tab-contents').show();		//해당 콘텐츠 show
		$(item + '.tab-menu').removeClass('active');			//전체 메뉴 class hide
		$(this).addClass('active');								//해당 메뉴 class show

		return false;
	});
};



//slide up
function slideUp(obj) {
	$(obj).slideUp(300);
}

//slide down
function slideDown(obj) {
	$(obj).slideDown(300);
}



//button disabled
function btn_disabled() {
	//button disabled 추가 (form 전송시 값 전달되지 않게)
	$('button.disabled').attr("disabled", "disabled"); 		//button tag
	$('input.disabled').attr("disabled", "disabled"); 		//input tag
	$('select.disabled').attr("disabled", "disabled"); 		//select tag
	$('textarea.disabled').attr("disabled", "disabled"); 	//textarea tag
	
	$('a.disabled').on('click', function(){					//a tag
		return false;
	});
}



//table 가로 스크롤
$(function () {
	$('#divBodyScroll').scroll(function () {
		// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
		var xPoint = $('#divBodyScroll').scrollLeft();

		// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
		$('#divHeadScroll').scrollLeft(xPoint);
	});

	// 처음에 divBodyScroll의 세로스크롤 너비를 알수 없기 때문에 
	// 스크롤을 우측으로 최대한 움직인 후 버튼을 눌러 두 스크롤의 차이를 찾아서 그 크기 만큼 tblHead의 공백 Column의 width를 지정해줍니다.
	$('#btnCheck').click(function () {
		var headMaximum = $('#divHeadScroll').scrollLeft();
		var bodyMaximum = $('#divBodyScroll').scrollLeft();

		alert('head: ' + headMaximum + '\nbody: ' + bodyMaximum);
	});
});





/* ====================================================================================================================
* main
* ====================================================================================================================*/
function main_style() {
    if($('.main-content').length == 1) {
		//main background
		$('body').css('background', '#f2f2f2');
		
		//main item auto
		$(function() {
			var wall = new Freewall("#item-wrap");
			wall.reset({
				selector: '.item',
				animate: true,
				cellW: 380,
				cellH: 'auto',
				gutterY: 20,
				gutterX: 20,
				delay: 50,
				onResize: function() {
					wall.fitWidth();
				}
			});
			wall.fitWidth();
		});
	}
}



/* ====================================================================================================================
* sub
* ====================================================================================================================*/




/* ====================================================================================================================
* document ready
* ====================================================================================================================*/
$(document).ready(function(){
	btn_disabled(); 	//btn disabled
	main_style();		//main style
	
	
    if($('.win-popup').length >= 1) { 
		win_popup_bgHide();
	}
	
    if($('.print-preview').length >= 1) { 
		print_popup_bgHide();
	}
	
	
	
	
	
	
	
	
	
});