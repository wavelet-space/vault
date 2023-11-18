# Dokumentace pomocí nástroje Sphinx

Na této stránce přidávám pokusy a ukázky psaní dokumentace spolus tím jak se učím Sphinx.

## Osnova

- Co je Sphinx
- Jak ho použít pro dokumentaci

## Úvod 

Pro psaní dokument můžeme použít minimálně dva formáty, původné `rst` a novější `md`.
Každý má své, ale protože většina zná Markdown, budeme používat soubory s koncovkou `.md`
a extenzi `myst-parser`.


* Pro knižní odkazy používám :code:`sphinxcontrib-bibtex`.
* Pro automatický reload používám :code:`sphinx-autobuild`.
* Theme používáme:
  * https://github.com/executablebooks/sphinx-book-theme
  * https://sphinx-rtd-theme.readthedocs.io/en/stable/


* https://tedyin.com/categories/python/

## Odkazy

See :cite:t:`Nelson:1987` for an introduction to non-standard analysis.
Non-standard analysis is fun :cite:p:`Nelson:1987`.

See :cite:t:`Goldberg:1991` for an introduction to non-standard analysis.
Non-standard analysis is fun :cite:p:`Goldberg:1991`.

.. bibliography::

## Matematika

.. math::

    n_{\mathrm{offset}} = \sum_{k=0}^{N-1} s_k n_k

## Nadpisy

.. code-block:: rst

   Chapter 1 Title
   ===============

   Section 1.1 Title
   -----------------

   Subsection 1.1.1 Title
   ~~~~~~~~~~~~~~~~~~~~~~

   Section 1.2 Title
   -----------------

   Chapter 2 Title
   ===============

Boxes
=====

Poznámka
~~~~~~~~

.. note::  Toto je **poznámka**.


Upozornění
~~~~~~~~~~

.. warning:: Toto je **upozrnění**.


Ukázky zdrojového kódu
======================

Pro vkládání ukázek zdrojového kódu, spolu se zvýrazněním syntaxe, lze použít direktivy :code:`code-block`


..  code-block:: rst
    :caption: Documentation/MyDocs.rst

    ..  code-block:: <language>
        :caption: <caption>
        <options>

        <code>


.. code-block: python
   :caption: Faktoriál

   def factorial(n) -> int:
      return


Pokud potřebujem přímo vložit nějaký snippet jakou soubor můžeme použít direktivu `literalinclude`

.. literalinclude:: /sphinx.py
   :language: python
   :emphasize-lines: 3,6-8
   :linenos: