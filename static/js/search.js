+function($){
  $(document).on('ready',function(e){
    var $searchOverlay = $('.body-overlay'),
        $searchTrigger = $('#search-trigger'),
        $search = $('#search-overlay-form input[type="search"]');
    
    
    $(".basket-trigger").click(function(e){
      e.preventDefault();
      e.stopImmediatePropagation();
      $(this).next('.basket-content').toggleClass('open-basket');
    });
    
    $('.mobile-toggle').click(function(e){
        e.preventDefault();
        $('#header-nav nav').toggleClass('open-nav');
    });
    
    $searchTrigger.click(function(e){
      $searchOverlay.fadeIn(500);
      $search.focus();
    });
    
    $('#spanHover').click(function(e){
      $searchOverlay.fadeIn(500);
      $search.focus(); 
      $("#spanHover").hide();
    });
    
    $searchOverlay.find('.fa-times').click(function(e){
      $searchOverlay.fadeOut(500);
      $("#spanHover").show();
      $("#search-overlay-form input").val("");
    });
    
    $('.search-trigger')

    $(window).scroll(function() {
        if ($(window).scrollTop() > 20) {
            $("body").addClass("scrolled");
        }else{
            $("body").removeClass("scrolled");
        }
    });
  })
}(jQuery);