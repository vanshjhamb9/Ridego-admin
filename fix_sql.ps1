# Fix SQL file - Remove DEFAULT NULL from TEXT/BLOB columns
$inputFile = "C:\Ridego\zippygo.sql"
$outputFile = "C:\Ridego\zippygo_fixed.sql"

Write-Host "Reading SQL file..."
$content = Get-Content $inputFile -Raw

Write-Host "Fixing TEXT/BLOB columns with DEFAULT NULL..."
# Remove DEFAULT NULL from TEXT/BLOB/JSON columns
$content = $content -replace ' LONGTEXT DEFAULT NULL', ' LONGTEXT'
$content = $content -replace ' TEXT DEFAULT NULL', ' TEXT'
$content = $content -replace ' BLOB DEFAULT NULL', ' BLOB'
$content = $content -replace ' JSON DEFAULT NULL', ' JSON'
$content = $content -replace ' MEDIUMTEXT DEFAULT NULL', ' MEDIUMTEXT'
$content = $content -replace ' TINYTEXT DEFAULT NULL', ' TINYTEXT'

# Also handle cases with DEFAULT '' (empty string)
$content = $content -replace ' LONGTEXT DEFAULT ''', ' LONGTEXT'
$content = $content -replace ' TEXT DEFAULT ''', ' TEXT'

Write-Host "Saving fixed file to $outputFile..."
$content | Set-Content $outputFile -NoNewline

Write-Host "Done! Fixed file saved as zippygo_fixed.sql"
Write-Host "You can now import zippygo_fixed.sql in MySQL Workbench"






