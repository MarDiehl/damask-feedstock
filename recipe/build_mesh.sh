if [[ $CONDA_BUILD_CROSS_COMPILATION = '1' ]]; then sed -i.bak -e 's/ -mtune=native//g' cmake/Compiler-GNU.cmake; fi
export OPAL_PREFIX=${PREFIX}
if [ -z ${OSX_ARCH} ]; then
  echo 'no on OSX'
  PETSC_DIR=${PREFIX} cmake -B build-mesh -DMESH=ON -DCMAKE_INSTALL_PREFIX=${PREFIX} ${CMAKE_ARGS}
else
  PETSC_DIR=${PREFIX} cmake -B build-mesh -DMESH=ON -DCMAKE_INSTALL_PREFIX=${PREFIX} ${CMAKE_ARGS} -DBUILDCMD_POST="--include-directory-after=$(${FC} -print-file-name=include)"
fi
cmake --build build-mesh --target install
