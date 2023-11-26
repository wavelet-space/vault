# PowerShell

## Files and Directories

### Create empty file

    Create-Item [-Path] <path

### Create file with content

    $text = 'Hello, World!' | Out-File $text -FilePath <path>

### Delete file

    Remove-Item <path
alias
    rm

### Move file

    Move-Item

### Copy

    Copy-Item

### Rename

    Rename-Item

### Other

```powershell
Export-Csv- Path
New-Item -Path <path> -ItemType File
New-Item -Path <path> -ItemType Directory
```

https://blog.netwrix.com/2018/05/17/powershell-file-management/