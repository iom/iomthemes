# WARNING - Generated by {fusen} from dev/fusen_dev.Rmd: do not edit by hand

#' A ShinyGadget to simply overlay an annotation on a ggplot2 chart
#'
#'  See https://shiny.posit.co/r/articles/build/gadgets/
#'  https://shiny.posit.co/r/articles/build/gadget-ui/
#'  https://posit.co/resources/videos/building-interactive-tools-for-exploratory-data-analysis/
#'  https://posit.co/resources/videos/introducing-shiny-gadgets-interactive-tools/
#'  https://stackoverflow.com/questions/30527977/ggplot2-how-to-differentiate-click-from-brush
#'
#' @param chart the ggplot2 object...
#' @param viewer Specify where the gadget should be displayed–viewer pane, dialog window, or external browser–by passing in a call to one of the viewer() functions.
#' @return the code snippet wit the annotation
#' @importFrom miniUI miniPage gadgetTitleBar miniContentPanel miniButtonBlock
#' @importFrom ggtext geom_textbox
#' @importFrom stringr str_wrap
#' @import ggplot2
#' @import shiny
#' @noRd 
#' @keywords internal
#' @export
#' @examples
#' # if (interactive())
#' # Load packages
#' library(ggplot2)
#' library(iomthemes)
#'
#' # A dummy data frame
#' df <- data.frame(
#'   date = factor(rep(2010:2020, 2)),
#'   val = c(
#'     10.2, 10.2, 10.2, 11.5, 14,
#'     15.8, 17, 19.5, 20.5, 24.5, 20.6,
#'     4.9, 4.9, 4.9, 5.5, 5.5, 5.6,
#'     5.6, 5.7, 5.7, 5.8, 5.9
#'   ),
#'   set = rep(c("Set 1", "Set 2"), each = 11)
#' )
#'
#' # Base plot with theme_iom()
#' thischart <- ggplot(  data = df,
#'                       aes(x = date, y = val, fill = set)) +
#'   geom_col(
#'     position = position_stack(reverse = TRUE),
#'     width = 0.8
#'   ) +
#'   labs(
#'     title = "My title | 2010-2020",
#'     subtitle = "My subtitle",
#'     x = "date",
#'     y = "values",
#'     caption = "Source: Dummy data"
#'   ) +
#'   theme_iom()
#'
#'  
#' #out <- annotate_gadget(chart = thischart, viewer=paneViewer())
#'  
annotate_gadget <- function(chart, viewer=paneViewer()) {
  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Overlay your interpretation on the chart!"),
    miniUI::miniContentPanel(
      shiny::textAreaInput(inputId="annot",
                           label= "First Add your text",
                #            placeholder = "Use double quote on your text and
                # \\n special character to add carriage return on the text in the plot",
                           width = '100%'),
      "Then POSITION:  One first single click on the plot to point what you would like
      to highlight and then a long brush click to draw the box where the annotation
      should be overlaid",
      shiny::plotOutput("plot",
                        height = "60%",
                        width = "80%",
                        click="annotate_point",
                        brush= shiny::brushOpts(id="annotate_box")) #,
     # shiny::verbatimTextOutput("info", placeholder = TRUE )
      ) #,
    # miniUI::miniButtonBlock(
    #   shiny::actionButton("reset",
    #                       label = "Click here to reset the positionning",
    #                       border = "bottom",
    #                       icon = shiny::icon("arrow-up-right-from-square"))
    # )
  )
  server <- function(input, output, session) {
    # Initialize reactive values
    r <- reactiveValues(x = 0,
                        y = 0,
                        xmax = 0,
                        ymax = 0,
                        xmin = 0,
                        ymin = 0,
                        xbox = 0,
                        ybox = 0,
                        arrowcurve = 0.3,
                        arrowangle = 140,
                        annot = " ",
                        xcentroid = 0,
                        ycentroid = 0,
                        chart = chart)
    ## Observe Point
    observeEvent(input$annot,
                 handlerExpr = {
                   r$annot = input$annot }
    )
    ## Observe Point
    observeEvent(input$annotate_point,
                 handlerExpr = {
                   r$x = input$annotate_point$x
                   r$y = input$annotate_point$y }
    )
    ## Observer Brush o define the attachment point
    observeEvent(input$annotate_box,
                 handlerExpr = {
       r$xmax <- input$annotate_box$xmax  
       r$xmin <- input$annotate_box$xmin  
       r$ymax <- input$annotate_box$ymax  
       r$ymin <- input$annotate_box$ymin 
       ## Position based on centroid of the box
       r$xcentroid = r$xmin #+ (r$xmax - r$xmin)/2
       r$ycentroid = r$ymin + (r$ymax - r$ymin)/2
       ## Now adjust the point to link the box to arrow
       r$xbox = r$xmin - (r$xmax - r$xmin)*0.1
       r$ybox = r$ycentroid 
       if(r$ybox > r$ycentroid) {r$arrowcurve = -.3} else { r$arrowcurve = .3 }
       if(r$ybox > r$ycentroid) {r$arrowangle = 240} else { r$arrowangle = 140 }
                 }
    )
    # browser()
    # Render the plot
    output$plot <- shiny::renderPlot({
      ## get everything ready - text, point and box - then redraw the chart
      if( r$x > 0 & r$xcentroid > 0 ){
        r$chart <- chart +
          ## Annotation
          ggplot2::annotate(
            geom = "text",
            x = r$xcentroid,
            y = r$ycentroid, 
            #label =  r$annot  ,
            label = stringr::str_wrap(r$annot,20) ,
            # hjust and vjust make the reference point the lower left corner of your text
            hjust = 0, vjust = 0.5,
            color = "grey50",  
            size = 4, 
            #fontface = "bold",
            lineheight = .9) +
          ## Arrow
          ggplot2::annotate(
            geom = "curve",
            x = r$xbox,
            y = r$ybox, 
            xend = r$x, 
            yend = r$y,
            angle = r$arrowangle,
            curvature = r$arrowcurve, 
            color = "grey50",  
            arrow = ggplot2::arrow(
              length = ggplot2::unit(12, "pt"),
              type = "closed", ends = "last")  )
         }
       r$chart 
    })
    ## Get the parameters to add to the ggplot object to render this annotation
     output$code <- shiny::renderText({
      result <-  c(
         annot = r$annot,
         xcentroid = r$xcentroid,
         ycentroid = r$ycentroid,
         xbox = r$xbox,
         ybox = r$ybox,
         x = r$x,
         y = r$y)
      result
     })
 
     output$info <- shiny::renderText({
        paste0(" Text box coordinates: ",
               "\n  - xmin: ",  r$xmin,
               " / ymin: ", r$ymin,
               "\n  - xmax: ", r$xmax,
               " / ymax: ", r$ymax ,
               "\n  - xcentroid: ", r$xcentroid,
               " / ycentroid: ", r$ycentroid ,
               "\n Arrow pointer oordinates:",
               "\n  - x: ", r$x, " / y: ", r$y,
               "\n  - xbox: ", r$xbox, " / ybox: ", r$ybox)
     })
    ## Observe Reset
    observeEvent(input$reset, handlerExpr = {
      ## Center of the label
      r$xmin <-  0
      r$ymin <-  0
      r$xmax <-  0
      r$ymax  <-  00
      r$xcentroid <-  0
      r$ycentroid  <-  0
      ## Begin arrow0
      r$xbox <-  0
      r$ybox <-  0
      ## End arrow
      r$x <-  0
      r$y <-  0
    })
    # Handle the Done button being pressed.
    observeEvent(input$done, {
      # Return the code that will be used in the rest of the app...
      stopApp(
        output$info
        )
    })
  }
  shiny::runGadget(ui, server)
}
