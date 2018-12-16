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
#    @initializeTextFields($scope)

