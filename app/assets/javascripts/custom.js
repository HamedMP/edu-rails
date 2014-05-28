

/* =========================================================
Dropdown menu
============================================================ */
jQuery(document).ready(function(){

  jQuery("#main-menu li").hover(function() {
    jQuery(this).find("ul").first().slideDown(300);
      }, function() {
    jQuery(this).find("ul").first().hide();
  });

})
/* =========================================================
Create mobile menu
============================================================ */
function createMobileMenu(menu_id, mobile_menu_id){
    // Create the dropdown base
    jQuery("<select />").appendTo(menu_id);
    jQuery(menu_id).find('select').first().attr("id",mobile_menu_id);

    // Populate dropdown with menu items
    jQuery(menu_id).find('a').each(function() {
        var el = jQuery(this);

        var selected = '';
        if (el.parent().hasClass('current-menu-item') == true){
            selected = "selected='selected'";
        }

        var depth = el.parents("ul").size();
        var space = '';
        if(depth > 1){
            for(i=1; i<depth; i++){
                space += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            }
        }

        jQuery("<option "+selected+" value='"+el.attr("href")+"'>"+space+el.text()+"</option>").appendTo(jQuery(menu_id).find('select').first());
    });
    jQuery(menu_id).find('select').first().change(function() {
        window.location = jQuery(this).find("option:selected").val();
    });
}

jQuery(document).ready(function(){
    if(jQuery('#main-nav').length > 0){
        createMobileMenu('#main-nav','responsive-menu');
    }
});
/* =========================================================
Social icons hover
============================================================ */
jQuery(document).ready(function(){

    jQuery(".social-links a").mouseenter(function(){
        jQuery(this).find('img').fadeTo(300, 0);
    }).mouseleave(function(){
        jQuery(this).find('img').fadeTo(300, 1);
    });
});
/* =========================================================
Home page slider
============================================================ */
jQuery(window).load(function() {
  jQuery('#slider').nivoSlider({
     effect: 'random', // Specify sets like: 'fold,fade,sliceDown'
        slices: 15, // For slice animations
        boxCols: 8, // For box animations
        boxRows: 4, // For box animations
        animSpeed: 2000, // Slide transition speed
        pauseTime: 6000, // How long each slide will show
        startSlide: 0, // Set starting Slide (0 index)
        directionNav: true, // Next & Prev navigation
        controlNav: true, // 1,2,3... navigation
        controlNavThumbs: false, // Use thumbnails for Control Nav
        pauseOnHover: true, // Stop animation while hovering
        manualAdvance: false, // Force manual transitions
        prevText: 'Prev', // Prev directionNav text
        nextText: 'Next', // Next directionNav text
        randomStart: false, // Start on a random slide
        beforeChange: function(){}, // Triggers before a slide transition
        afterChange: function(){}, // Triggers after a slide transition
        slideshowEnd: function(){}, // Triggers after all slides have been shown
        lastSlide: function(){}, // Triggers when last slide is shown
        afterLoad: function(){} // Triggers when slider has loaded

    });
});
/* =========================================================
Sticky
============================================================*/
jQuery(window).load(function() {

    //////////////
    var view_port_w;
    if(self.innerWidth!=undefined) view_port_w= self.innerWidth;
    else{
        var D= document.documentElement;
        if(D) view_port_w= D.clientWidth;
    }
    //Set with of stick
    var col_a_w=jQuery(".column-a").width();
    var b_right_w=jQuery(".column-bright").width();
    var b_left_w=jQuery(".column-bleft").width();
    var sidebar_w=jQuery(".sidebar").width();
    jQuery(".stick-it").width(col_a_w);
    jQuery(".bright-stick").width(b_right_w);
    jQuery(".bleft-stick").width(b_left_w);
    jQuery(".sibar-stick").width(sidebar_w);

    //////////////
    if(view_port_w >= 768){
        jQuery(".stick-it").sticky({
            topSpacing: 0,
            bottomSpacing:180,
            className: 'sticky',
            wrapperClassName: 'sticky-wrapper'
        });
        jQuery(".bleft-stick").sticky({
            topSpacing: 0,
            bottomSpacing:246,
            className: 'sticky',
            wrapperClassName: 'sticky-wrapper'
        });
        jQuery(".bright-stick").sticky({
            topSpacing: 0,
            bottomSpacing:246,
            className: 'sticky',
            wrapperClassName: 'sticky-wrapper'
        });
        jQuery(".sibar-stick").sticky({
            topSpacing: 0,
            bottomSpacing:180,
            className: 'sticky',
            wrapperClassName: 'sticky-wrapper'
        });
    } else if(view_port_w <= 767 && view_port_w >= 580 ){
        jQuery(".stick-it").sticky({
            topSpacing: 0,
            bottomSpacing:180,
            className: 'sticky',
            wrapperClassName: 'sticky-wrapper'
        });
        jQuery(".bright-stick").sticky({
            topSpacing: 0,
            bottomSpacing:246,
            className: 'sticky',
            wrapperClassName: 'sticky-wrapper'
        });
        jQuery(".sibar-stick").sticky({
            topSpacing: 0,
            bottomSpacing:180,
            className: 'sticky',
            wrapperClassName: 'sticky-wrapper'
        });
    }
  jQuery('.latest-article').height(jQuery('.main-content').height());
});

