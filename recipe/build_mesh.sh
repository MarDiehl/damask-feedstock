if [ $CONDA_BUILD_CROSS_COMPILATION = '1' ]; then sed -i '' -e 's/ -mtune=native//g' cmake/Compiler-GNU.cmake; fi
PETSC_DIR=${PREFIX} cmake -B build-mesh -DDAMASK_SOLVER=mesh -DCMAKE_INSTALL_PREFIX=${PREFIX}
cmake --build build-mesh --target install
