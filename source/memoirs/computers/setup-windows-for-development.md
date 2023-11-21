# Setup Windows for development

This notes contains inforamtion how to setup personal computer with Windows OS for software development.

I have created PowerShell script with functions to install lot of tools with `winget`.
The scripts checks if the winget is present on computer (it should be included in Windows 10 and later).

## Install and configure

mark with *auto* or *manual*

- Set dark theme:
  Go to `Select Start > Settings > Personalization > Colors` and select *Dark*.
- Window Terminal
  - as main terminal
  - todo: other settings
- PowerShell 7 and set as main shell.
- Visual Studio Code
  - Python extension
  - Docker extension
  - Markdown extension + linter (markdownlint)
  - [C++ extension](https://visualstudio.microsoft.com/cs/visual-cpp-build-tools/)
  - Note: You can export/import settings
- Move status bar to right and set the icons to small
- Set the second monitor as main monitor
- Set the language to English (needs restart)
- Set the keayboard to Czech QWERTY and remove Czech QWERTZ
  - Swap second and third row
- [MinGW-w64](https://www.mingw-w64.org/)
- import SSH keys (`C:\Users\{user}\.ssh`).
- Google Chrome
  - i dont care about cookies
  - adbblock plus
  - disable cookies
- VS Code extenze a nastavení <https://bobbyhadz.com/blog/vscode-export-settings-and-extensions>
- Git
  - `git config --system --list`
  - `git config --global --list`
  - `git config --local --list`
  - `git config --system init.defaultBranch main`
  - `~/.gitconfig`???
- MSVC build tools <https://visualstudio.microsoft.com/cs/visual-cpp-build-tools/>
- vcpg
- install Python: CPython (3.12, 3.11), PyPy (3.9)
  - requirements.txt
    - sphinx
    - ...
- Node.js
- PowerTools
  - Swap CAPS Lock na Escape

- WinSCP can be handy
- <https://winscp.net/download/WinSCP-6.1.2-Setup.exe>
- it is also on winget but i dont know if it si official

- Set PowerShell prompt¨
- Set Windows Terminal Tab names to be named by folder
