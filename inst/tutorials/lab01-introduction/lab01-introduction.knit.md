---
title: "Lab 01 - Introduction"
output: 
  learnr::tutorial:
    fig_caption: no
    progressive: true
    allow_skip: true
    toc: true
    toc_depth: 3
    theme: readable
runtime: shiny_prerendered
---





## Introduction

Welcome to the first tutorial of __Social Network Analysis for Data Science__!
We are really excited that you decided to take this course. 

The purpose of this tutorial is:

* to get acquainted with the type of online tutorials we use for this course
* to familiarize yourself (again) with R
* to set some conventions (*best practices*) that we will strictly adhere to in 
this course
* to learn how to construct social networks in R

_Let's get to it!_


## Quick checks

You need to run at least the 1.3 version of Rstudio. Lemme check if you indeed 
have the correct version. 


```
## [1] "You are running Rstudio version 1.3.959 which \n                                 is excellent!"
```

Let's do a few more checks, for the main packages you'll need in this tutorial.



You need to run at least R version 4.0. You are currently running version 4.0.0 (2020-04-24) 
which is wonderful.


Note that the `SNA4DS` package will continue to be updated throughout the
semester, you will probably need additional packages as we go along. If you
continue to refresh the package by weekly running
`remotes::install_github(SNAnalyst/SNA4DS, dependencies = TRUE)`, you should be
fine. Without the `dependencies = TRUE` argument, you may miss some
dependencies, which can cause you to get errors at some point.


## How the tutorials work

We are using technology that allow you to learn how to code in R to analyze
social networks. It will be fairly obvious how it works. Let's try it out.

*Here's a simple exercise with an empty code chunk provided for entering the answer.*

You can simply enter R code and run it as if you were running it inside R itself 
(well, actually, it is running inside your R session behind the scenes). 

You can restart the code entirely by clicking the _Start over_ button. You can 
see the result of your code by clicking the _Run Code_ button.

Try it. Write the R code required to add two plus two:

<div class="tutorial-exercise" data-label="two-plus-two" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

Actually, we often want you to write some code and then check whether your code 
is correct. 
Here's an example. 

* Take the square root of the log of 2. Then click Submit Answer.

<div class="tutorial-exercise" data-label="grade_code1" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

<div class="tutorial-exercise-support" data-label="grade_code1-solution" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
sqrt(log(2))
```

</div>

<div class="tutorial-exercise-support" data-label="grade_code1-check" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
gradethis::grade_code(correct = "Excellent work.", grader_args = list(`solution_quo` = "sqrt(log(2))"))
```

</div>



As you can see, you now have the _Submit Answer_ button. There is also a
_Solution_ button, in case you can't figure out how what the code should be. You
first write your code in the answer box, try it out with _Run Code_ and you
click _Submit Answer_ when you think you have the correct answer.


### Quizzes

We'll also use quizzes, from time to time. How they work is quite self-explanatory.

<!--html_preserve--><div class="panel panel-default">
<div data-label="testquiz" class="tutorial-question panel-body">
<div id="testquiz-answer_container" class="shiny-html-output"></div>
<div id="testquiz-message_container" class="shiny-html-output"></div>
<div id="testquiz-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->

<!--html_preserve--><div class="panel panel-default">
<div data-label="testquiz2" class="tutorial-question panel-body">
<div id="testquiz2-answer_container" class="shiny-html-output"></div>
<div id="testquiz2-message_container" class="shiny-html-output"></div>
<div id="testquiz2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->

So far, so good. Let's make sure we are up-to-speed with how to use R.


## R basics

We are going to assume that you are familiar with R and fairly comfortable with
it. If you are not familiar with R or are very rusty at it, make sure to brush
up on it. We do not have the time in this course to repeat basic R training.
Yes, we know that the book has Python code in it, but if you want to be able to
do advanced social network analysis (especially using statistical models), there
is simply no competition for the R environment.

### Installing a package
You install package from RStudio console as follows:
(Note the quotation marks!)

