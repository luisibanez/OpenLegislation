// find things in brackets and assign class, but it was already doing it ! 
$(function() {
    var text = $(".bill_text").text();
	var newString = text.replace(/((?:[0-9A-Z()-]+)(?:([,:. ]|{br})+)((?:[0-9A-Z()-]+)(?:([,:. ]|{br})+)?)+)(?=(?:([,:. ]|{br})+)|$)/, '<span style='color: green;'> $1 </span>');

  $(".bill_text").html(newString);
});
