$().ready(function () {
    var menuTarget = $('#menuTarget').val();
   $('[menuTarget="' + menuTarget + '"]').parents('li').addClass('active');
});