`install.packages("name_of_package")`

It is especially advised to run it as
`install.packages("name_of_package", dependencies = TRUE)`
which will ensure that the packages the installed library depends on will also be 
installed.

This assumes that the package is available on
[cran](https://cran.r-project.org/web/packages/index.html). For packages from
github, you would run

`remotes::install_github(SNAnalyst/SNA4DS)`

or, of course, it is again better to run:
`remotes::install_github(SNAnalyst/SNA4DS, dependencies = TRUE)`


### Getting help: General
R has an excellent built-in help system, which is really useful if-and-only-if 
you actually actively use it. It is the reflex of many students to immediately 
start Googling when they don't know a function name. This has a bunch of 
disadvantages:

1. You end up not remembering the names of the useful functions, so you end up 
spending way more time writing your code, in the long run, than if you had taken 
the effort to learn the functions themselves;
2. You often come across answers that are fairly old. If you don't notice that, 
then you'll end up implementing a solution that can be improved quite a bit with 
more recent functions;
3. A lot of advice on the internet is plain wrong. Surely, there are a lot of 
very knowledgeable people on the internet and if you work with R (or any language 
or topic) long enough, you'll get to know who they are and get to recognize the 
quality of answers given. But if Google is your first and standard refuge, you'll 
be much less likely to develop the skill and knowledge to separate the wheat from 
the chaff. That doesn't help you.
4. Perhaps most importantly for you: you are not allowed to use Google during 
the exam. In fact, you may have to do your exam in an online environment in which 
it is not possible to use Google, even if you wanted to cheat.
5. What should be most important: the internal help files are often very helpful 
and give you all of the details on a function. Whereas the answer on an internet 
forum likely focuses on a very specific application only, the R help gives you 
full detail on all of the arguments of a function. Very frequently you'll find 
that you do not only need to know the name of the function, but also the exact 
arguments that make sense for your specific task. The help also often points you 
to related functions, that may actually be even more relevant to you than the 
function you were considering.
6. R is a living language and packages and functions change over time. Some of 
them a lot. So, the advice on Google may simply not be correct anymore in the new 
version of a package. R help will help you with that too.


So, how to use the R help? If you want to get help for the `as.numeric`
function, you type `?as.numeric` or `help("as.numeric")` (note the parentheses).

Try it out, find the help for the function `data.frame`:

<div class="tutorial-exercise" data-label="helpExc1" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

<div class="tutorial-exercise-support" data-label="helpExc1-solution" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
?data.frame
```

</div>

<div class="tutorial-exercise-support" data-label="helpExc1-check" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
grade_code(correct = "Correct!")
```

</div>


Now get help for the `betweenness` function:

<div class="tutorial-exercise" data-label="helpExc2" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

Mmm, you did not get a result, why? Well, the previous approach of
`?functionName` only gives you help for functions in libraries that are loaded
into your current R session. But it will not help you with functions from
libraries that you have not currently loaded and also not with functions that
are not installed on your computer.


### Getting help: Using `?`

Suppose you want help with the function `betweenness` and happen to know it
exists inside the `igraph` package. In that case, you can get help as follows:

<div class="tutorial-exercise" data-label="helpExc3" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
?igraph::betweenness
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

or, a little bit more verbose:

<div class="tutorial-exercise" data-label="helpExc4" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
help("betweenness", package = "igraph")
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

If you want, you can abbreviate it to `help("betweenness", "igraph")`.

Now, get help for the `betweenness` function in the `sna` package. Use the `?`
approach first:

<div class="tutorial-exercise" data-label="helpExc5" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

<div class="tutorial-exercise-support" data-label="helpExc5-solution" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
?sna::betweenness
```

</div>

<div class="tutorial-exercise-support" data-label="helpExc5-check" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
grade_code(correct = "Excellent work.")
```

</div>

And, finally, use `help()` to get the details on the `betweenness` function in 
the `sna` package.

<div class="tutorial-exercise" data-label="helpExc6" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

<div class="tutorial-exercise-support" data-label="helpExc6-solution" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
help("betweenness", "sna")
```

</div>

<div class="tutorial-exercise-support" data-label="helpExc6-check" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
grade_code(correct = "You've got the hang of this.")
```

</div>

This all assumed that you knew the package name. But what if you don't?

Again, R is there to help. You are a but more uncertain than just before, so
simply add an additional question mark.


### Getting help: Using `??`

Let's say you knew there was this function `sankeyNetwork` to plot a network in
a cool way, but you couldn't remember what package it was is. Then you can do
the following:

<div class="tutorial-exercise" data-label="helpExc7" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
??sankeyNetwork
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

It is quite possible that you'll get a bunch of results, depending on how
specific the function name is. For example, try finding the `transitivity`
function and check what you get.

<div class="tutorial-exercise" data-label="helpExc8" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

You will see that there is a `transitivity` function in the `igraph`, but there
are more packages that have functions with the word _transitivity_ (or a word
that is similar to it) in the description.

Note, though, that this will only search the packages you have installed on your
machine. It will not search all of the other R packages that exist on the
internet (CRAN, github, Buiconductor, et cetera).

Oh, and if you want to pull up the help for a package as a whole, run
`help(package = "package_name")`. For example:

<div class="tutorial-exercise" data-label="helpExc9" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
help(package = "ergm")
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

(you will be spending quite some time with this package later in the course)

### Getting help: Using `RSiteSearch`

And what if you are looking for a function or functionality that is not in one
of the packages on your machine? The first thing to do would be to search the R
archives. Let's search for the `metric.degree.min` function. You do this through
`RSiteSearch`:


<div class="tutorial-exercise" data-label="rsitesearch" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
RSiteSearch("metric.degree.min")
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

This will open a web page with the threads in which this term has been discussed
in the [R discussion group](http://search.r-project.org). But here you can try
Google as well, of course. Or go to [the Rseek webpage](https://rseek.org/)
which uses Google to seek for R specific reults.

So, let's see if you have it all in your head now.

<!--html_preserve--><div class="panel-heading tutorial-quiz-title">Quiz</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="quiz_help-1" class="tutorial-question panel-body">
<div id="quiz_help-1-answer_container" class="shiny-html-output"></div>
<div id="quiz_help-1-message_container" class="shiny-html-output"></div>
<div id="quiz_help-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="quiz_help-2" class="tutorial-question panel-body">
<div id="quiz_help-2-answer_container" class="shiny-html-output"></div>
<div id="quiz_help-2-message_container" class="shiny-html-output"></div>
<div id="quiz_help-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->




## R conventions

There are several conventions/best practices that we are going to strictly
adhere to throughout the course.


## R convention I: Don't load R packages
In much code examples in books and on the internet, you see that a library is
loaded/attached (for the purpose of this course, we will use these two terms
interchangeably) using `library(package_name)`. This makes the functions inside
that package directly accessible to the user. That may seem like a useful thing.
But, actually, it is almost always a really really really bad idea. There are
many reasons for this, but these are the most important ones:

1. If a function moves from one package to another (and this actually happens
quite frequently), your code won't work anymore and, more importantly, you don't
really know why.
2. The habit of using `library(package_name)` may then cause you to use it in
your own interactive work as well. Then, once you save a script off of your
interactive code, chances are it won't work well, because it depends on specific
packages being loaded, and that may not have been included when you created your
own script. As a result, debuggin becomes a nightmare. Trust us, we have way too
much experience with this scenario ourselves...
3. When you load anything into R, it gets attached R's search path. Generally
speaking, when you attach _package1_ it is placed on the top of the search path.
That is handy, because all of the functions of _package1_ will be fully
available to you. Then, when you attach _package2_, that will move to the front
and _package1_ will become second in the path. That is not a problem, until you
load packages that have functions with the same name.




Here's an example. You have a network in your R session that is called `friendship`. 
This is what it looks like:

<!--html_preserve--><div id="htmlwidget-d3ef4bb39f3542f33bf4" style="width:624px;height:384px;" class="forceNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-d3ef4bb39f3542f33bf4">{"x":{"links":{"source":[9,4,7,3,8,4,2,4,7,3,9,8,0,1,0,7,1,3],"target":[0,0,1,1,1,2,3,3,3,4,4,5,6,7,8,8,8,9],"colour":["#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666"]},"nodes":{"name":["john","peter","baheer","elise","felix","mohammad","mikel","joan","gerrit","gideon"],"group":[2,1,3,3,3,1,2,1,1,3]},"options":{"NodeID":"name","Group":"group","colourScale":"d3.scaleOrdinal(d3.schemeCategory20);","fontSize":7,"fontFamily":"serif","clickTextSize":17.5,"linkDistance":50,"linkWidth":"function(d) { return Math.sqrt(d.value); }","charge":-30,"opacity":0.8,"zoom":false,"legend":false,"arrows":false,"nodesize":false,"radiusCalculation":" Math.sqrt(d.nodesize)+6","bounded":false,"opacityNoHover":true,"clickAction":"alert(\"You clicked \" + d.name + \" which is in row \" +\n       (d.index + 1) +  \" of your original R data frame\");"}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

You load the `sna` package to calculate the betweenness scores of the actors in
the network (no worries, next week we will discuss the betweenness measure in
detail). Run the following and see what happens:

<div class="tutorial-exercise" data-label="library1" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
library(sna)
betweenness(friendship)
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":false,"error":false,"message":false,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

Nice, and if you wanted to see the names of the actors next to their scores, you 
could run:

<div class="tutorial-exercise" data-label="library1a" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
data.frame(betweenness = betweenness(friendship), 
           names = network::get.vertex.attribute(friendship, "name"))
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

###

Well, that works nicely. You loaded the `sna` package and then could easily
calculate the betweenness scores. Now, you want to use some of the
functionalities from the `influenceR` package. Load that.

<div class="tutorial-exercise" data-label="library2" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
library(influenceR)
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

You want to use the `influenceR` package to calculate some measures on the
relative importance of the actors in the network. But first, what again were the
betweenness scores for the actors in this network? Let's run our previous code
again. Set the function name to `betweenness` and run the code.

<div class="tutorial-exercise" data-label="library_error" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
...(friendship)
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

Hey, what happened? Well, `influenceR` also has a function that is called
`betweenness` and since you loaded `influenceR` last, the `betweenness` function
of the `influenceR` package is now higher in R's search path than the
`betweenness` function of the `sna` package. In this case, the `influenceR`
package throws an error, because it expects an object in a different form than
the object `g`. But if `influenceR` would have been able to directly deal with
this object `friendship`, it might have given you a very different result than
you were expecting (because who says that the `betweenness` function does the
same thing in both the `influenceR` and the `sna` packages).

Now, first predict what will happen when you run the follow code, and then
indeed run it. Does it do what you expected?

<div class="tutorial-exercise" data-label="library2a" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
detach(package:influenceR)    # this "unloads" the package
betweenness(friendship)
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

Why do you now get this result?

It is actually quite useful that R does this, but you can see that it can be
risky if you don't know what is happening.

### Solution
The best practice is to explicitly refer to external functions using the syntax
`package::function()`. That way R will always use the function from the required
package.

Try it out:

<div class="tutorial-exercise" data-label="library3" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
library(sna)
library(influenceR)   # the `betweenness` function of package `influenceR` is now at the top
sna::betweenness(friendship)   # you now run `betweenness` from `sna`
```

<script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

If you use a lot of functions from other packages this is can become rather
verbose. There’s also a minor performance penalty associated with :: (on the
order of 5µs, so it will only matter if you call the function millions of
times). But, either way: it is generally __STUPID__ to use `library` and
__SMART__ to use `::`!

> it is generally __STUPID__ to use `library` and
__SMART__ to use `::`!
So, in this course we expect you to use `::` throughout. There are a few
exceptions to this rule, and we will let you know explicitly. Unless we tell you
explicitly that you can make a specific exception, use `::` always!

Try it out. In the code clock below, write the code such that it will calculate
closeness scores using the `sna` package. The appropriate function is called
`closeness`. As just agree upon, do not load the `sna` package for this.

<div class="tutorial-exercise" data-label="library4" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-opts-chunk="1">{"fig.width":6.5,"fig.height":4,"fig.retina":2,"fig.align":"default","fig.keep":"high","fig.show":"asis","out.width":624,"warning":true,"error":false,"message":true,"exercise.df_print":"paged","exercise.checker":["function (label = NULL, solution_code = NULL, user_code = NULL, ","    check_code = NULL, envir_result = NULL, evaluate_result = NULL, ","    envir_prep = NULL, last_value = NULL, ...) ","{","    if (is.null(user_code)) {","        return(list(message = \"I didn't receive your code. Did you write any?\", ","            correct = FALSE, type = \"error\", location = \"append\"))","    }","    else {","        user_code <- parse(text = user_code)","        if (length(user_code) == 0) {","            return(list(message = \"I didn't receive your code. Did you write any?\", ","                correct = FALSE, type = \"error\", location = \"append\"))","        }","    }","    if (!is.null(solution_code)) {","        solution_code <- parse(text = solution_code)","        if (length(solution_code) == 0) {","            return(list(message = \"No solution is provided for this exercise.\", ","                correct = TRUE, type = \"info\", location = \"append\"))","        }","    }","    had_error_checking <- FALSE","    checked_result <- tryCatch({","        parsed_check_code <- parse(text = check_code)","        if (length(parsed_check_code) > 1) {","            for (i in 1:(length(parsed_check_code) - 1)) {","                eval(parsed_check_code[[i]], envir_prep)","            }","        }","        grading_code <- rlang::call_standardise(parsed_check_code[[length(parsed_check_code)]], ","            envir_prep)","        grader_args <- list(user_quo = rlang::as_quosure(user_code[[length(user_code)]], ","            envir_result))","        if (!is.null(solution_code)) {","            grader_args$solution_quo <- rlang::as_quosure(solution_code[[length(solution_code)]], ","                envir_prep)","        }","        learnr_args <- list(...)","        learnr_args$label <- label","        learnr_args$solution_code <- solution_code","        learnr_args$user_code <- user_code","        learnr_args$check_code <- check_code","        learnr_args$envir_result <- envir_result","        learnr_args$evaluate_result <- evaluate_result","        learnr_args$envir_prep <- envir_prep","        learnr_args$last_value <- last_value","        grading_code$grader_args <- grader_args","        grading_code$learnr_args <- learnr_args","        envir_prep$ans <- grader_args$user","        eval(grading_code, envir_prep)","    }, error = function(e) {","        message(\"\", e)","        had_error_checking <<- TRUE","        graded(correct = FALSE, message = \"Error occured while checking the submission\")","    })","    if (!checkmate::test_class(checked_result, \"grader_graded\")) {","        stop(\"`grade_learnr` should receive a `graded` value from every `-check` chunk\")","    }","    message_type <- if (had_error_checking) {","        \"warning\"","    }","    else {","        if (checked_result$correct) {","            \"success\"","        }","        else {","            \"error\"","        }","    }","    ret <- list(message = checked_result$message, correct = checked_result$correct, ","        type = message_type, location = \"append\")","    ret","}"]}</script></div>

<div class="tutorial-exercise-support" data-label="library4-solution" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
sna::closeness(friendship)
```

</div>

<div class="tutorial-exercise-support" data-label="library4-check" data-caption="Code" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
grade_code(correct = "Excellent, this is how we want it! Keep doing it this way for the rest of your life!")
```

</div>




## R convention II: Assignment

This has become quite long, so we are just going to mention these conventions
quickly. But they are important nonetheless.
When you assign something to an object, you should ALWAYS use `<-` rather than
`=`. This too is something that we will strictly adhere to in this course. The
reason why this is important is too deeply-R and beyond the scope of this
course. Just make sure you use
`x <- 5`

instead of

`x = 5`

> Use `<-` rather than `=` for an assignment. Always.


## R convention III: Spaces

This may seem a moot point, but please make a habit out of it: Place spaces
around all infix operators (`=`, `+`, `-`, `<-`, etc.). The same rule applies
when using `=` in function calls. Always put a space after a comma, and never
before (just like in regular English).

Good

```r
average <- mean(feet / 12 + inches, na.rm = TRUE)
```


Bad

```r
average<-mean(feet/12+inches,na.rm=TRUE)
```

There’s a small exception to this rule: `:`, `::` and `:::` don’t need spaces 
around them.


Good

```r
x <- 1:10
base::get
```



Bad

```r
x <- 1 : 10
base :: get
```

Place a space before left parentheses, except in a function call.


So, good:
`sna::betweenness(dat = friendship, g = 1, nodes = NULL, gmode = "digraph")` 

Bad:
`sna::betweenness(dat=friendship,g=1,nodes=NULL,gmode="digraph")`

Why? Well, because it makes the final code much more readable. Compare it to
writing  asentenceintheEnglishlanguagewithoutspaces, it is still readable, but
much less easily.

> Use spaces!


## R convention IV: Informative Names

For all of the objects you use in your code, make sure to give them _informative
names_. It is bad habit to call your network `g` or `x`, because you will likely
not understand the code when you read it later. And neither will the
instructors, so helping you with/commenting on your code will become
unnecessarily cumbersome. Make sure to give all of your objects informative
names, ie. names that make it immediately clear what it is. It may take you a
little bit more time at first, but will save you tremendous amounts of time on
the long run.

> Always use informative names for all of your objects


## R convention V: More info

For more info on how to organize R code, see [Hadley's Style
Guide](http://adv-r.had.co.nz/Style.html) and [Google's R Style
Guide](https://google.github.io/styleguide/Rguide.html) and [Jef R Style
Guide](http://jef.works/R-style-guide/).

## Network analysis

OK, that is enough R stuff. Let's now do some network stuff. 

This happens in the next tutorial: `lab01a-networksInR`.
You can start it by running




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
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-two-plus-two-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-two-plus-two-code-editor`)), session)
output$`tutorial-exercise-two-plus-two-output` <- renderUI({
  `tutorial-exercise-two-plus-two-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-grade_code1-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-grade_code1-code-editor`)), session)
output$`tutorial-exercise-grade_code1-output` <- renderUI({
  `tutorial-exercise-grade_code1-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "testquiz", question = structure("What is the programming language that is core in this course?", html = TRUE, class = c("html", "character")), answers = list(structure(list(id = "lnr_ans_4439876",     option = "C", value = "C", label = structure("C", html = TRUE, class = c("html",     "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", "tutorial_quiz_answer")), structure(list(id = "lnr_ans_5820e85",     option = "Javascript", value = "Javascript", label = structure("Javascript", html = TRUE, class = c("html",     "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", "tutorial_quiz_answer")), structure(list(id = "lnr_ans_c863f45",     option = "R", value = "R", label = structure("R", html = TRUE, class = c("html",     "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", "tutorial_quiz_answer")), structure(list(id = "lnr_ans_361b97f",     option = "Google", value = "Google", label = structure("Google", html = TRUE, class = c("html",     "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", "character")), try_again = structure("Try Again", html = TRUE, class = c("html", "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", "character")), message = NULL, post_message = NULL), ids = list(    answer = "testquiz-answer", question = "testquiz"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat is the programming language that is core in this course?\n<br/><br/><br/>", html = TRUE, class = c("html", "character")), random_answer_order = FALSE, allow_retry = FALSE,     seed = 1958582005.08796, options = list()), class = c("learnr_radio", "tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "testquiz2",     question = structure("What are some of the R packages that we use in this course?", html = TRUE, class = c("html",     "character")), answers = list(structure(list(id = "lnr_ans_ab3bd9",         option = "sna", value = "sna", label = structure("sna", html = TRUE, class = c("html",         "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_c5748a4",         option = "igraph", value = "igraph", label = structure("igraph", html = TRUE, class = c("html",         "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_a4b8886",         option = "tensorflow", value = "tensorflow", label = structure("tensorflow", html = TRUE, class = c("html",         "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_fcb62c0",         option = "ergm", value = "ergm", label = structure("ergm", html = TRUE, class = c("html",         "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_7076636",         option = "networkzz", value = "networkzz", label = structure("networkzz", html = TRUE, class = c("html",         "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html",     "character")), try_again = structure("Try Again", html = TRUE, class = c("html",     "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html",     "character")), try_again = structure("Incorrect", html = TRUE, class = c("html",     "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html",     "character")), message = NULL, post_message = NULL), ids = list(        answer = "testquiz2-answer", question = "testquiz2"),     loading = structure("<strong>Loading:<\u002fstrong> \nWhat are some of the R packages that we use in this course?\n<br/><br/><br/>", html = TRUE, class = c("html",     "character")), random_answer_order = FALSE, allow_retry = FALSE,     seed = 425741211.801749, options = list()), class = c("learnr_checkbox", "tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc1-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc1-code-editor`)), session)
