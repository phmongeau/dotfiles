// CONFIG
slate.configAll({
	defaultToCurrentScreen: true,
	nudgePercentOf: "screenSize",
	resizePercentOf: "screenSize",
	windowHintsIgnoreHiddenWindows: false,
	windowHintsSpread: true,
	windowHintsShowIcons: true,
	windowHintsIconAlpha: 1,
	windowHintsBackgroundColor: [50, 53, 58, 0]
});

// HYPER KEY
var hyper = "ctrl;alt;cmd";

// UTILITIES
// generate a chain of operations for a screen edge
var genEdges = function(direction) {
	var axe;
	if(direction == "left" || direction == "right") axe = "X";
	else axe = "Y";
	var c = _.map(["/2", "/3*2", "/3"], function(size) {
		return slate.operation("push", {
			"direction": direction,
			"style": "bar-resize:screenSize"+axe+size
		});
	});
	return c;
}

// generate a chain of operations for a screen corner
var genCorners = function(direction) {
	var c = _.map(["/2", "/3*2", "/3"], function(size) {
		return slate.operation("corner", {
			"direction": direction,
			"width": "screenSizeX"+size,
			"height": "screenSizeY"+size
		});
	});
	return c;
}

var focus = function(app) {
	return slate.operation("focus", { "app": app });
}


// OPERATIONS
var half_right   = slate.operation("chain", { "operations" : genEdges("right") });
var half_left    = slate.operation("chain", { "operations" : genEdges("left") });
var half_top     = slate.operation("chain", { "operations" : genEdges("top") });
var half_bottom  = slate.operation("chain", { "operations" : genEdges("bottom") });

var top_left     = slate.operation("chain", { "operations" : genCorners("top-left") });
var top_right    = slate.operation("chain", { "operations" : genCorners("top-right") });
var bottom_left  = slate.operation("chain", { "operations" : genCorners("bottom-left") });
var bottom_right = slate.operation("chain", { "operations" : genCorners("bottom-right") });

var center = slate.operation("move", {
	"x": "screenOriginX + screenSizeX/2 - windowSizeX/2",
	"y": "screenOriginY + screenSizeY/2 - windowSizeY/2",
	"width": "windowSizeX",
	"height": "windowSizeY"
});

var fullScreen = slate.operation("corner", {
	"direction": "top-left",
	"width": "screenSizeX",
	"height": "screenSizeY"
});

var throwProportional = function(direction, win) {
	var screen = win.screen();
	var cRect = screen.visibleRect();

	var i = screen.id() + direction;
	if(i >= slate.screenCount()) i = 0;
	else if(i < 0) i = slate.screenCount() - 1;

	var nScreen = slate.screenForRef("" + i);
	var nRect = nScreen.rect();
	slate.operation("throw", {
		"screen": nScreen,
		"x": Math.round(nRect.x + ((win.rect().x - cRect.x)/ cRect.width)*nRect.width).toString(),
		"y": Math.round(nRect.y + ((win.rect().y - cRect.y)/ cRect.height)*nRect.height).toString(),
		"width":  Math.round((win.rect().width / cRect.width)*nRect.width).toString(),
		"height": Math.round((win.rect().height / cRect.height)*nRect.height).toString()
	}).run();
};

// BINDINGS
slate.bind("pad6:"+hyper, half_right);
slate.bind("pad4:"+hyper, half_left);
slate.bind("pad8:"+hyper, half_top);
slate.bind("pad2:"+hyper, half_bottom);

slate.bind("pad9:"+hyper, top_right);
slate.bind("pad7:"+hyper, top_left);
slate.bind("pad3:"+hyper, bottom_right);
slate.bind("pad1:"+hyper, bottom_left);

slate.bind("pad5:"+hyper, center);
slate.bind("pad+:"+hyper, fullScreen);

//Throw Bindings
slate.bind("left:"+hyper, function(w) { throwProportional(-1, w); });
slate.bind("right:"+hyper, function(w) { throwProportional(1, w); });

//App Bindings
slate.bind("c:"+hyper, focus("Adium"));
slate.bind("f:"+hyper, focus("Firefox"));


// Other Bindings
slate.bind("esc:cmd", slate.operation("hint", {"characters": "fjdksla;gh" }));
slate.bind("g:"+hyper, slate.operation("grid"));
slate.bind("r:"+hyper, slate.operation("relaunch"));
