# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appShbook_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appShbook_autogen.dir\\ParseCache.txt"
  "appShbook_autogen"
  )
endif()
