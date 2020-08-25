---
title: "Lab 02 - Measures I"
output: 
  learnr::tutorial:
    fig_caption: no
    progressive: true
    allow_skip: no
    # toc: true
    # toc_depth: 2
    theme: readable
runtime: shiny_prerendered
---



<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server-start">
library(learnr)
library(gradethis)
# library(magrittr)
tutorial_options(exercise.checker = gradethis::grade_learnr)
knitr::opts_chunk$set(echo = FALSE)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::register_http_handlers(session, metadata = NULL)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
session$onSessionEnded(function() {
        learnr:::session_stop_event(session)
      })
</script>
<!--/html_preserve-->
