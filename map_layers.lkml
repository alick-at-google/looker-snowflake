map_layer: canadian_provinces {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.oh_canada/{z}/{x}/{y}.mvt?access_token="
  feature_key: "provinces"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/f5734c99c6ed23ce02e5c368e3774c2a59e82242/canada-provinces-id.json"
  min_zoom_level: 2
  max_zoom_level: 10
  property_key: "PRUID"
}

map_layer: us_cbsa {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.us_cbsa/{z}/{x}/{y}.mvt?access_token="
  feature_key: "us_cbsas"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/ecb8d20baa3fc2c4c77023011f2dfd26ee7a8f02/us_cbsa_geoid"
  min_zoom_level: 4
  max_zoom_level: 13
  property_key: "GEOID"
}


map_layer: us_canada_postal_codes{
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.8gkhpr0e/{z}/{x}/{y}.mvt?access_token="
  feature_key: "us_canada_postal_codesgeojson"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/9a83b018f3e9db958ccfdf34cc601baec7995448/us_canada_postal_codes.json"
  min_zoom_level: 3
  max_zoom_level: 12
  property_key: "POSTAL_CODE"
}
