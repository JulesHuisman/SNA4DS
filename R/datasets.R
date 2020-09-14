
#' elegans network data
#'
#' elegans network
#'
#' elegans network, in \code{igraph}-format. This network is used in the course
#' text book.
#'
#' @keywords datasets
#' @format A data frame with 297 vertices and 2344 edges. Directed, Weighted.
#' @source \url{http://networkrepository.com/celegansneural.php}
#' @references
#' \insertRef{Elegans}{SNA4DS}
"elegans"



#' enron network data
#'
#' enron network
#'
#' enron network, in \code{igraph}-format. This network is used in the course
#' text book.
#'
#' The network consists of 321917 emails sent between employees of Enron between
#' 1999 and 2003. Nodes in the network are individual employees and edges are
#' individual emails.  Edges are directed and weighted. The direction is from
#' the sender to the receiver and the weight represents the number of messages.
#' It is possible to send an email to oneself, and thus this network contains
#' loops.
#'
#' The edges have a weight attribute.
#'
#' Note that there are many versions of the enron dataset available on the
#' internet, this specific dataset is the dataset as used in the text book.
#'
#' @source \url{http://konect.cc/networks/enron/} and \url{http://www.cs.cmu.edu/~enron/}
#' @references
#' \insertRef{KONECT}{SNA4DS}
#'
#' \insertRef{ENRONCORPUS}{SNA4DS}
#'
#' @keywords datasets
"enron"


#' ia_enron network data
#'
#' ia_enron network
#'
#' ia_enron network, in \code{igraph}-format. This network is used in the course
#' text book.
#'
#' A subset of the enron network, used in the book.
#'
#' @format 143 vertices and 622 edges. Directed, Weighted.
#' @keywords datasets
"ia_enron"



#' enwiki network data
#'
#' enwiki network
#'
#' enwiki network, in \code{igraph}-format. This network is used in the course
#' text book.
#'
#' @keywords datasets
#' @format A data frame with 15220 vertices with 194103 edges. Directed, Unweighted.
"enwiki"




#' everglades network data
#'
#' everglades network
#'
#' everglades network, in \code{igraph}-format. This network is used in the course
#' text book.
#'
#' eco-florida also exists and is slightly larger
#'
#' @source \url{http://networkrepository.com/eco-everglades.php}
#' @references
#' \insertRef{ulanowicz1998network}{SNA4DS}
#'
#' \insertRef{melian2004food}{SNA4DS}
#'
#' @keywords datasets
#' @format A data frame with 15220 vertices with 194103 edges. Directed, Unweighted.
"everglades"



#' imdb costars
#'
#' imdb costars network
#'
#' imdb costars network, in \code{igraph}-format. This network is used in the course
#' text book.
#' An edge is this network is defined as the actors being part of the same movie.
#' The edge weight attribute reflects the number of collaborations.
#'
#' I added the actual names of the actors by scraping the imdb website accordingly.
#'
#' @source \url{https://www.imdb.com/}
#'
#' @keywords datasets
#' @format A data frame with 252999 vertices and 1015187 edges. Undirected, Unweighted.
"imdb_costars"


#' Northwestern University Facebook network
#'
#' Northwestern University Facebook network
#'
#' Northwestern University Facebook network, in \code{igraph}-format. This network
#' is used in the course text book.
#'
#'  A social friendship network extracted from Facebook consisting of people
#'  (nodes) with edges representing friendship ties.
#'
#' @source \url{http://networkrepository.com/socfb-Northwestern25.php}
#' @references
#' \insertRef{Traud:2011fs}{SNA4DS}
#'
#' \insertRef{traud2012social}{SNA4DS}
#'
#' @keywords datasets
#' @format A data frame with 10567 vertices and 488336 edges. Undirected, unweighted.
"northwestern"




#' routers network
#'
#' routers network
#'
#' routers network, in \code{igraph}-format. This network
#' is used in the course text book. The network is known as RL-CAIDA.
#'
#' @source \url{http://networkrepository.com/tech-RL-caida.php}
#' @references
#' \insertRef{rossi2013topology}{SNA4DS}
#'
#' \insertRef{spring2002measuring}{SNA4DS}
#'
#' @keywords datasets
#' @format A data frame with 190914 vertices and 607610 edges. Undirected, unweighted.
"routers"



