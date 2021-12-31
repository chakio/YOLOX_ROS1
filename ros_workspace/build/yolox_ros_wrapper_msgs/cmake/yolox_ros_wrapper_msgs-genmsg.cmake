# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yolox_ros_wrapper_msgs: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iyolox_ros_wrapper_msgs:/catkin_ws/src/yolox_ros_wrapper_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(yolox_ros_wrapper_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg" NAME_WE)
add_custom_target(_yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolox_ros_wrapper_msgs" "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg" ""
)

get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg" NAME_WE)
add_custom_target(_yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolox_ros_wrapper_msgs" "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg" "yolox_ros_wrapper_msgs/YoloxDetectedObject"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolox_ros_wrapper_msgs
)
_generate_msg_cpp(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg"
  "${MSG_I_FLAGS}"
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolox_ros_wrapper_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(yolox_ros_wrapper_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolox_ros_wrapper_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(yolox_ros_wrapper_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages yolox_ros_wrapper_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_cpp _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_cpp _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolox_ros_wrapper_msgs_gencpp)
add_dependencies(yolox_ros_wrapper_msgs_gencpp yolox_ros_wrapper_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolox_ros_wrapper_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolox_ros_wrapper_msgs
)
_generate_msg_eus(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg"
  "${MSG_I_FLAGS}"
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolox_ros_wrapper_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(yolox_ros_wrapper_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolox_ros_wrapper_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(yolox_ros_wrapper_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages yolox_ros_wrapper_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_eus _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_eus _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolox_ros_wrapper_msgs_geneus)
add_dependencies(yolox_ros_wrapper_msgs_geneus yolox_ros_wrapper_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolox_ros_wrapper_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolox_ros_wrapper_msgs
)
_generate_msg_lisp(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg"
  "${MSG_I_FLAGS}"
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolox_ros_wrapper_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(yolox_ros_wrapper_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolox_ros_wrapper_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(yolox_ros_wrapper_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages yolox_ros_wrapper_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_lisp _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_lisp _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolox_ros_wrapper_msgs_genlisp)
add_dependencies(yolox_ros_wrapper_msgs_genlisp yolox_ros_wrapper_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolox_ros_wrapper_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolox_ros_wrapper_msgs
)
_generate_msg_nodejs(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg"
  "${MSG_I_FLAGS}"
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolox_ros_wrapper_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(yolox_ros_wrapper_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolox_ros_wrapper_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(yolox_ros_wrapper_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages yolox_ros_wrapper_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_nodejs _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_nodejs _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolox_ros_wrapper_msgs_gennodejs)
add_dependencies(yolox_ros_wrapper_msgs_gennodejs yolox_ros_wrapper_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolox_ros_wrapper_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolox_ros_wrapper_msgs
)
_generate_msg_py(yolox_ros_wrapper_msgs
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg"
  "${MSG_I_FLAGS}"
  "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolox_ros_wrapper_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(yolox_ros_wrapper_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolox_ros_wrapper_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(yolox_ros_wrapper_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages yolox_ros_wrapper_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxDetectedObject.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_py _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/catkin_ws/src/yolox_ros_wrapper_msgs/msg/YoloxOutput.msg" NAME_WE)
add_dependencies(yolox_ros_wrapper_msgs_generate_messages_py _yolox_ros_wrapper_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolox_ros_wrapper_msgs_genpy)
add_dependencies(yolox_ros_wrapper_msgs_genpy yolox_ros_wrapper_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolox_ros_wrapper_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolox_ros_wrapper_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolox_ros_wrapper_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(yolox_ros_wrapper_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolox_ros_wrapper_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolox_ros_wrapper_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(yolox_ros_wrapper_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolox_ros_wrapper_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolox_ros_wrapper_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(yolox_ros_wrapper_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolox_ros_wrapper_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolox_ros_wrapper_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(yolox_ros_wrapper_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolox_ros_wrapper_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolox_ros_wrapper_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolox_ros_wrapper_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(yolox_ros_wrapper_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
