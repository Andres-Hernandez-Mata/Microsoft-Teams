#Importar modulo
Import-Module -Name MicrosoftTeams -Force
Import-Module -Name FuncionesTeams -Force

#Conectar con Teams
try {

    $usuario = Connect-MicrosoftTeams -ErrorAction "Stop" | Select-Object Account

} catch {
    $_.Exception.Message
    return
}

do {
    
    #Menu        
    Write-Host '1. Ver los Teams a los que perteneces' -ForegroundColor Yellow
    Write-Host '2. Crear Team' -ForegroundColor Yellow 
    Write-Host '3. Eliminar Team del que seas propietario' -ForegroundColor Yellow
    Write-Host '4. Agregar usuario a un Team' -ForegroundColor Yellow
    Write-Host '5. Cambiar la imagen del Team' -ForegroundColor Yellow
    Write-Host '6. Salir' -ForegroundColor Red
    
    #Elegir una opcion del menu
    $input = Read-Host ‘Seleccione la tarea a realizar'        
    Clear

    #Opciones
    switch ($input) {
        1 {
            #Obtener teams
            Clear
            Get-Teams($usuario)                        
      } 2 {
            #Crear un team
            Clear
            New-Teams
      } 3 {
            #Eliminar un team
            Clear
            Remove-Teams($usuario)    
      } 4 {
            #Agregar usuario
            Clear
            Add-Users($usuario)     
      } 5 {
            #Agregar imagen al team
            Clear
            Set-Picture($usuario)
      } 6 {
            #Salir
            return
      }
    }    
} while ($input -ne 6)