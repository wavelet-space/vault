sphinx-autobuild . build/html --port <port>
https://docs.readthedocs.io/en/stable/guides/adding-custom-css.html

Use HTML templates: https://www.arthurkoziel.com/convert-md-to-html-pandoc/


Vložení do hlavičky při konverzi Markdown do HTML pomocí Pandoc.

Na začátek Markdown dokumentu dáme:

```
---
header-includes: <meta name="viewport" content="width=device-width,initial-scale=1"><script></script><!-- Global site tag (gtag.js) - Google Analytics --><script async src="https://www.googletagmanager.com/gtag/js?id=UA-141722838-1"></script><script>window.dataLayer = window.dataLayer || [];function gtag(){dataLayer.push(arguments);}gtag('js', new Date());gtag('config', 'UA-141722838-1');</script>
---
```