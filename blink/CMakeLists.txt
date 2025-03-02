cmake_minimum_required(VERSION 2.8...3.30)
project(blink)

# All Verilog & VHDL files which go to synthesis

set(VERILOG_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

set(${PROJECT_NAME}_SRC_FILES
    ${VERILOG_SRC_DIR}/${PROJECT_NAME}_module.v
    ${VERILOG_SRC_DIR}/${PROJECT_NAME}_tb.v
)

message(STATUS "VERILOG_SRC_DIR='${VERILOG_SRC_DIR}'")

add_custom_target(${PROJECT_NAME}
    ALL iverilog -o ${PROJECT_NAME}.vvp ${${PROJECT_NAME}_SRC_FILES}
    SOURCES ${${PROJECT_NAME}_SRC_FILES}
)

set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "${PROJECT_NAME}.vvp")

add_custom_target(test
    DEPENDS ${PROJECT_NAME}
    COMMAND ./${PROJECT_NAME}.vvp
)

set_target_properties(test PROPERTIES OUTPUT_NAME "test.vcd")

add_custom_target(view
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/test.gtkw test
    COMMAND gtkwave ${CMAKE_CURRENT_SOURCE_DIR}/test.gtkw &
)

