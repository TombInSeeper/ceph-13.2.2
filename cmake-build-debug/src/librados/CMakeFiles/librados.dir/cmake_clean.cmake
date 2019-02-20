file(REMOVE_RECURSE
  "../../lib/librados.pdb"
  "../../lib/librados.so.2.0.0"
  "../../lib/librados.so"
  "../../lib/librados.so.2"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/librados.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
