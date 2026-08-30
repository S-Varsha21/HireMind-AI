library(shiny)

server <- function(input, output, session) {
  
  observeEvent(input$get_started, {
    
    showNotification(
      "Welcome to HireMind AI! Let's build your career intelligence profile.",
      type = "message"
    )
    
  })
  
  observeEvent(input$login, {
    
    showNotification(
      "Login system will be connected to the database soon.",
      type = "message"
    )
    
  })
  
  student_dashboard_server("student")
  
}