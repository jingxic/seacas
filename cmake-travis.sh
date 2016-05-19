#!/usr/bin/env sh

if [ "$1" != "" ]; then
   BUILDDIR=$1
else
   BUILDDIR=build
fi

mkdir $BUILDDIR && cd $BUILDDIR

cmake \
  -DBUILD_SHARED_LIBS:BOOL=ON \
  -DCMAKE_CXX_FLAGS="-Wall -pedantic" \
  -DCMAKE_C_FLAGS="-Wall -pedantic" \
  -DHDF5_ROOT:PATH=/usr/ \
  -DSEACASProj_ENABLE_ALL_PACKAGES:BOOL=ON \
  -DSEACASProj_ENABLE_SECONDARY_TESTED_CODE:BOOL=ON \
  -DSEACASProj_ENABLE_TESTS:BOOL=ON \
  -DSEACASProj_USE_GNUINSTALLDIRS:BOOL=ON \
  -DTPL_ENABLE_CGNS:BOOL=ON \
  -DTPL_ENABLE_Matio:BOOL=ON \
  -DTPL_ENABLE_METIS:BOOL=OFF \
  -DTPL_ENABLE_ParMETIS:BOOL=OFF \
  -DTPL_ENABLE_Netcdf:BOOL=ON \
  -DTPL_ENABLE_MPI:BOOL=OFF \
  -DTPL_ENABLE_Pamgen:BOOL=OFF \
  -DTPL_ENABLE_X11:BOOL=ON \
  -DTPL_ENABLE_Zlib:BOOL=ON \
  ../

make -j2

cd ..