output$`tutorial-exercise-helpExc1-output` <- renderUI({
  `tutorial-exercise-helpExc1-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc2-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc2-code-editor`)), session)
output$`tutorial-exercise-helpExc2-output` <- renderUI({
  `tutorial-exercise-helpExc2-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc3-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc3-code-editor`)), session)
output$`tutorial-exercise-helpExc3-output` <- renderUI({
  `tutorial-exercise-helpExc3-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc4-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc4-code-editor`)), session)
output$`tutorial-exercise-helpExc4-output` <- renderUI({
  `tutorial-exercise-helpExc4-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc5-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc5-code-editor`)), session)
output$`tutorial-exercise-helpExc5-output` <- renderUI({
  `tutorial-exercise-helpExc5-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc6-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc6-code-editor`)), session)
output$`tutorial-exercise-helpExc6-output` <- renderUI({
  `tutorial-exercise-helpExc6-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc7-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc7-code-editor`)), session)
output$`tutorial-exercise-helpExc7-output` <- renderUI({
  `tutorial-exercise-helpExc7-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc8-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc8-code-editor`)), session)
output$`tutorial-exercise-helpExc8-output` <- renderUI({
  `tutorial-exercise-helpExc8-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-helpExc9-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-helpExc9-code-editor`)), session)
