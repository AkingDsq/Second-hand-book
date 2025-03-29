# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appSecond-hand-book-trading-platform_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appSecond-hand-book-trading-platform_autogen.dir\\ParseCache.txt"
  "appSecond-hand-book-trading-platform_autogen"
  )
endif()
