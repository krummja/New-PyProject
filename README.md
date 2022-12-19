# New-PyProject cmdlet

This is a custom Powershell cmdlet that automates my standard Python project boilerplate. To make the command `New-PyProject` available from anywhere in Powershell, put this file in a directory that is on `$Env:PATH`, then alias it to `New-PyProject` in your Powershell profile (by default `My Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` for all hosts).

## Usage

```powershell
New-PyProject "project_name"
# OR 
New-Pyproject "Project Name"
```

The project name is not case sensitive, as it will be converted to title case for the project folder and snake case for the Python package created inside the project folder.

## Project Structure

Executing:

```powershell
New-PyProject "Foo Bar"
```

Will set up a new project with the structure:

```
└── FooBar
    ├── .gitignore
    ├── pyproject.toml
    ├── README.md
    ├── .git/
    ├── foo_bar/
    │   └── __init__.py
    └── venv/
```

A new Python virtual environment will be initialized, pip updated to the most recent version, and a new poetry project started. 

A git repository will also be initialized. The `.gitignore` file is the standard Python `.gitignore` sourced from the [official github repository](https://github.com/github/gitignore/blob/main/Python.gitignore).
