<#
Quick git push helper (PowerShell)
Usage:
  .\gitpush.ps1 -Message "commit message"
  .\gitpush.ps1                # uses yyyy_MM_dd as default message
#>
param(
  [string]$Message = (Get-Date -Format 'yyyy_MM_dd')
)
Write-Host "Running: git add ."
git add .
Write-Host "Running: git commit -m '$Message'"
git commit -m $Message
if ($LASTEXITCODE -eq 0) {
  Write-Host "Commit successful. Pushing..."
  git push
} else {
  Write-Host "Commit failed or nothing to commit. Exit code: $LASTEXITCODE"
}
