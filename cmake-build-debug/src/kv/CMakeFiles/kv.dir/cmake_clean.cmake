file(REMOVE_RECURSE
  "../../lib/libkv.pdb"
  "../../lib/libkv.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/kv.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
