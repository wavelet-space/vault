# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "Wavelet Vault"
copyright = "2023, David"
author = "David"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["myst_parser"]

# templates_path = ['_templates']
# exclude_patterns = []

master_doc = 'index' # readme?

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'wavelet-sphinx-theme'
html_static_path = ['_static']

# html_css_files = [
#     'style.css',
# ]

# html_js_files = [
#     'custom.js',
# ]