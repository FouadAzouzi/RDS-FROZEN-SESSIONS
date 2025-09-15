$usuario = $env:USERNAME
$servidores = @("172.20.64.30", "172.20.64.31", "172.20.64.33", "172.20.64.34", "172.20.64.35", "172.20.64.36", "172.20.64.37")
$sesionesActivas = $false

foreach ($servidor in $servidores) {
    Write-Host "Buscando sesiones..."
    $sesiones = quser /server:$servidor 2>$null | Where-Object { $_ -match $usuario }

    if ($sesiones) {
        $sesionesActivas = $true
        Write-Host "Se encontraron sesiones activas para $usuario."

        $confirmacion = Read-Host "¿Deseas cerrarlas? (S/N)  S= Cerrar ; N= No cerrar"
        if ($confirmacion -eq "S") {
            foreach ($sesion in $sesiones) {
                $idSesion = ($sesion -split "\s+")[2]
                logoff $idSesion /SERVER:$servidor
            }
            Write-Host "Sesiones cerradas exitosamente."
        } else {
            Write-Host "No se han cerrado sesiones."
        }
    }
}

if (-not $sesionesActivas) {
    Write-Host "No se encontraron sesiones activas para $usuario en ninguno de los servidores."
}
exit
