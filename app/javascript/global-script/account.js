$(function(){
  $('.dropdwn li').hover(function(){
      $("ul:not(:animated)", this).slideDown();
      console.log("hoge");
  }, function(){
      $("ul.dropdwn_menu",this).slideUp();
      console.log("hoge");
  });
});