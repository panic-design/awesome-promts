$OutputFileName = "project.md"

Remove-Item $OutputFileName -ErrorAction SilentlyContinue

Get-ChildItem -Path . -Include *.cpp, *.h, *.hpp -File -Recurse | ForEach-Object {
    $RelativePath = $_.FullName.Substring($pwd.Path.Length + 1)
    
    "# $RelativePath" | Out-File -FilePath $OutputFileName -Encoding UTF8 -Append
    Get-Content $_.FullName -Encoding UTF8 | Out-File -FilePath $OutputFileName -Encoding UTF8 -Append
    "`n" | Out-File -FilePath $OutputFileName -Encoding UTF8 -Append
}