# terrainr 0.1.0
* First version (to be) submitted to ROpenSci
* New features:
    * set_bbox_side_length wraps add_bbox_buffer to set each side of the 
      bounding box to an equal length (within ~1% accuracy)

# terrainr 0.0.0.9001

* First development version
* Supports retrieval from 3DEP and NAIP data sources
* Supports export to Unity-friendly format
* Functions in this version:
    * Utility functions: 
        * add_bbox_buffer
        * calc_haversine_distance
        * convert_distance
        * deg_to_rad
        * get_bbox_centroid
        * get_coord_bbox
        * point_from_distance
        * rad_to_deg
    * Data retrieval functions:
      * get_tiles 
      * hit_national_map_api
    * Data processing functions:
      * merge_rasters
      * raster_to_raw_tiles
    * Classes and class utility functions:
      * terrainr_bounding_box (class)
      * terrainr_coordinate_pair (class)
      * terrainr_bounding_box (creation utility)
      * terrainr_coordinate_pair (creation utility)
      * export_bounding_box
      * export_coord_pair