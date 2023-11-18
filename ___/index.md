# Poznámky

```{toctree}
:maxdepth: 2

articles/index.md
journal/index.md
business/index.md
datasets/index.md
engineering/index.md

hobby/lego.md

unknown/CV.md
unknown/workbook.md
unknown/jobs.md
unknown/project.md
unknown/readings.md
unknown/notebook.md
unknown/demo.rst

references.md
```

```{toctree}
:caption: INCLUDED

INCLUDE
KNOWLEDGE-BACKLOG
```

## Instalace a spuštění

```powershell
py -3.11 -m venv --upgrade-deps .venv
```

```powershell
.\.venv\Scripts\activate
```

```powershell
pip install -e .
```

```powershell
sphinx-quickstart
```

```powershell
sphinx-build . _build/html  -W -a -j auto -n --keep-going
```

```powershell
start build\index.html
```

```powershell
sphinx-autobuild . _build/html
```

or use the PowerShell script

```powershell
.\build.ps1
```
