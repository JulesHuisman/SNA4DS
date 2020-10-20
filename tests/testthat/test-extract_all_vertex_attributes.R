

data(florentine, package = "SNA4DS")
flobusiness <- florentine$flobusiness
flomarriage <- florentine$flomarriage



test_that("multiplication works for igraph", {
  flobus_igraph <- extract_all_vertex_attributes(flobusiness)
  flomar_igraph <- extract_all_vertex_attributes(flomarriage)
  expect_equal(nrow(flobus_igraph), 16)
  expect_equal(ncol(flobus_igraph), 4)
  expect_true("name" %in% colnames(flobus_igraph))
  expect_true("Wealth" %in% colnames(flobus_igraph))
  expect_true("NumberPriorates" %in% colnames(flobus_igraph))
  expect_true("NumberTies" %in% colnames(flobus_igraph))
  expect_equal(nrow(flomar_igraph), 16)
  expect_equal(ncol(flomar_igraph), 4)
  expect_true("name" %in% colnames(flomar_igraph))
  expect_true("Wealth" %in% colnames(flomar_igraph))
  expect_true("NumberPriorates" %in% colnames(flomar_igraph))
  expect_true("NumberTies" %in% colnames(flomar_igraph))

  nw_wo_attrs <- igraph::erdos.renyi.game(1, p.or.m = 10, type = "gnm")
  expect_null(extract_all_vertex_attributes(nw_wo_attrs))
})


test_that("multiplication works for network", {
  flobus_nw <- intergraph::asNetwork(flobusiness)
  flomar_nw <- intergraph::asNetwork(flomarriage)
  flobus_net <- extract_all_vertex_attributes(flobus_nw)
  flomar_net <- extract_all_vertex_attributes(flomar_nw)

  expect_equal(nrow(flobus_net), 16)
  expect_equal(ncol(flobus_net), 5) # there is an additional attribute 'na'
  expect_true("vertex.names" %in% colnames(flobus_net)) # different from igraph
  expect_true("Wealth" %in% colnames(flobus_net))
  expect_true("NumberPriorates" %in% colnames(flobus_net))
  expect_true("NumberTies" %in% colnames(flobus_net))
  expect_equal(nrow(flomar_net), 16)
  expect_equal(ncol(flomar_net), 5)
  expect_true("vertex.names" %in% colnames(flomar_net))
  expect_true("Wealth" %in% colnames(flomar_net))
  expect_true("NumberPriorates" %in% colnames(flomar_net))
  expect_true("NumberTies" %in% colnames(flomar_net))

  nw_wo_attrs <- sna::rgnm(1, 10, 5)
  nw_wo_attrs <- network::as.network(nw_wo_attrs)
  nw_wo_attrs <- network::delete.vertex.attribute(nw_wo_attrs, "na")
  nw_wo_attrs <- network::delete.vertex.attribute(nw_wo_attrs, "vertex.names")
  expect_null(extract_all_vertex_attributes(nw_wo_attrs))
})




test_that("multiplication works gives appropriate error", {
  fake <- flobusiness
  class(fake) <- "not_igraph"
  expect_error(extract_all_vertex_attributes(fake))

  fake2 <- sna::rgnm(1, 10, 5) # adj matrix
  expect_error(extract_all_vertex_attributes(fake2))

  fake3 <- matrix(sample(c(0, 1), 25, replace = TRUE), ncol = 5)
  expect_error(extract_all_vertex_attributes(fake3))

})








