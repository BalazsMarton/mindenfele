initializeFacebookSDK = ->
  FB.init
    appId: '456973521359868',
    cookie: true,
    xfmbl: true,
    version: 'v2.8'

  FB?.XFBML?.parse()

jQuery ->
  delete FB
  $.getScript "//connect.facebook.net/en_US/all.js#xfbml=1", ->
    initializeFacebookSDK()