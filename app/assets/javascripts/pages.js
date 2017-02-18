Turbolinks.enableProgressBar();

 $(document).ready(function () {
     if(('.owl-carousel').length) {
         $('.owl-carousel').owlCarousel({
             items: 1,
             margin: 10,
             nav: true,
             navText: ["", ""],
         });
         if(window.matchMedia('(max-width: 767px)').matches) {
             var bg = jQuery(".carousel-item");
             bg.height(jQuery(window).height()*0.5);
         };
     }
     if(('.ckeditor').length){
         if ($('.ckeditor')[0]) {
             CKEDITOR.replace($('.ckeditor').attr('id'));
         }
    }
 });