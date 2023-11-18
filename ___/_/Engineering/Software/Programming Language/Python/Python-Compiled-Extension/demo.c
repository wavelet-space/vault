// -*- coding: utf-8 -*-

/**
 * The custom  native  ``demo`` module.
 */

#include <Python.h>

/**
 * The ``division`` method definition.
 */
static PyObject *division(PyObject *self, PyObject *args)
{
    long dividend, divisor;
    if (!PyArg_ParseTuple(args, "ll", &dividend, &divisor))
    {
        return NULL;
    }
    if (0 == divisor)
    {
        PyErr_Format(PyExc_ZeroDivisionError, "Dividing %d by zero!", dividend);
        return NULL;
    }
    return PyLong_FromLong(dividend / divisor);
}

/**
 * The exported methods are collected in a table.
 */
PyMethodDef method_table[] = {
    {"division",
     (PyCFunction)division,
     METH_VARARGS,
     "The method documentation"},
    {NULL, NULL, 0, NULL} //< The sentinel value ending the table.
};

/** 
 * A struct contains the definition of a module.
 */
PyModuleDef demo_module = {
    PyModuleDef_HEAD_INIT,
    "demo",                                        //< The module name.
    "This module contains some custom functions.", //< The module documentation.
    -1,                                            //< The optional size of the module state memory.
    method_table,                                  //> The methods table.
    NULL,                                          //< The optional slot definitions.
    NULL,                                          //< The optional traversal function.
    NULL,                                          //< The optional clear function.
    NULL                                           //< The optional module deallocation function.
};

// The module init function
PyMODINIT_FUNC PyInit_demo(void)
{
    return PyModule_Create(&demo_module);
}