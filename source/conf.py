# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "David Landa"
copyright = "2023, David Landa"
author = "David Landa"

html_title = project

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "myst_parser",
    "sphinx.ext.intersphinx",
    'sphinxcontrib.bibtex',
    'sphinxcontrib.mermaid',
]

myst_enable_extensions = [
    "amsmath",
    # "attrs_inline",
    "colon_fence",
    "deflist",
    "dollarmath",
    "fieldlist",
    "html_admonition",
    "html_image",
    # "linkify",
    "replacements",
    "smartquotes",
    "strikethrough",
    "substitution",
    "tasklist",
]

bibtex_bibfiles = ['references.bib']

# templates_path = ['_templates']
exclude_patterns = ['build', '_build', '.github', '.vscode', "_*.md", "__*"]

master_doc = "index"

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output
html_theme = 'alabaster'
html_static_path = ["_static"]
html_js_files = ['custom.js']
html_css_files = ['custom.css']
html_extra_path = ['etudes/']
html_theme_options = {
    
}
# html_logo = "logo.png"
html_title = "David Landa"
