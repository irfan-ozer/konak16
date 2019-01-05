var baseUrl = document.getElementsByTagName('base')[0].href;
var language = document.getElementsByTagName('html')[0].getAttribute('lang');
var queryString = (function (a) {
    if (a === "") return {};
    var b = {};
    for (var i = 0; i < a.length; ++i) {
        var p = a[i].split('=');
        if (p.length !== 2) continue;
        b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
})(window.location.search.substr(1).split('&'));

/**
 * bir hata nedeniyle veya sunucudan silinmiş ya da bulunamayan bir resim olduğunda, hata göstermek yerine
 * placehold.it resimlerinin gösterilmesini sağlar.
 */
jQuery(window).load(function() {
    var $ = jQuery;

    $('img:not(".logo-img")').each(function() {
        if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)){
            var ieversion=new Number(RegExp.$1)
            if (ieversion>=9)
                if (typeof this.naturalWidth === "undefined" || this.naturalWidth === 0) {
                    this.src = "http://placehold.it/" + ($(this).attr('width') || this.width || $(this).naturalWidth()) + "x" + (this.naturalHeight || $(this).attr('height') || $(this).height());
                }
        } else {
            if (!this.complete || typeof this.naturalWidth === "undefined" || this.naturalWidth === 0) {
                this.src = "http://placehold.it/" + ($(this).attr('width') || this.width || $(this).naturalWidth()) + "x" + (this.naturalHeight || $(this).attr('height') || $(this).height());
            }
        }
    });
});

/**
 * android cihazlarda select boxların düzgün görünmesini sağlar.
 */
$(function () {
    var nua = navigator.userAgent;
    var isAndroid = (nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1 && nua.indexOf('Chrome') === -1);
    if (isAndroid) {
        $('select.form-control').removeClass('form-control').css('width', '100%');
    }
});

/**
 * linklerde target kullanmak yerine rel attribut unu kullanmamızı sağlar.
 * @constructor
 */
function  linkToBlank() {

    if  (!document.getElementsByTagName) return;
    var  urls = document.getElementsByTagName("a");
    var  urlCount = urls.length;
    for  (var i=0; i<urlCount; i++) {
        var singleLink = urls[i];
        if(singleLink.getAttribute("href") && singleLink.getAttribute("rel") == "external" || singleLink.getAttribute("rel") == "nofollow") {
            singleLink.target  = "_blank";
        }

    }

}

/**
 * @param obj
 * @returns {boolean}
 */
isset = function(obj) {
    var i, max_i;
    if(obj === undefined) return false;
    for (i = 1, max_i = arguments.length; i < max_i; i++) {
        if (obj[arguments[i]] === undefined) {
            return false;
        }
        obj = obj[arguments[i]];
    }
    return true;
};

$(function () {
    $('.fancybox').fancybox();
    $(".mask-phone").mask("0(999) 999 99 99", {placeholder: "_"});
    $(".numeric").numeric();

    linkToBlank();

    $('.share-box a').on('click', function () {
        window.open($(this).attr('href'), 'sharewindow', 'width=600,height=400');
        return false;
    });
});

$(document).ready(function() {

    /*Tooltip*/
    $('[data-toggle="tooltip"]').tooltip();

    $('.right-middle-in').click(function(){
        $('.right-middle').toggleClass('open');
    });

    $(".project-detail-text").mCustomScrollbar({
        theme : "inset-2-dark",
        scrollbarPosition: "inside",
        //scrollButtons:{ enable: true },
        advanced:{ updateOnContentResize: true },
        scrollInertia: 300
    });

    /*FancyBox*/
    $(".fancyBox").fancybox({
        padding: 0,
        openEffect : 'elastic',
        openSpeed  : 150,
        closeEffect : 'elastic',
        closeSpeed  : 150,
        closeClick : true,
        helpers : {

            buttons : {},
            thumbs  : {
                width : 50,
                height  : 50
            }


        }
    });

    /*OWL*/
    var owl1 = $("#project-carousel");
    owl1.owlCarousel({
        items: 3,
        stagePadding: 50,
        margin:10,
        itemsDesktop      : [1199,3],
        itemsDesktopSmall     : [979,3],
        itemsTablet       : [768,1],
        itemsMobile       : [479,1],
        loop : true,
       

        pagination : false
    });
    $(".carousel #Next").click(function(){
        owl1.trigger('owl.next');
    });
    $(".carousel #Prev").click(function(){
        owl1.trigger('owl.prev');
    });

    var owl2 = $("#project-gallery");
    owl2.owlCarousel({
        items: 7,
        itemsDesktop      : [1199,7],
        itemsDesktopSmall     : [979,5],
        itemsTablet       : [768,3],
        itemsMobile       : [479,1],
        loop : true,
        pagination : false,
    });
    $(".carousel-project .buttons#Next").click(function(){
        owl2.trigger('owl.next');
    });
    $(".carousel-project .buttons#Prev").click(function(){
        owl2.trigger('owl.prev');
    });


    if (jQuery(".kopa__bottomSidebar").length) {
        var s = jQuery(".kopa__bottomSidebar");
        s.find(".widget").matchHeight()
    }
    if (jQuery(".kopa__bottomSidebar").length) {
        var d = jQuery(".kopa__bottomSidebar");
        d.find(".col-xs-12").matchHeight()
    }

    PNotify.prototype.options.styling = "bootstrap3";
    /**
     * mail listesi formu
     */
    $('.btnMaillist').on("click", function () {
        var mail = $('input[name="email"]').val(),
            link = $('input[name="mLink"]').val();

        $.post(link, {"email": mail}, function (e) {
            if (e.success) {
                new PNotify({
                    title: e.title,
                    text: e.message,
                    type: 'success',
                    icon: 'fa fa-phone',
                    opacity: .8
                });
                $('input[name="email"]').val('');
            } else {
                new PNotify({
                    title: e.title,
                    text: e.message,
                    type: 'error',
                    icon: 'fa fa-phone',
                    opacity: .8
                });
            }
        }, "json");
    });


});

jQuery(window).resize(function() {
    if (jQuery(".kopa__bottomSidebar").length) {
        var t = jQuery(".kopa__bottomSidebar");
        t.find(".widget").matchHeight()
    }
    if (jQuery(".kopa__bottomSidebar").length) {
        var i = jQuery(".kopa__bottomSidebar");
        i.find(".col-xs-12").matchHeight()
    }
});