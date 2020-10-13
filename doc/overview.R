## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(terrainr)

## -----------------------------------------------------------------------------
mt_elbert_points <- data.frame(
  lat = runif(100, min = 39.11144, max = 39.12416),
  lng = runif(100, min = -106.4534, max = -106.437)
)

## -----------------------------------------------------------------------------
mt_elbert <- c(39.1178, -106.4452)

## -----------------------------------------------------------------------------
mt_elbert_bbox <- get_coord_bbox(data = mt_elbert_points, 
                                 lat = "lat", 
                                 lng = "lng")
mt_elbert_bbox

## -----------------------------------------------------------------------------
peak_bbox <- get_coord_bbox(lat = mt_elbert[[1]], 
                            lng = mt_elbert[[2]])
peak_bbox

## -----------------------------------------------------------------------------
add_bbox_buffer(bbox = peak_bbox, 
                distance = 1000,
                distance_unit = "meters")

## -----------------------------------------------------------------------------
all.equal(add_bbox_buffer(bbox = peak_bbox, 
                distance = 1000,
                distance_unit = "meters"),
          mt_elbert_bbox,
          tolerance = 0.00001)

## ----eval = FALSE-------------------------------------------------------------
#  library(progressr)
#  handlers("progress")
#  with_progress(
#    output_files <- get_tiles(bbox = mt_elbert_bbox,
#                              output_prefix = tempfile(),
#                              services = c("elevation", "ortho"))
#    )

## ----eval = FALSE-------------------------------------------------------------
#  output_files

## ----echo = FALSE-------------------------------------------------------------
output_files <- list(
  `3DEPElevation` = "/tmp/RtmphTFQvZ/file65e5d859e628_3DEPElevation_1_1.tif",
  USGSNAIPPlus = "/tmp/RtmphTFQvZ/file65e5d859e628_USGSNAIPPlus_1_1.tif"
)
output_files

## ----eval=FALSE---------------------------------------------------------------
#  raster::plot(raster::raster(output_files[[1]]))

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("example_dem.png")

## ----eval=FALSE---------------------------------------------------------------
#  raster::plotRGB(raster::brick(output_files[[2]]), scale = 1)

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("example_ortho.png")

## ----eval = FALSE-------------------------------------------------------------
#  elevation_merged <- merge_rasters(input_rasters = output_files[1],
#                                    output_raster = tempfile(fileext = ".tif"))
#  ortho_merged <- merge_rasters(input_rasters = output_files[2],
#                                output_raster = tempfile(fileext = ".tif"))

## ----eval = FALSE-------------------------------------------------------------
#  side_length <- vapply(c(elevation_merged, ortho_merged),
#                        function(x) max(dim(raster::raster(x))),
#                        numeric(1))
#  
#  mapply(function(x, y, z) {
#    with_progress(
#      raster_to_raw_tiles(input_file = x,
#                          output_prefix = "mt_ebert",
#                          side_length = y,
#                          raw = z)
#      )
#  },
#    c(elevation_merged, ortho_merged),
#    side_length, # What's the longer edge of our image file?
#    c(TRUE, FALSE) # we don't want to convert our orthoimages to .raw;
#  )                # Unity takes the textures as .pngs

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("ebert_unity.jpg")

