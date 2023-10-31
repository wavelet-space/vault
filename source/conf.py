# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "Vault"
copyright = "2023, David Landa"
author = "David Landa"

html_title = project

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "myst_parser",
    "sphinx.ext.intersphinx",
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

# templates_path = ['_templates']
exclude_patterns = ['build', '_build', '.github', '.vscode']

master_doc = "index"

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "furo"
html_static_path = ["_static"]
html_css_files = [ # does not work on GitHub?
    'custom.css',
]

html_theme_options = {
    "light_css_variables": {
        "font-stack": "Times New Roman, Times, serif",
        "font-stack--monospace": "Courier, monospace",
    },
}


# html_js_files = [
#     'custom.js',
# ]
