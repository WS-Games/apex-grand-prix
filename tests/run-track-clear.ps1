# Runs tests/track-clear.html headless in Edge and prints the result.
# Exit code 0 = every track clear, 1 = something is on or over a road (or the game failed to start).
$ErrorActionPreference = 'Stop'
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$page = (Resolve-Path (Join-Path $PSScriptRoot 'track-clear.html')).Path
$profile = Join-Path $env:TEMP 'apexgp_trackclear_profile'
$dom = & $edge --headless=new --use-angle=swiftshader --enable-unsafe-swiftshader --allow-file-access-from-files --disable-web-security "--user-data-dir=$profile" --window-size=400,300 --virtual-time-budget=1200000 --dump-dom "file:///$($page.Replace('\','/'))" | Out-String
Get-CimInstance Win32_Process -Filter "Name='msedge.exe'" | Where-Object { $_.CommandLine -like '*apexgp_trackclear_profile*' } | ForEach-Object { try { Stop-Process -Id $_.ProcessId -Force -ErrorAction Stop } catch {} }
$m = [regex]::Match($dom, '<pre id="result"[^>]*>([^<]*)</pre>')
if (-not $m.Success -or -not $m.Groups[1].Value) { Write-Output 'RESULT FAIL || test did not finish'; exit 1 }
$text = [System.Net.WebUtility]::HtmlDecode($m.Groups[1].Value)
$text -split ' \|\| ' | ForEach-Object { Write-Output $_ }
if ($text.StartsWith('RESULT PASS')) { exit 0 } else { exit 1 }
