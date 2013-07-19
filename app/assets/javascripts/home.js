var setCallbacks = function(){
	$(".apply").unbind("click");
	$(".apply").click(function(){
		$(this).removeClass("btn-info");
		$(this).addClass("btn-success");
		$(this).text("Applied!");
		console.log("clicked");
	});
}

var listings = [
	{title: "Waiter", company: "Applebees"},
	{title: "Store Clerk", company: "Price Cutter"},
	{title: "Cook", company: "Coyotes"},
	{title: "Cart Pusher", company: "Sam's Club"},
	{title: "Ticket Teller", company: "Springfield 8"},
	{title: "Restaurant Hostess", company: "Texas Roadhouse"},
	{title: "Cart Manager", company: "Hidden Valley Golf Course"},
	{title: "Custard Server", company: "Cruisin' USA"}
];

$(document).ready(function(){
	var NUM_TO_SHOW = 3;
	var i = 0;
	var container = $("#listings-container");
	var showing = [];

	container.height(NUM_TO_SHOW * 73);

	var nextListing = function(){
		var html = [
				"<div class=\"span9\">",
					"<h3>",
						listings[i].title,
					"</h3>",
					"<p class\"muted\">",
						listings[i].company,
					"</p>",
				"</div>",
				"<div class=\"span3\">",
					"<a href=\"#\", class=\"apply btn btn-info pull-right\">Apply</a>",
				"</div>"
		].join("");

		var element = $("<div class=\"row-fluid\"></div>");
		element.html(html).hide();
		showing.unshift(element);
		element.appendTo(container).slideDown("normal");
		if(showing.length > NUM_TO_SHOW)
			showing.pop().slideUp("normal", function(){$(this).remove();})
		setCallbacks();
		i = i >= listings.length - 1 ? 0 : i + 1
	};

	for(var j = 0 ; j < 3 ; j++)
		nextListing();

	setInterval(function(){nextListing();}, 3000);

});