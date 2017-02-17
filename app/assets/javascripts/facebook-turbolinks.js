
    $(document).ready(function () {
        if ($(".fb-comments").length) {
        initializeFacebookSDK = function () {
            var ref;
            FB.init({
                appId: '456973521359868',
                cookie: true,
                xfmbl: true,
                version: 'v2.8'
            });
            return typeof FB !== "undefined" && FB !== null ? (ref = FB.XFBML) != null ? ref.parse() : void 0 : void 0;
        };

        jQuery(function () {
            delete FB;
            return $.getScript("//connect.facebook.net/en_US/all.js#xfbml=1", function () {
                return initializeFacebookSDK();
            });
        });
        }
    });