/* =========================================================
Sticky on resize
============================================================ */


jQuery(window).resize(function() {
    var view_port_w;
    if(self.innerWidth!=undefined) view_port_w= self.innerWidth;
    else{
        var D= document.documentElement;
        if(D) view_port_w= D.clientWidth;
    }
    var col_a_w=jQuery(".column-a").width();
    var b_right_w=jQuery(".column-bright").width();
    var b_left_w=jQuery(".column-bleft").width();
    var sidebar_w=jQuery(".sidebar").width();
    jQuery(".stick-it").width(col_a_w);
    jQuery(".bright-stick").width(b_right_w);
    jQuery(".bleft-stick").width(b_left_w);
    jQuery(".sibar-stick").width(sidebar_w);
    /////////////
    clearTimeout(this.id);
    this.id = setTimeout(doneResizing, 500);
});

function doneResizing(){
    var view_port_w;
    if(self.innerWidth!=undefined) view_port_w= self.innerWidth;
    else{
        var D= document.documentElement;
        if(D) view_port_w= D.clientWidth;
    }
    var col_a_w=jQuery(".column-a").width();
    var b_right_w=jQuery(".column-bright").width();
    var b_left_w=jQuery(".column-bleft").width();
    var sidebar_w=jQuery(".sidebar").width();
    jQuery(".stick-it").width(col_a_w);
    jQuery(".bright-stick").width(b_right_w);
    jQuery(".bleft-stick").width(b_left_w);
    jQuery(".sibar-stick").width(sidebar_w);

    ////
    if(view_port_w >= 768 ){
        var find_m_sticky = jQuery(".stick-it").parent();
        if (jQuery(find_m_sticky).hasClass("sticky-wrapper") == false){
            jQuery(".stick-it").sticky({
                topSpacing: 0,
                bottomSpacing:180,
                className: 'sticky',
                wrapperClassName: 'sticky-wrapper'
            });
        }
        find_m_sticky = jQuery(".bright-stick").parent();
        if (jQuery(find_m_sticky).hasClass("sticky-wrapper") == false){
            jQuery(".bright-stick").sticky({
                topSpacing: 0,
                bottomSpacing:246,
                className: 'sticky',
                wrapperClassName: 'sticky-wrapper'
            });
        }
        find_m_sticky = jQuery(".bleft-stick").parent();
        if (jQuery(find_m_sticky).hasClass("sticky-wrapper") == false){
            jQuery(".bleft-stick").sticky({
                topSpacing: 0,
                bottomSpacing:246,
                className: 'sticky',
                wrapperClassName: 'sticky-wrapper'
            });
        }
        find_m_sticky = jQuery(".sibar-stick").parent();
        if (jQuery(find_m_sticky).hasClass("sticky-wrapper") == false){
            jQuery(".sibar-stick").sticky({
                topSpacing: 0,
                bottomSpacing:180,
                className: 'sticky',
                wrapperClassName: 'sticky-wrapper'
            });
        }
    }
    else if(view_port_w <= 767 && view_port_w >= 580 ){
        var find_m_sticky = jQuery(".bleft-stick").parent();
        if(jQuery(find_m_sticky).hasClass("sticky-wrapper")){
            jQuery(".bleft-stick").removeClass("sticky");
            jQuery(".bleft-stick").css("position","static");
            m_temp=jQuery(".column-bleft .sticky-wrapper").html();
            jQuery(".column-bleft .sticky-wrapper").remove();
            jQuery(".column-bleft").append(m_temp);
        }

    }
    else if(view_port_w <580){
        var find_m_sticky = jQuery(".bleft-stick").parent();
        if(jQuery(find_m_sticky).hasClass("sticky-wrapper")){
            jQuery(".bleft-stick").removeClass("sticky");
            jQuery(".bleft-stick").css("position","static");
            m_temp=jQuery(".column-bleft .sticky-wrapper").html();
            jQuery(".column-bleft .sticky-wrapper").remove();
            jQuery(".column-bleft").append(m_temp);
        }
        ///.stick-it
        var find_m_sticky = jQuery(".stick-it").parent();
        if(jQuery(find_m_sticky).hasClass("sticky-wrapper")){
            jQuery(".stick-it").removeClass("sticky");
            jQuery(".stick-it").css("position","static");
            m_temp=jQuery(".column-a .sticky-wrapper").html();
            jQuery(".column-a .sticky-wrapper").remove();
            jQuery(".column-a").append(m_temp);
        }
        ///.bright-stick
        var find_m_sticky = jQuery(".bright-stick").parent();
        if(jQuery(find_m_sticky).hasClass("sticky-wrapper")){
            jQuery(".bright-stick").removeClass("sticky");
            jQuery(".bright-stick").css("position","static");
            m_temp=jQuery(".column-bright .sticky-wrapper").html();
            jQuery(".column-bright .sticky-wrapper").remove();
            jQuery(".column-bright").append(m_temp);
        }
        ///.sibar-stick
        var find_m_sticky = jQuery(".sibar-stick").parent();
        if(jQuery(find_m_sticky).hasClass("sticky-wrapper")){
            jQuery(".sibar-stick").removeClass("sticky");
            jQuery(".sibar-stick").css("position","static");
            m_temp=jQuery(".sidebar .sticky-wrapper").html();
            jQuery(".sidebar .sticky-wrapper").remove();
            jQuery(".sidebar").append(m_temp);
        }

    }
}
/* =========================================================
Featured news slider
============================================================ */
jQuery(window).load(function() {
    if (jQuery('.feature-imgs').length > 0) {
      jQuery('.feature-imgs').carouFredSel({
        responsive: true,
        prev: '#prev-1',
        next: '#next-1',
        width: '100%',
        scroll: 1,
        auto: true,
        items: {
          width: 410,
          height: "auto",
          visible: {
            min: 1,
            max: 1
          }
        }
      });
    }
});
/* =========================================================
Hover effect
============================================================ */
jQuery(document).ready(function(){
    jQuery(".hover-effect").mouseenter(function(){
        jQuery(this).fadeTo(400, 0.7);
    }).mouseleave(function(){
        jQuery(this).fadeTo(400, 1);
    });
  //video thumbnails hover
   jQuery(".black-overlay").mouseenter(function(){
        jQuery(this).fadeTo(300, 0);
    }).mouseleave(function(){
        jQuery(this).fadeTo(300, 0.3);
    });
});
/* =========================================================
Pretty Photo
============================================================ */
 jQuery(document).ready(function(){
    jQuery("a[rel^='prettyPhoto']").prettyPhoto();
  });

