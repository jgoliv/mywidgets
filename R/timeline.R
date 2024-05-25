#' Timeline item
#'
#' Create an item containing a bootstrap icon, primary and secondary values and texts.
#' Each item will be appended to a timeline using the \code{mywidgets::timeline()} function.
#'
#' @param icon a bootstrap icon string name
#' @param icon_color color of the icon
#' @param icon_size any valid css length unit
#' @param value main value of the timeline item
#' @param value_color color of the main value
#' @param value_text main value adjacent text
#' @param secondary_value secondary value of the timeline item
#' @param secondary_value_color color of the secondary value
#' @param secondary_value_text secondary value adjacent text
#' @return A timeline item
#'
#' @export
timeline_item <- function(
    icon = "github"
    ,icon_color = "#C0B9DD"
    ,icon_size = "25px"
    ,value = NULL
    ,value_color = "#C0B9DD"
    ,value_text = NULL
    ,text = NULL
    ,secondary_value = NULL
    ,secondary_value_color = "#C0B9DD"
    ,secondary_value_text = NULL
) {

  value_color = gsub('"', '', value_color)
  secondary_value_color = gsub('"', '', secondary_value_color)

  div(
    class = "timeline-item"
    ,div(class = "timeline-icon", bs_icon(icon, size = icon_size, color = icon_color))
    ,div(
      class = "timeline-content"
      ,tags$span(value, class = "timeline-value-style", style = glue::glue("color: {value_color};"))
      ,tags$span(value_text, class = "timeline-subtitle-style")
      ,br()
      ,tags$span(text, class = "timeline-text-style", style = "font-style: italic;")
      ,tags$span(secondary_value, class = "timeline-value-style", style = glue::glue("font-size: 15px; color: {secondary_value_color};"))
      ,tags$span(secondary_value_text, class = "timeline-text-style", style = "font-style: italic;")
    )
  )
}

#' Timeline
#'
#' Create a timeline containing itens created with the \code{mywidgets::timeline_itens()} function.
#'
#' @param title title of the timeline
#' @param subtitle subtitle of the timeline
#' @param ... named lists containing the arguments and values to apply to the \code{mywidgets::timeline_item} function.
#' @return A timeline
#' @example examples/timeline_example.R
#'
#' @export
timeline <- function(title = NULL, subtitle = NULL, ...) {

  items <- list(...)

  div(
    includeCSS(system.file(package = "mywidgets", "www/css/timeline.css"))
    ,style = "margin-left: 20px; margin-top:5px; margin-right: 20px;"
    ,tags$span(title, class = "timeline-title-style")
    ,br()
    ,tags$span(subtitle, class = "timeline-text-style")
    ,br()
    ,div(
      class = "timeline"
      ,map(items, \(x) do.call(timeline_item, x))
    )
  )
}
