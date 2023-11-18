
cmake_minimum_required(VERSION 3.15)

project(PythonBindingExample)

find_package(Python COMPONENTS Interpreter Development)

message(
    Python version: ${Python_EXECUTABLE}
)

add_library(demo SHARED demo.c)


# #################################################################################### #
#                                       TESTS                                          #
# #################################################################################### #
# enable_testing()
# add_test(  
#     NAME Foo 
#     COMMAND ${Python_EXECUTABLE} test.py ) 