class Flash
  fadeOut: () ->
    $('.alert').delay(2000).fadeOut(1000)

  log: (key, message) =>
    classes = "alert alert-#{key}"
    alert =
      "<div class=\"#{classes}\">
        <button type=\"button\" class=\"close\" data-dismiss=\"alert\"> &times;</button>
        #{message}
      </div>"
    $('.alerts').append(alert)
    @fadeOut()

  success: (message) =>
    @log("success", message)

  warning: (message) =>
    @log("warning", message)

  danger: (message) =>
    @log("danger", message)

  info: (message) =>
    @log("info", message)

window.Flash = new Flash()
