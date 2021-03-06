// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require pickadate/picker
//= require pickadate/picker.date
//= require foundation
//= require_tree .
//= require modernizr

$(window).bind("load", function () {
    var footer = $("#sticky-footer");
    var pos = footer.position();
    var height = $(window).height();
    height = height - pos.top;
    height = height - footer.height();
    if (height > 0) {
        footer.css({
            'margin-top': height + 'px'
        });
    }
});

$('.cal').pickadate({
});

$(function(){
  $('#enrollment-button').on('click', function(){
    $("#enroll").toggle();
  });
});

$(function(){
  $('#classroom-button').on('click', function(){
  $("#create-classroom").toggle();
  });
});

$(function(){
  $('#analytic-button-question').on('click', function(){
    $("#question-video").css("display", "block");
    $("#student-charts").css("display", "none");
  });
});

$(function(){
  $('#analytic-button-bar').on('click', function(){
    $("#question-video").css("display", "none");
    $("#student-charts").css("display", "block");
  });
});

$(function(){
  $('#classroom_search').on('submit', function(e) {
    e.preventDefault();
    console.log(e);
  });
  $('#classroom_search').on('keyup', function(e) {
    e.preventDefault();
    var query = $("#q_name_cont").val();
    var data = {
      'q': { 'name_cont': query }
    }
    $.ajax({
      type: "GET",
      contentType: "application/json; charset=utf-8",
      url: "/search",
      dataType: 'json',
      data: data,
      success: function(data){
        console.log(data)
        console.log("success!");

        renderResults(data);
      },
      error: function(data) {
        console.log(data)
        console.log("failure!");
      }
    })
  });

  var renderResults = function(data) {
    var table = $('#search-results tbody');
    var rows = table.find('tr').hide();
    _.each(data, function(d){
      $('#classroom_' + d.id).show();
    });

  };



  $(document).foundation();

});
