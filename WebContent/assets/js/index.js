$(document).ready(function(){ 
	//navbar 스크롤 
	$(window).scroll(function(){ 
		var scroll = $(window).scrollTop();
		if(scroll>1){
//			$(".navbar").css("background","#555555");
		}else{
//			$(".navbar").css("background","transparent");
		}
	}) 


	$('ul.nav li.dropdown').hover(function() {
		$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
	}, function() {
		$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
	});
})
