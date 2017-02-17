Turbolinks.enableProgressBar();

 $(document).ready(function () {
     if(('.ckeditor').length) {
         $('.owl-carousel').owlCarousel({
             items: 1,
             margin: 10,
             nav: true,
             navText: ["", ""],
         });
     }

 	if(('.ckeditor').length){
     if ($('.ckeditor')[0]) {
         CKEDITOR.replace($('.ckeditor').attr('id'));
     }
    }

    if(window.matchMedia('(max-width: 767px)').matches) {
        var bg = jQuery(".carousel-item");
        bg.height(jQuery(window).height()*0.5);
    };

 });