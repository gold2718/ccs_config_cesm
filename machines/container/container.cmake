if (COMP_NAME STREQUAL gptl)
  string(APPEND CPPDEFS " -DHAVE_NANOTIME -DBIT64 -DHAVE_VPRINTF -DHAVE_BACKTRACE -DHAVE_SLASHPROC -DHAVE_COMM_F2C -DHAVE_TIMES -DHAVE_GETTIMEOFDAY")
endif()

set(NetCDF_C_PATH "$ENV{NETCDF_C_ROOT}")
set(NetCDF_Fortran_PATH "$ENV{NETCDF_FORTRAN_ROOT}")

# Add our cmake finder scripts
list (APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

set(LDFLAGS "")
string(APPEND SLIBS " -lnetcdf -lnetcdff")

# BLAS/LAPACK come from the spack-installed netlib-lapack. Loading the
# netlib-lapack (see MODULES_DEFAULT in the container) sets
# NETLIB_LAPACK_ROOT. Tools/Makefile appends "-L$(LAPACK_LIBDIR) -llapack
# -lblas to SLIBS whenever LAPACK_LIBDIR is defined.
if (NOT DEFINED ENV{NETLIB_LAPACK_ROOT})
  message(FATAL_ERROR "NETLIB_LAPACK_ROOT is not set; is the netlib-lapack module loaded?")
endif()
set(LAPACK_LIBDIR "$ENV{NETLIB_LAPACK_ROOT}/lib)")
