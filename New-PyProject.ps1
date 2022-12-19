
$Here = Get-Location
$GitIgnore = "https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore"


Function Initialize-Directory($projectName) 
{
    $textInfo = (Get-Culture).TextInfo
    $projectName = $projectName.Replace("_", " ")
    $projectName = $textInfo.ToTitleCase($projectName.ToLower())
    $projectName = $projectName.Replace(" ", "")

    New-Item $projectName -ItemType Directory
    Set-Location "$projectName"
}


Function Initialize-Package($projectName)
{
    $projectName = $projectName.Replace("_", " ")
    $projectName = $projectName.ToLower()
    $projectName = $projectName.Replace(" ", "_")

    New-Item $projectName -ItemType Directory
    Set-Location "$projectName"
    New-Item "__init__.py"
}


Function Initialize-Venv() 
{
    Write-Host "Creating new virtual environmment..."
    py -m venv venv
    Write-Host "New virtual environment created at ${Here}\venv"
}


Function Update-Venv() 
{
    .\venv\Scripts\activate
    Write-Host "Activated virtual environment"
    Write-Host "Updating pip..."
    py -m pip install -U pip
}


Function Initialize-Poetry() 
{
    Write-Host "Installing Poetry..."
    py -m pip install poetry
    poetry init -n
}


Function Initialize-Repository() 
{
    New-Item "README.md"
    Invoke-WebRequest $GitIgnore -UseBasicParsing -O ".gitignore"
    git init
    git add -A
    git commit -m "first commit"
}


Function Main($projectName) 
{
    Initialize-Directory $projectName
    
    Initialize-Venv
    Update-Venv
    Initialize-Poetry
    Initialize-Repository

    Initialize-Package $projectName
    Set-Location ..
}


Main $args
