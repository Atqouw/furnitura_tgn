window.Application           ||= {}
window.Application.Classes   ||= {}

class Application.Core

  start: ->
    $(document).on 'turbolinks:change', @afterRenderPage()

  afterRenderPage: =>
    @initializePlugins()
    @bindClasses()
    @afterRenderPageAlertInit()
    Turbolinks.clearCache()

  afterRenderPageAlertInit: =>
#    $('.materialize-flash').each (i, el) =>
#      Application.Classes.Toastr.render($(el).text(), { type : $(el).data('type'), title : '' })

  bindClasses: ($scope = $('body')) =>
    $scope.find("[data-class-binder]").each (k, el) =>
      $.each $(el).data("class-binder").split(' '), (index, className) =>
        new Application.Classes[className]($(el))

  initializePlugins: ($scope = $('body')) =>
    @initializeDropdown($scope)
    @initializeSidebar($scope)
    @initializeSwiper($scope)


  initializeDropdown: ( $scope = $('body') ) =>
    $scope.find('.dropdown').dropdown()

  initializeSidebar: ( $scope = $('body') ) =>
    $('#toggle_sidebar_size').click ->
      $('.ui.sidebar').sidebar(overlay: true).sidebar 'toggle'

  initializeSwiper: ( $scope = $('body') ) =>
    swiper = new Swiper('.swiper-container',
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      pagination: {
        el: '.swiper-pagination',
      },
      loop: true,
      autoplay: true,
    )

