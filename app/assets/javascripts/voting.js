$(document).ready(function() {
  $('a').click(function(click) {
    click.stopPropagation();
    click.preventDefault();
    link = $(this)
    data = $(this).attr('href')
    $.post(data, function(data) {
      console.log(data);
      link.siblings('span').html(data.votes_count);
    });
  });
});