output$`tutorial-exercise-helpExc9-output` <- renderUI({
  `tutorial-exercise-helpExc9-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-rsitesearch-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-rsitesearch-code-editor`)), session)
output$`tutorial-exercise-rsitesearch-output` <- renderUI({
  `tutorial-exercise-rsitesearch-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "quiz_help-1",     question = structure("How would you get help for the function that implements the <em>walktrap<\u002fem> algorithm?", html = TRUE, class = c("html",     "character")), answers = list(structure(list(id = "lnr_ans_50ae44d",         option = "?walktrap", value = "?walktrap", label = structure("?walktrap", html = TRUE, class = c("html",         "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_e73c0dc",         option = "??walktrap", value = "??walktrap", label = structure("??walktrap", html = TRUE, class = c("html",         "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_56e1c0d",         option = "help(walktrap", value = "help(walktrap", label = structure("help(walktrap", html = TRUE, class = c("html",         "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_f06d386",         option = "find('walktrap')", value = "find('walktrap')",         label = structure("find(&#39;walktrap&#39;)", html = TRUE, class = c("html",         "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_568b43",         option = "search(walktrap)", value = "search(walktrap)",         label = structure("search(walktrap)", html = TRUE, class = c("html",         "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_17d4881",         option = "search('walktrap')", value = "search('walktrap')",         label = structure("search(&#39;walktrap&#39;)", html = TRUE, class = c("html",         "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html",     "character")), try_again = structure("Try Again", html = TRUE, class = c("html",     "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html",     "character")), try_again = structure("Incorrect", html = TRUE, class = c("html",     "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html",     "character")), message = NULL, post_message = NULL), ids = list(        answer = "quiz_help-1-answer", question = "quiz_help-1"),     loading = structure("<strong>Loading:<\u002fstrong> \nHow would you get help for the function that implements the <em>walktrap<\u002fem> algorithm?\n<br/><br/><br/>", html = TRUE, class = c("html",     "character")), random_answer_order = FALSE, allow_retry = FALSE,     seed = 46079888.9785424, options = list()), class = c("learnr_checkbox", "tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "quiz_help-2",     question = structure("What is the preferred way to install the SNA4DS package?", html = TRUE, class = c("html",     "character")), answers = list(structure(list(id = "lnr_ans_e08351d",         option = "remotes::install_github(SNAnalyst/SNA4DS, dependencies = TRUE)",         value = "remotes::install_github(SNAnalyst/SNA4DS, dependencies = TRUE)",         label = structure("remotes::install_github(SNAnalyst/SNA4DS, dependencies = TRUE)", html = TRUE, class = c("html",         "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_65883cd",         option = "install.packages(SNAnalyst/SNA4DS, dependencies = TRUE)",         value = "install.packages(SNAnalyst/SNA4DS, dependencies = TRUE)",         label = structure("install.packages(SNAnalyst/SNA4DS, dependencies = TRUE)", html = TRUE, class = c("html",         "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_48352a5",         option = "remotes::install_github(SNAnalyst/SNA4DS)",         value = "remotes::install_github(SNAnalyst/SNA4DS)",         label = structure("remotes::install_github(SNAnalyst/SNA4DS)", html = TRUE, class = c("html",         "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer")), structure(list(id = "lnr_ans_e5b2efb",         option = "No need, I already have it installed, so I am done",         value = "No need, I already have it installed, so I am done",         label = structure("No need, I already have it installed, so I am done", html = TRUE, class = c("html",         "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer",     "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html",     "character")), try_again = structure("Try Again", html = TRUE, class = c("html",     "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html",     "character")), try_again = structure("Incorrect", html = TRUE, class = c("html",     "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html",     "character")), message = NULL, post_message = NULL), ids = list(        answer = "quiz_help-2-answer", question = "quiz_help-2"),     loading = structure("<strong>Loading:<\u002fstrong> \nWhat is the preferred way to install the SNA4DS package?\n<br/><br/><br/>", html = TRUE, class = c("html",     "character")), random_answer_order = FALSE, allow_retry = FALSE,     seed = 1368221241.36287, options = list()), class = c("learnr_radio", "tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-library1-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-library1-code-editor`)), session)
output$`tutorial-exercise-library1-output` <- renderUI({
  `tutorial-exercise-library1-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-library1a-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-library1a-code-editor`)), session)
output$`tutorial-exercise-library1a-output` <- renderUI({
  `tutorial-exercise-library1a-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-library2-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-library2-code-editor`)), session)
output$`tutorial-exercise-library2-output` <- renderUI({
  `tutorial-exercise-library2-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-library_error-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-library_error-code-editor`)), session)
output$`tutorial-exercise-library_error-output` <- renderUI({
  `tutorial-exercise-library_error-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-library2a-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-library2a-code-editor`)), session)
output$`tutorial-exercise-library2a-output` <- renderUI({
  `tutorial-exercise-library2a-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-library3-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-library3-code-editor`)), session)
output$`tutorial-exercise-library3-output` <- renderUI({
  `tutorial-exercise-library3-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-library4-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-library4-code-editor`)), session)
output$`tutorial-exercise-library4-output` <- renderUI({
  `tutorial-exercise-library4-result`()
})
</script>
<!--/html_preserve-->
