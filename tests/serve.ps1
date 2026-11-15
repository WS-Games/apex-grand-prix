# Tiny static web server for previewing the game locally (http://localhost:8123/).
# Usage: powershell -NoProfile -ExecutionPolicy Bypass -File tests\serve.ps1
param([int]$Port = 8123)
$root = Split-Path $PSScriptRoot -Parent
$mime = @{ '.html'='text/html; charset=utf-8'; '.js'='text/javascript; charset=utf-8'; '.json'='application/json'; '.png'='image/png'; '.jpg'='image/jpeg'; '.css'='text/css'; '.txt'='text/plain; charset=utf-8'; '.glb'='model/gltf-binary'; '.svg'='image/svg+xml'; '.ico'='image/x-icon' }
$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://localhost:$Port/")
$l.Start()
Write-Output "Serving $root at http://localhost:$Port/"
while ($l.IsListening) {
  $ctx = $l.GetContext()
  try {
    $path = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
    if ($path -eq '') { $path = 'index.html' }
    $file = [IO.Path]::GetFullPath((Join-Path $root $path))
    if (-not $file.StartsWith($root) -or -not (Test-Path $file -PathType Leaf)) { $ctx.Response.StatusCode = 404 }
    else {
      $bytes = [IO.File]::ReadAllBytes($file)
      $ext = [IO.Path]::GetExtension($file).ToLower()
      $ctx.Response.ContentType = if ($mime.ContainsKey($ext)) { $mime[$ext] } else { 'application/octet-stream' }
      $ctx.Response.Headers.Add('Cache-Control', 'no-store')
      $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    }
  } catch {} finally { try { $ctx.Response.Close() } catch {} }
}
