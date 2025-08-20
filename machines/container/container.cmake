if (COMP_NAME STREQUAL gptl)
  string(APPEND CPPDEFS " -DHAVE_NANOTIME -DBIT64 -DHAVE_VPRINTF -DHAVE_BACKTRACE -DHAVE_SLASHPROC -DHAVE_COMM_F2C -DHAVE_TIMES -DHAVE_GETTIMEOFDAY")
endif()

#set(NETCDF_PATH "/opt/netcdf")
#set(NETCDF_C_PATH "/opt/netcdf")
#set(NETCDF_FORTRAN_PATH "/opt/netcdf")

# Add our cmake finder scripts
list (APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

list(APPEND NetCDF_Fortran_INCLUDE_DIRS /opt/netcdf/include)
list(APPEND NetCDF_C_LIBRARIES /opt/netcdf/include)

set(LDFLAGS "")
string(APPEND SLIBS " -lnetcdf -lnetcdff -llapack -lblas")
