function Get-Teams($usuario){
    $flag = $true
    do{
        try{
            Write-Host 'Espere un momento...' -ForegroundColor Yellow
            Write-Host 'Buscando...' -ForegroundColor Yellow
            $teams = (Get-Team -User $usuario.Account | Where-Object {$_.Archived -ne "True"} | Select-Object GroupId, DisplayName, Description)
            $teams | Format-Table
            $flag = $false            
        } catch {
            Clear
            $_.Exception.Message            
            Write-Host 'Favor de verificar los datos ingresados...' -ForegroundColor Red
            $flag = $true 
        }
    } while($flag)
}

function New-Teams{
    $flag = $true      
    do{
        try{
            $team = Read-Host "Nombre del Team" 
            $alias = Read-Host "Alias del Team" 
            $description = Read-Host "Descripcion del Team" 
            $visibility = Read-Host "Public o Private"
            Write-Host 'Espere un momento...' -ForegroundColor Yellow
            New-Team -DisplayName $team -MailNickname $alias -Description $description -Visibility $visibility
            $flag = $false
            Write-Host 'Team agregado exitosamente...' -ForegroundColor Green
        } catch {
            Clear
            $_.Exception.Message            
            Write-Host 'Favor de verificar los datos ingresados...' -ForegroundColor Red
            $flag = $true 
        }
    } while($flag)
}


function Remove-Teams($usuario){
    $flag = $true
    do {
        try{
            $team = Read-Host "Nombre del team"
            Write-Host 'Espere un momento...' -ForegroundColor Yellow
            Write-Host 'Buscando...' -ForegroundColor Yellow
            $grupoId = Get-Team -User $usuario.Account -DisplayName $team            
            Remove-Team -GroupId $grupoId.GroupId
            $flag = $false
            Write-Host 'Team eliminando exitosamente...' -ForegroundColor Green
        } catch {
            Clear
            $_.Exception.Message            
            Write-Host 'Favor de verificar los datos ingresados...' -ForegroundColor Red
            $flag = $true 
        }
    } while($flag)

}

function Add-Users($usuario){
    $flag = $true
    do {
        try {
            $team = Read-Host "Nombre del team"            
            $user = Read-Host "Correo electronico del usuario"
            System.Net.Mail.MailAddress($user)            
            Write-Host 'Espere un momento...' -ForegroundColor Yellow
            Write-Host 'Buscando...' -ForegroundColor Yellow
            $grupoId = Get-Team -User $usuario.Account -DisplayName $team    
            Add-TeamUser -GroupId $grupoId.GroupId -User $user
            $flag = $false
            Write-Host 'Agregando usuario exitosamente...' -ForegroundColor Green
        } catch {
            Clear
            $_.Exception.Message            
            Write-Host 'Favor de verificar los datos ingresados...' -ForegroundColor Red
            $flag = $true 
        }
    } while ($flag)
}

function Set-Picture($usuario){
    $flag = $true
    do {
        try {
            $team = Read-Host "Nombre del team"
            $picture = Read-Host "Ubicacion de la imagen"
            Write-Host 'Espere un momento...' -ForegroundColor Yellow
            Write-Host 'Buscando...' -ForegroundColor Yellow
            $grupoId = Get-Team -User $usuario.Account -DisplayName $team        
            Set-TeamPicture -GroupId $grupoId.GroupId -ImagePath $picture
            $flag = $false
            Write-Host 'Agregando imagen exitosamente...' -ForegroundColor Green
        } catch {
            Clear
            $_.Exception.Message
            Write-Host 'Favor de verificar los datos ingresados...' -ForegroundColor Red
            $flag = $true            
        } 
    } while ($flag)
}