#' twitter network
#'
#' twitter network
#'
#' twitter network, in \code{igraph}-format. This network is used in the course
#' text book. The network is known as "icwsm_polarization"
#'
#' The official documentation:
#'
#' Overview
#'
#' This dataset describes three networks of political communication between
#' users of the Twitter social media platform in the six weeks prior to the 2010
#' Congressional midterm elections. This network is particularly interesting
#' because one mode of communication, retweets, segregates users into two
#' politically homogeneous communities of likeminded individuals, while mentions
#' form a bridge between the two communities over which users are exposed to
#' people and information they would not likely select ahead of time.
#'
#' Data Source
#'
#' The present analysis leverages data collected from the Twitter ‘gardenhose’
#' API (dev.twitter.com/pages/ streaming_api) between September 14th and
#' November 1st, 2010 — the run-up to the November 4th U.S. congressional
#' midterm elections. During the six weeks of data collection we observed
#' approximately 355 million tweets.
#'
#' Identifying Political Content
#'
#' Let us define a political communication as any tweet containing at least one
#' politically relevant hashtag. To identify an appropriate set of political
#' hashtags and to avoid intro- ducing bias into the sample, we performed a
#' simple tag co-occurrence discovery procedure. We began by seeding our sample
#' with the two most popular political hashtags, #p2 (“Progressives 2.0”) and
#' #tcot (“Top Conservatives on Twitter”). For each seed we identified the set
#' of hashtags with which it co-occurred in at least one tweet, and ranked the
#' results using the Jaccard coefficient. Thus, when the tweets in which both
#' seed and hashtag occur make up a large portion of the tweets in which either
#' occurs, the two are deemed to be related.
#'
#' Political Communication Networks
#'
#' From the tweets containing any of the politically relevant hashtags we
#' constructed networks representing political communication among Twitter
#' users. Focusing on the two primary modes of public user-user interaction,
#' mentions and retweets, we define communication links in the following ways.
#' In the retweet network an edge runs from a node representing user A to a node
#' representing user B if B retweets content originally broadcast by A,
#' indicating that information has propagated from A to B. In the mention
#' network an edge runs from A to B if A mentions B in a tweet, indicating that
#' information may have propagated from A to B (a tweet mentioning B is visible
#' in B’s timeline). Both networks therefore represent potential pathways for
#' information to flow between users.
#'
#' The retweet network consists of 23,766 non-isolated nodes among a total of
#' 45,365. The largest connected component accounts for 18,470 nodes, with 102
#' nodes in the next-largest component. The mention network is smaller,
#' consisting of 10,142 non-isolated nodes out of 17,752 total. It has 7,175
#' nodes in its largest connected component, and 119 in the next-largest.
#' Because of their dominance we focus on the largest connected components for
#' the rest of our analysis.
#'
#' NOTE: the dataset used in the book consists of a subset of the data.
#'
#'
#' @references \url{https://www.aaai.org/ocs/index.php/ICWSM/ICWSM11/paper/viewFile/2847/3275}
#' @source \url{http://carl.cs.indiana.edu/data/icwsm/icwsm_polarization.zip}
#'
#' @keywords datasets
#' @format A data frame with 22405 vertices and 77920 edges. Directed, unweighted.
"twitter"




#' us air network
#'
#' us air network
#'
#' us air network, in \code{igraph}-format. This network
#' is used in the course text book.
#'
#' According to the book's website, the data was generated from the Feb 2, 2017
#' data release \url{https://github.com/jpatokal/openflights/tree/5d623a6969a1adee7961cf1c9a8a212c4a784713}.
#'
#' This is a subset of the world air network dataset.
#'
#' @keywords datasets
#' @format A data frame with 546 vertices and 2781 edges. Undirected, unweighted.
"us_air"




#' world air network
#'
#' world air network
#'
#' world air network, in \code{igraph}-format. This network
#' is used in the course text book.
#'
#' According to the book's website, the data was generated from the Feb 2, 2017
#' data release \url{https://github.com/jpatokal/openflights/tree/5d623a6969a1adee7961cf1c9a8a212c4a784713}.
#'
#' @keywords datasets
#' @format A data frame with 3179 vertices and 18617 edges. Undirected, unweighted.
"world_air"



#' yeast network data
#'
#' Yeast network
#'
#' Yeast network, in \code{igraph}-format. This network is used in the course
#' text book.
#'
#' @keywords datasets
#' @format A data frame with 1870 vertices and 4480 edges. Undirected, unweighted.
#' @source \url{http://networkrepository.com/bio-yeast-protein-inter.php}
#' @references
#' \insertRef{jeong2001lethality}{SNA4DS}
"yeast"
