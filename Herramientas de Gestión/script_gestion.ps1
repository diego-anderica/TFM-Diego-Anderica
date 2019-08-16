Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$frm_Main                        = New-Object system.Windows.Forms.Form
$frm_Main.ClientSize             = '495,172'
$frm_Main.text                   = "Administración de Usuarios"
$frm_Main.TopMost                = $false
$frm_Main.MaximizeBox            = $false
$frm_Main.FormBorderStyle        = 'Fixed3D'
$frm_Main.icon                   = "./resources/users.ico"

$frm_Menu                        = New-Object system.Windows.Forms.Form
$frm_Menu.ClientSize             = '498,172'
$frm_Menu.text                   = "Menú Principal"
$frm_Menu.TopMost                = $false

$btn_ConectarAzure               = New-Object system.Windows.Forms.Button
$btn_ConectarAzure.text          = "Conectar a Azure"
$btn_ConectarAzure.width         = 148
$btn_ConectarAzure.height        = 63
$btn_ConectarAzure.location      = New-Object System.Drawing.Point(16,26)
$btn_ConectarAzure.Font          = 'Microsoft Sans Serif,10,style=Bold'

$lbl_Titulo                      = New-Object system.Windows.Forms.Label
$lbl_Titulo.text                 = "Herramienta de Gestión de Usuarios"
$lbl_Titulo.AutoSize             = $true
$lbl_Titulo.width                = 624
$lbl_Titulo.height               = 286
$lbl_Titulo.location             = New-Object System.Drawing.Point(46,16)
$lbl_Titulo.Font                 = 'Microsoft Sans Serif,14,style=Bold'

$gr_AzureConex                   = New-Object system.Windows.Forms.Groupbox
$gr_AzureConex.height            = 102
$gr_AzureConex.width             = 376
$gr_AzureConex.text              = "Conexión a Azure"
$gr_AzureConex.location          = New-Object System.Drawing.Point(53,56)

$gr_Credenciales                 = New-Object system.Windows.Forms.Groupbox
$gr_Credenciales.height          = 105
$gr_Credenciales.width           = 316
$gr_Credenciales.text            = "Credenciales"
$gr_Credenciales.location        = New-Object System.Drawing.Point(78,189)

$txt_AppId                       = New-Object system.Windows.Forms.TextBox
$txt_AppId.multiline             = $false
$txt_AppId.width                 = 183
$txt_AppId.height                = 20
$txt_AppId.enabled               = $false
$txt_AppId.location              = New-Object System.Drawing.Point(112,24)
$txt_AppId.Font                  = 'Microsoft Sans Serif,10'

$lbl_AppID                       = New-Object system.Windows.Forms.Label
$lbl_AppID.text                  = "App ID"
$lbl_AppID.AutoSize              = $true
$lbl_AppID.width                 = 25
$lbl_AppID.height                = 10
$lbl_AppID.location              = New-Object System.Drawing.Point(14,28)
$lbl_AppID.Font                  = 'Microsoft Sans Serif,10'

$txt_Password                    = New-Object system.Windows.Forms.TextBox
$txt_Password.multiline          = $false
$txt_Password.width              = 183
$txt_Password.height             = 20
$txt_Password.enabled            = $false
$txt_Password.location           = New-Object System.Drawing.Point(112,62)
$txt_Password.Font               = 'Microsoft Sans Serif,10'

$lbl_Password                    = New-Object system.Windows.Forms.Label
$lbl_Password.text               = "Password"
$lbl_Password.AutoSize           = $true
$lbl_Password.width              = 25
$lbl_Password.height             = 10
$lbl_Password.location           = New-Object System.Drawing.Point(14,65)
$lbl_Password.Font               = 'Microsoft Sans Serif,10'

$btn_Enviar                      = New-Object system.Windows.Forms.Button
$btn_Enviar.text                 = "Enviar"
$btn_Enviar.width                = 86
$btn_Enviar.height               = 37
$btn_Enviar.enabled              = $false
$btn_Enviar.location             = New-Object System.Drawing.Point(186,308)
$btn_Enviar.Font                 = 'Microsoft Sans Serif,10,style=Bold'

$btn_DesconectarAzure            = New-Object system.Windows.Forms.Button
$btn_DesconectarAzure.text       = "Desconectar de Azure"
$btn_DesconectarAzure.width      = 148
$btn_DesconectarAzure.height     = 63
$btn_DesconectarAzure.enabled    = $false
$btn_DesconectarAzure.location   = New-Object System.Drawing.Point(200,26)
$btn_DesconectarAzure.Font       = 'Microsoft Sans Serif,10,style=Bold'

$gr_AzureConex.controls.AddRange(@($btn_ConectarAzure,$btn_DesconectarAzure))
$frm_Main.controls.AddRange(@($lbl_Titulo,$gr_AzureConex,$gr_Credenciales,$btn_Enviar))
$gr_Credenciales.controls.AddRange(@($txt_AppId,$lbl_AppID,$txt_Password,$lbl_Password))

$btn_ConectarAzure.Add_Click({ conectarAzure })
$btn_Enviar.Add_Click({ enviarCredenciales })

Import-Module AzureAD
$global:aadContext = $null

function conectarAzure {
    $global:aadContext = Connect-AzureAD

    if ($?){
        [System.Windows.MessageBox]::Show('Se ha iniciado sesión en Azure')
        $btn_ConectarAzure.Enabled = $false
        $btn_DesconectarAzure.Enabled = $true

        habilitarCredenciales

        #$frm_Main.Hide()
        #$frm_Main.Close()
            
        #$frm_Menu.ShowDialog()
    } else {
        [System.Windows.MessageBox]::Show('Ha habido un problema al intentar conectar con Azure. Inténtalo de nuevo')
    }
        
}

function habilitarCredenciales {
    $frm_Main.ClientSize = '495,400'
    $txt_AppId.Enabled = $true
    $txt_Password.Enabled = $true
    $btn_Enviar.Enabled = $true
}

function enviarCredenciales {
    if ($txt_AppId.Text -eq "") {
        [System.Windows.MessageBox]::Show("El campo 'App ID' no puede estar vacío")
    } elseif ($txt_Password.Text -eq "") {
        [System.Windows.MessageBox]::Show("El campo 'Password' no puede estar vacío")
    } else {
        $creds = New-Object System.Management.Automation.PSCredential($txt_AppId.Text, (ConvertTo-SecureString $txt_Password.Text -AsPlainText -Force))
        Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com" -Credential $creds -ServicePrincipal -AadTenantId $global:aadContext.TenantId.Guid

        if ($?){
            $frm_Main.Hide()
            $frm_Main.Close()
            
            $frm_Menu.ShowDialog()
        } else {
            Write-Host $aadContext
        }
    }
}


[void]$frm_Main.ShowDialog()