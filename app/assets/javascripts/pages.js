Turbolinks.enableProgressBar();

 $(document).on('page:update', function(){
      console.log('page updated');
      if ($('.ckeditor')[0]) {
          CKEDITOR.replace($('.ckeditor').attr('id'));
      }
  });
 $(document).on('page:load', function(){
 	$('#admin-sidebar').affix({offset: {top: 1} });
 });
 $(document).ready(function () {
 	$('.owl-carousel').owlCarousel({
 		items:1,
    	margin:10,
    	nav:true,
    	autoHeight:true

 	});
 });