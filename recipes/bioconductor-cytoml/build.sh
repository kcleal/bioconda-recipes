#!/bin/bash
mv DESCRIPTION DESCRIPTION.old
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
mkdir -p ~/.R
echo -e "CC=$CC
FC=$FC
CXX=$CXX
CXX98=$CXX
CXX11=$CXX
CXX14=$CXX
PKG_CPPFLAGS =-DROUT -I../inst/include -DBOOST_NO_AUTO_PTR -Wno-pedantic  -w -Wfatal-errors \
              -D_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION 
" > ~/.R/Makevars
export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION"
$R CMD INSTALL --build .