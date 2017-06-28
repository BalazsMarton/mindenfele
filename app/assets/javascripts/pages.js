Turbolinks.enableProgressBar();

 $(document).ready(function () {
     if(('.opening-carousel').length) {
         $('.opening-carousel').owlCarousel({
             items: 1,
             margin: 10,
             nav: true,
             navText: ["", ""],
         });
         if(window.matchMedia('(max-width: 767px)').matches) {
             var bg = $(".carousel-item");
             var bgimage = $(".opening-carousel-img");
             bg.height($(window).height()*0.5);
             bgimage.height($(window).height()*0.5);
         };
     }
    if(('.ckeditor').length){
         if ($('.ckeditor')[0]) {
             CKEDITOR.replace($('.ckeditor').attr('id'));
         }
    }
 });
