jQuery(window).load(function() {
	//////////////
	var view_port_w;
		if(self.innerWidth!=undefined) view_port_w= self.innerWidth;
		else{
		var D= document.documentElement;
		if(D) view_port_w= D.clientWidth;
		}
	var wrapper_w = 0.94 * view_port_w;
	sidebar_w = 0.283186 * wrapper_w;
	middle_sidebar_w = 0.902439024 * sidebar_w;
	jQuery(".sidebar").width(sidebar_w);
	jQuery(".middle-sidebar").width(middle_sidebar_w);	
});