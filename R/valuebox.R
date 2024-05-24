#' Valuebox
#'
#' Generate a \code{bslib::card()}-based valuebox
#'
#' @param icon a bootstrap string name
#' @param icon_size any valid css length unit
#' @param icon_bg_color background color of the icon container
#' @param text header text
#' @param value main value
#' @param body_text card body text
#' @param body_value card body value
#' @param footer_text footer text
#' @param footer_value footer value
#' @param footer_value_color color of the value font
#' @return A valuebox
#'
#' @export
valuebox <- function(
    icon = "github"
    ,icon_size = "1.6rem"
    ,icon_bg_color = "#C0B9DD"
    ,text = NULL
    ,value = NULL
    ,body_text = NULL
    ,body_value = NULL
    ,footer_text = NULL
    ,footer_value = NULL
    ,footer_value_color = "#A7F500"
) {

  footer_value_color = gsub('"', '', footer_value_color)

  div(
    style = "position: relative;"
    ,includeCSS(system.file(package = "mywidgets", "www/css/valuebox.css"))

    ,div(
      style = "position: absolute; top: -10px; left: 10px; z-index: 1;"
      ,div(
        class = "icon-wrapper"
        ,style = glue::glue("background-color: {icon_bg_color}")
        ,bsicons::bs_icon(icon, size = icon_size)
      )
    )

    ,bslib::card(

      bslib::card_body(
        div(
          class = "row"
          ,div(class = "col-7"," ")
          ,div(
            class = "col-5"
            ,div(
              tags$span(text, class = "text-style")
              ,br()
              ,tags$span(glue::glue("{value}"), class = "value-style")
              ,br()
              ,tags$span(body_text, class = "text-style", style = "display: inline-block; font-size: 13px")
              ,tags$span(glue::glue("{body_value}"), class = "value-style", style = "font-size: 16px")
            )
          )
        )
      )

      ,bslib::card_footer(
        div(
          tags$span(
            glue::glue("{footer_value}")
            ,class = "value-style-footer"
            ,style = glue::glue("color: {footer_value_color}"))
          ,tags$span(footer_text, class = "text-style")
        )
        ,class = "card-footer-valuebox"
      )

    )
  )

}

