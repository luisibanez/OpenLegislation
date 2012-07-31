// find things in brackets and assign class, but it was already doing it ! 
$(function() {

	var shiftWindow = function() { scrollBy(0, -80) };
	if (location.hash) shiftWindow();
	window.addEventListener("hashchange", shiftWindow);


	var bill_text = $(".bill_text").html();
	var bill_text = bill_text.replace(/(S[\s]{1,}[1-3])/g, '<span id="$1" class="section_head"><h4>$1</h4></span>');
	var bill_text = bill_text.replace(/(take[\s]effect)/g, '<span id="effective date" class="section_head">$1</span>');
	
	var bill_text = bill_text.replace(/(Introduced)/, '<span class="bill_start">$1');
	var bill_text = bill_text.replace(/(Section[\s]{1,}[0-9])[.]|$/, '<span class="bill_body"><span id="$1" class="section_head"><h4>$1</h4></span>');
	$(".bill_text").html(bill_text+'</span></span>');
	console.log('step 1 done');
		
	// add sections to quicklink menu
 	$(".bill_body .section_head").each(function (i) {
 		$('#table_of_contents').append('<a href="#'+this.id+'">'+this.id+'</a><br/>');
 	});
	console.log('step 2 done');
	
	// treat the bill whitespace differently then the header
	var bill_start = $(".bill_start").html();
	var bill_start = bill_start.replace(/\<br\><br\>/g, "<br/>").replace(/\<br\>/g, "{brbr}").replace(/\n/g, "{br}");
 	var bill_start = bill_start.replace(/\{brbr\}/g, '\n').replace(/\{br\}/g, '');
 	$(".bill_start").html(bill_start);
 	console.log('step 3 done');
 	
 
	// check for changes 
	var text_html = $(".bill_body").html();
	var text = text_html.replace(/((?:[0-9A-Z()-]+)(?:([,:;. ']|{br})+)((?:[0-9A-Z()-]+)(?:([,:;. ']|{br})+)?)+)(?=(?:([,:;. ']|{br})+)|$)/g, '<add>$1</add>');
	
	
	$(".bill_body").html(text);

 	console.log('step 4 done');
 	
 });
