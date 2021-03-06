initializeFacebookSDK = ->
  FB.init
    appId: '456973521359868',
    cookie: true,
    xfbml: true,
    version: 'v2.8'
jQuery ->
  delete FB
  $.getScript "//connect.facebook.net/hu_HU/sdk.js#xfbml=1", ->
    initializeFacebookSDK()
###
initializeFacebookSDK = ->
  FB.init
    appId: '456973521359868',
    cookie: true,
    xfbml: true,
    version: 'v2.8'

  FB?.XFBML?.parse()

jQuery ->
  delete FB
  $.getScript "//connect.facebook.net/hu_HU/sdk.js#xfbml=1", ->
    initializeFacebookSDK()
###
#-------------------------------------------------------------------
###
$ ->
  loadFacebookSDK()
  bindFacebookEvents() unless window.fbEventsBound

bindFacebookEvents = ->
  $(document)
    .on('page:fetch', saveFacebookRoot)
    .on('page:change', restoreFacebookRoot)
    .on('page:load', ->
    FB?.XFBML.parse()
  )
  @fbEventsBound = true

saveFacebookRoot = ->
  if $('#fb-root').length
    @fbRoot = $('#fb-root').detach()

restoreFacebookRoot = ->
  if @fbRoot?
    if $('#fb-root').length
      $('#fb-root').replaceWith @fbRoot
    else
      $('body').append @fbRoot

loadFacebookSDK = ->
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/en_US/sdk.js")

initializeFacebookSDK = ->
  FB.init
    appId  : '456973521359868'
    status : true
    cookie : true
    xfbml  : true
    version: 'v2.8'
###