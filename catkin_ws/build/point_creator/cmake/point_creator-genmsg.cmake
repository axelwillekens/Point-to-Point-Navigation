# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "point_creator: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(point_creator_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv" NAME_WE)
add_custom_target(_point_creator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "point_creator" "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(point_creator
  "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/point_creator
)

### Generating Module File
_generate_module_cpp(point_creator
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/point_creator
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(point_creator_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(point_creator_generate_messages point_creator_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv" NAME_WE)
add_dependencies(point_creator_generate_messages_cpp _point_creator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_creator_gencpp)
add_dependencies(point_creator_gencpp point_creator_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_creator_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(point_creator
  "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/point_creator
)

### Generating Module File
_generate_module_eus(point_creator
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/point_creator
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(point_creator_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(point_creator_generate_messages point_creator_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv" NAME_WE)
add_dependencies(point_creator_generate_messages_eus _point_creator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_creator_geneus)
add_dependencies(point_creator_geneus point_creator_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_creator_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(point_creator
  "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/point_creator
)

### Generating Module File
_generate_module_lisp(point_creator
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/point_creator
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(point_creator_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(point_creator_generate_messages point_creator_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv" NAME_WE)
add_dependencies(point_creator_generate_messages_lisp _point_creator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_creator_genlisp)
add_dependencies(point_creator_genlisp point_creator_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_creator_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(point_creator
  "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/point_creator
)

### Generating Module File
_generate_module_nodejs(point_creator
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/point_creator
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(point_creator_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(point_creator_generate_messages point_creator_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv" NAME_WE)
add_dependencies(point_creator_generate_messages_nodejs _point_creator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_creator_gennodejs)
add_dependencies(point_creator_gennodejs point_creator_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_creator_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(point_creator
  "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_creator
)

### Generating Module File
_generate_module_py(point_creator
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_creator
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(point_creator_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(point_creator_generate_messages point_creator_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/point_creator/srv/GetPoint.srv" NAME_WE)
add_dependencies(point_creator_generate_messages_py _point_creator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_creator_genpy)
add_dependencies(point_creator_genpy point_creator_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_creator_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/point_creator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/point_creator
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(point_creator_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/point_creator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/point_creator
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(point_creator_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/point_creator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/point_creator
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(point_creator_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/point_creator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/point_creator
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(point_creator_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_creator)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_creator\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_creator
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(point_creator_generate_messages_py std_msgs_generate_messages_py)
endif()
