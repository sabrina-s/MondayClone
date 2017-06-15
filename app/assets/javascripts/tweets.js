function updateCountdown() {
  var remaining = 140 - $('#tweetbox').find("textarea").val().length;
  $('.countdown').text(remaining + ' characters remaining.');
};

function button() {
    if (remaining < 0) {
    $(".create-button").html("<button class='btn btn-sucess pull-right'> Create </button>");
  } else {
    $(".create-button").html("<%= t.submit 'Create', class: 'btn btn-success pull-right'%>");
    $(".tweetbox").html("<%= render partial: 'tweetbox' %>");
  }
};

$(document).on("turbolinks:load", function() {
    updateCountdown();
    $(".form-control").keyup(updateCountdown);
    $(".form-control").keydown(updateCountdown);
});

  
