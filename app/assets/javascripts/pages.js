Turbolinks.enableProgressBar();

 $(document).on('page:update', function(){
      console.log('page updated');
      if ($('.ckeditor')[0]) {
          CKEDITOR.replace($('.ckeditor').attr('id'));
      }
  });
 $(document).ready(function () {
 	$('.owl-carousel').owlCarousel({
 		items:1,
    	margin:10,
    	nav:true,
    	navText : ["",""],

 	});

if(window.matchMedia('(max-width: 767px)').matches) {
	var bg = jQuery(".carousel-item");
    bg.height(jQuery(window).height()*0.4);
};

 });