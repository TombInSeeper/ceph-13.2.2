file(REMOVE_RECURSE
  "../lib/libceph-common.pdb"
  "../lib/libceph-common.so.0"
  "../lib/libceph-common.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang ASM C CXX)
  include(CMakeFiles/ceph-common.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
