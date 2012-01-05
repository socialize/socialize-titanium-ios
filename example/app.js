// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
window.add(label);
window.open();

// TODO: write your module tests here
var socializeiostitanium = require('com.getsocialize.titaniumios');
Ti.API.info("module is => " + socializeiostitanium);

label.text = socializeiostitanium.example();

Ti.API.info("module exampleProp is => " + socializeiostitanium.exampleProp);
socializeiostitanium.exampleProp = "This is a test value";

if (Ti.Platform.name == "android") {
	var proxy = socializeiostitanium.createExample({message: "Creating an example Proxy"});
	proxy.printMessage("Hello world!");
}

testView = socializeiostitanium.getActionBar("MyKey");

socializeiostitanium.removeAuthenticationInfo();
socializeiostitanium.apiKey = "5cb19dab-aca7-4a0d-9eb5-a5628192c2f2";
socializeiostitanium.apiSecret = "feb304e6-437e-4e3e-bdc8-81c2b863c23b";

var navWindow = Ti.UI.createWindow({
    backgroundColor:"#fff",
    title:"My App"
});

var nav = Titanium.UI.iPhone.createNavigationGroup({
    window:navWindow
});
window.add(nav)

var foo = socializeiostitanium.createActionBar({
  "width":320,
  "height":44,
  "bottom":0,
  "modalController":nav,
  "entityKey":"http://www.npr.org/"
});

navWindow.add(foo);
