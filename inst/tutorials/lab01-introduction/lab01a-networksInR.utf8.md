---
title: "Lab 01b - Network Analysis in R"
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





## Introduction
There are two main packages in R to construct network objects. 

__The first is `igraph`.__ The `igraph` package actually has implementations in
C/C++, Python, Mathematica, and R. Although the `igraph` functions are slightly
different between these three environments, you will benefit from the code in
this course if you want to use `igraph` in another environment at a later time.

The general `igraph` page is [here](https://igraph.org/) and the 
extended documentation for the R version is [here](https://igraph.org/r/#docs).

__The second is the (creatively named) `network` package.__ This package
implements a class of _network_ objects that can be analyzed by packages such as
`sna` (these packages are all part of the _statnet_ suite of packages, that all
work together). We will make use of this package a lot as well.

Unfortunately, the `igraph` and `network` network objects are not
interchangeable, the objects that you create in `igraph` can not be used in
`network`/`sna`, and vice versa. This is unfortunate, because these packages
differ in their functionality, so you often might want to combine some `igraph`
functions with some `sna` functions in a single analysis. Fortunately, but there
are ways to move between the packages by transforming the object to fit the
other package. It is a bit cumbersome, but you will have to be able to do it
nonetheless.

## igraph
Let's start with the `igraph` package.

We can easily create an undirected network and add a few nodes and links. Nodes
are called _vertices_ and referred to by integer IDs; links are called _edges_.


```r
g <- igraph::make_empty_graph()

# add one vertex
g <- igraph::add_vertices(g, 1)
plot(g)
```

<img src="lab01a-networksInR_files/figure-html/book_1_2a-1.png" width="624" />

```r
# add two more vertices
g <- igraph::add_vertices(g, 2)
plot(g)
```

<img src="lab01a-networksInR_files/figure-html/book_1_2a-2.png" width="624" />

```r
# add an edge from 1 -> 2
g <- igraph::add_edges(g, c(1, 2))
g
```

```
## IGRAPH 9e2dbd0 D--- 3 1 -- 
## + edge from 9e2dbd0:
## [1] 1->2
```

```r
plot(g)
```

<img src="lab01a-networksInR_files/figure-html/book_1_2a-3.png" width="624" />




The code below generates an undirected graph with three edges. The numbers are
interpreted as vertex IDs, so the edges are 1–>2, 2–>3, 3–>1.


```r
g1 <- igraph::graph( edges=c(1,2, 2,3, 3, 1), n=3, directed=F ) 
plot(g1)
```

<img src="lab01a-networksInR_files/figure-html/unnamed-chunk-1-1.png" width="624" />

```r
class(g1)
```

```
## [1] "igraph"
```

```r
g1
```

```
## IGRAPH 9e57f4e U--- 3 3 -- 
## + edges from 9e57f4e:
## [1] 1--2 2--3 1--3
```

As you see, `igraph` creates a network object of class _igraph_. 


```r
g2 <- igraph::graph( c("Jane", "Ali", "Ali", "Hassan", "Jane", "Hassan")) # named vertices

# When the edge list has vertex names, the number of nodes is not needed
plot(g2)
```

<img src="lab01a-networksInR_files/figure-html/unnamed-chunk-2-1.png" width="624" />

```r
g2
```

```
## IGRAPH 9e6d90c DN-- 3 3 -- 
## + attr: name (v/c)
## + edges from 9e6d90c (vertex names):
## [1] Jane->Ali    Ali ->Hassan Jane->Hassan
```


You access the set of nodes (_vertices_), links (_edges_), and neighbors as follows:


```r
igraph::V(g2)
```

```
## + 3/3 vertices, named, from 9e6d90c:
## [1] Jane   Ali    Hassan
```

```r
igraph::E(g2)
```

```
## + 3/3 edges from 9e6d90c (vertex names):
## [1] Jane->Ali    Ali ->Hassan Jane->Hassan
```

```r
igraph::neighbors(g2, "Jane")
```

```
## + 2/3 vertices, named, from 9e6d90c:
## [1] Ali    Hassan
```

```r
# you can also access Jane through her ID, she is the first vertex.
# NOTE: R starts counting at 1 (while Python starts counting at 0)
igraph::neighbors(g2, 1)
```

```
## + 2/3 vertices, named, from 9e6d90c:
## [1] Ali    Hassan
```

Wanna loop over the nodes?

```r
for (n in igraph::V(g2)) {
  cat("The neighors of vertex", n, ":", igraph::neighbors(g2, n), "\n")
}
```

```
## The neighors of vertex 1 : 2 3 
## The neighors of vertex 2 : 3 
## The neighors of vertex 3 :
```

```r
# or, with vertex names
for (n in igraph::V(g2)$name) {
  cat("The neighors of vertex", n, ":", igraph::neighbors(g2, n)$name, "\n")
}
```

```
## The neighors of vertex Jane : Ali Hassan 
## The neighors of vertex Ali : Hassan 
## The neighors of vertex Hassan :
```

Looping over the links:

```r
for (edge in igraph::E(g2)) {
  print(igraph::E(g2)[edge])
}
```

```
## + 1/3 edge from 9e6d90c (vertex names):
## [1] Jane->Ali
## + 1/3 edge from 9e6d90c (vertex names):
## [1] Ali->Hassan
## + 1/3 edge from 9e6d90c (vertex names):
## [1] Jane->Hassan
```

To get the number of vertices and edges, you do the following


```r
igraph::ecount(g2)
```

```
## [1] 3
```

```r
igraph::vcount(g2)
```

```
## [1] 3
```

To get the partners of a given node, or just the vertices linking to or from,
you can do the following (for actor "Ali)":


```r
igraph::neighbors(g2, 2, mode = "all") # incoming and outgoing
```

```
## + 2/3 vertices, named, from 9e6d90c:
## [1] Jane   Hassan
```

```r
igraph::neighbors(g2, 2, mode = "in") # incoming 
```

```
## + 1/3 vertex, named, from 9e6d90c:
## [1] Jane
```

```r
igraph::neighbors(g2, 2, mode = "out") # outgoing
```

```
## + 1/3 vertex, named, from 9e6d90c:
## [1] Hassan
```

The `igraph` package has many functions available that will generate networks with 
particular structures, in case you really want to start from a specific network 
design. Here are just a few:



```r
plot(igraph::make_full_bipartite_graph(4, 5))
```

<img src="lab01a-networksInR_files/figure-html/unnamed-chunk-8-1.png" width="624" />

```r
plot(igraph::make_ring(4))
```

<img src="lab01a-networksInR_files/figure-html/unnamed-chunk-8-2.png" width="624" />

```r
plot(igraph::make_star(6))
```

<img src="lab01a-networksInR_files/figure-html/unnamed-chunk-8-3.png" width="624" />

```r
plot(igraph::make_star(6, mode = "undirected", center = 2))
```

<img src="lab01a-networksInR_files/figure-html/unnamed-chunk-8-4.png" width="624" />

We will meet more interesting network structures later in this course. Anyway, 
you now have all the R code to do the equivalent to section 1.2 in the book. 

Let's move on from here.

Small graphs can also be generated using symbols in the
`igraph::graph_from_literal` function:

* "--" for undirected tie
* "+-" or "-+" for directed ties pointing to the left or to the right
* "++" for a symmetric tie
* ":" for sets of vertices.



```r
g3 <- igraph::graph_from_literal(Mary++Magdalena++Janet, Jim+-Pete, Mary-+Roberto, 
Mary-+Ivan-+Kelly:Danielle, Jesse, Janis, Fabio, Rumana)
plot(g3, edge.arrow.size = .5, vertex.color = "gold", vertex.size = 15, 
     vertex.frame.color = "gray", vertex.label.color = "black", 
     vertex.label.cex = 0.8, vertex.label.dist = 2, edge.curved = 0.2) 
```

<img src="lab01a-networksInR_files/figure-html/unnamed-chunk-9-1.png" width="624" />

```r
g3
```

```
## IGRAPH 9f16223 DN-- 13 9 -- 
## + attr: name (v/c)
## + edges from 9f16223 (vertex names):
## [1] Mary     ->Magdalena Mary     ->Roberto   Mary     ->Ivan     
## [4] Magdalena->Mary      Magdalena->Janet     Janet    ->Magdalena
## [7] Pete     ->Jim       Ivan     ->Kelly     Ivan     ->Danielle
```
            
This works just fine when you have small networks (or you want to generate some 
simple artificial networks to test your data), but is not feasible for larger 
networks. 



<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server-start">
library(learnr)
library(gradethis)
# library(magrittr)
tutorial_options(exercise.checker = gradethis::grade_learnr)
knitr::opts_chunk$set(echo = TRUE, include = TRUE)
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
