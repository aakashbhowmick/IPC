
# Set current directory name as the name of the target
get_filename_component(CURR_DIR_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
set (TARGET_NAME ${CURR_DIR_NAME})
message(STATUS "In directory ${CURR_DIR_NAME}:")

# Glob all CPP files in directory
file(GLOB SOURCE_LIST "*.c")
message(STATUS "Found sources : ${SOURCE_LIST}")

# Create target executable
add_executable(${TARGET_NAME} ${SOURCE_LIST})
message(STATUS "Added executable : ${TARGET_NAME}")

# Include directories
target_include_directories(${TARGET_NAME} PRIVATE
                           "/usr/include")


# Link Libraries
#target_link_libraries(${TARGET_NAME} PRIVATE
#                      ${LIBS_LIST}
#                      ${LINKER_FLAGS})

# Compiler options
add_compile_options("-g")   # Enable debug info

# Add post-build step of copying binary to build directory
set(TARGET_BIN_PATH $<TARGET_FILE:${TARGET_NAME}>)
set(COPY_DIR ${CMAKE_BINARY_DIR})
add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy ${TARGET_BIN_PATH} ${COPY_DIR})


