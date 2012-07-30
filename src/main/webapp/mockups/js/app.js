// find things in brackets and assign class, but it was already doing it ! 
$(function() {

var Short_section_numbers = $(".bill_text").html().replace(/([S]{1}\s[1-3][.])|$/g, '<div id="$1"><h4>$1</h4></div>');
 $(".bill_text").html(Short_section_numbers);

var Longer_section_numbers = $(".bill_text").html().replace(/(Section\s[0-9])|$/, '<div id="$1"><h4>$1</h4></div>');
 $(".bill_text").html(Longer_section_numbers);




//  var text = $(".bill_text").html().replace(/((.|\n)*)Section 1./, '<div id="Section1">Section 1</div>.');
 var text = $(".bill_text").html();
 var text2 = text.replace(/\<br\>/g, "{brbr}").replace(/\n/g, "{br}");
 var text3 = text2.replace(/((?:[0-9A-Z()-]+)(?:([,:. ']|{br})+)((?:[0-9A-Z()-]+)(?:([,:. ']|{br})+)?)+)(?=(?:([,:. ']|{br})+)|$)/g, '<add>$1</add>');
 var text4 = text3.replace(/\{br\}/g, '\n').replace(/\{brbr\}/g, '\n');
  $(".bill_text").html(text4);
 
});
