from setuptools import setup, Extension



def find_python_headers():
    # return r'C:\Users\dlanda\AppData\Local\Programs\Python\Python310\include'
    return r'C:\Users\dlanda\AppData\Local\Programs\Python\Python3.9\include'


def find_package_headers():
    return 

setup(name = "demo",
      version = "0.1.0",
      ext_modules = [
          Extension(
              "demo", 
              ["demo.c"], 
              include_dirs=[
                  find_python_headers(),
                  find_package_headers(),
              ]
            )
        ]
      )