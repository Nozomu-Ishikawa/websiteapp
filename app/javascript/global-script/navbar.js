var _window = $(window),
    _header = $('.navbar'),
    heroBottom;
 
_window.on('scroll',function(){     
    heroBottom = $('.navbar-light').height();
    if(_window.scrollTop() > heroBottom){
        _header.addClass('fixed');   
    }
    else{
        _header.removeClass('fixed');   
    }
});
 
_window.trigger('scroll');