/* =========================================================
Fix css
============================================================ */
jQuery(document).ready(function(){
  jQuery("#footer-nav ul li:last-child").css("border-right","none");
  jQuery(".comments-list .comment:first-child").css("border-top","none");
  jQuery("#footer-nav ul li:last-child").css("margin-right",0);
  jQuery("#footer-nav ul li:last-child a").css("padding-right",0);

 });
/* =========================================================
Comment Form
============================================================ */
jQuery(document).ready(function() {
    var validator = jQuery("#comments-form").kendoValidator().data("kendoValidator"),
    status = jQuery("#status-message");
    jQuery("#submit-comment").click(function() {
        if (validator.validate()) {
            status.text("Your message is being sent").addClass("valid");
        } else {
            status.text("Oops! There is invalid data in the form.").addClass("invalid");
        }
    });
});
 /* =========================================================
Scroll to top
============================================================ */
jQuery(document).ready(function(){

  // hide #back-top first
  jQuery("#back-top").hide();

  // fade in #back-top
  jQuery(function () {
    jQuery(window).scroll(function () {
      if (jQuery(this).scrollTop() > 100) {
        jQuery('#back-top').fadeIn();
      } else {
        jQuery('#back-top').fadeOut();
      }
    });

    // scroll body to 0px on click
    jQuery('#back-top a').click(function () {
      jQuery('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
  });

});
