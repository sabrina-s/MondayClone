function updateCountdown() {
  var remaining = 140 - $('.form-control').val().length;
  $('.countdown').text(remaining + ' characters remaining.');
};
// function updateCountdown() {
//     // 140 is the max message length
//     var remaining = 140 - jQuery('.message').val().length;
//     jQuery('.countdown').text(remaining + ' characters remaining.');
// }