Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

####################################################
################### frm_Main #######################
####################################################

$frm_Main                                 = New-Object system.Windows.Forms.Form
$frm_Main.ClientSize                      = New-Object System.Drawing.Size(495, 172)
$frm_Main.text                            = "Administración de Usuarios - Conexión a Azure"
$frm_Main.TopMost                         = $false
$frm_Main.MaximizeBox                     = $false
$frm_Main.Name                            = "frm_Main"
$frm_Main.FormBorderStyle                 = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_Main.icon                            = "./resources/users.ico"

$btn_ConectarAzure                        = New-Object system.Windows.Forms.Button
$btn_ConectarAzure.text                   = "Conectar a Azure"
$btn_ConectarAzure.width                  = 148
$btn_ConectarAzure.height                 = 63
$btn_ConectarAzure.location               = New-Object System.Drawing.Point(16,26)
$btn_ConectarAzure.Font                   = 'Microsoft Sans Serif,10,style=Bold'

$lbl_Titulo                               = New-Object system.Windows.Forms.Label
$lbl_Titulo.text                          = "Herramienta de Gestión de Usuarios"
$lbl_Titulo.AutoSize                      = $true
$lbl_Titulo.width                         = 624
$lbl_Titulo.height                        = 286
$lbl_Titulo.location                      = New-Object System.Drawing.Point(46,16)
$lbl_Titulo.Font                          = 'Microsoft Sans Serif,14,style=Bold'

$gr_AzureConex                            = New-Object system.Windows.Forms.Groupbox
$gr_AzureConex.height                     = 102
$gr_AzureConex.width                      = 376
$gr_AzureConex.text                       = "Conexión a Azure"
$gr_AzureConex.location                   = New-Object System.Drawing.Point(53,56)

$gr_Credenciales                          = New-Object system.Windows.Forms.Groupbox
$gr_Credenciales.height                   = 105
$gr_Credenciales.width                    = 316
$gr_Credenciales.text                     = "Credenciales"
$gr_Credenciales.location                 = New-Object System.Drawing.Point(78,189)

$txt_AppId                                = New-Object system.Windows.Forms.TextBox
$txt_AppId.multiline                      = $false
$txt_AppId.width                          = 183
$txt_AppId.height                         = 20
$txt_AppId.enabled                        = $false
$txt_AppId.location                       = New-Object System.Drawing.Point(112,24)
$txt_AppId.Font                           = 'Microsoft Sans Serif,10'

$lbl_AppID                                = New-Object system.Windows.Forms.Label
$lbl_AppID.text                           = "App ID"
$lbl_AppID.AutoSize                       = $true
$lbl_AppID.width                          = 25
$lbl_AppID.height                         = 10
$lbl_AppID.location                       = New-Object System.Drawing.Point(14,28)
$lbl_AppID.Font                           = 'Microsoft Sans Serif,10'

$txt_Password                             = New-Object system.Windows.Forms.TextBox
$txt_Password.multiline                   = $false
$txt_Password.width                       = 183
$txt_Password.height                      = 20
$txt_Password.enabled                     = $false
$txt_Password.location                    = New-Object System.Drawing.Point(112,62)
$txt_Password.Font                        = 'Microsoft Sans Serif,10'

$lbl_Password                             = New-Object system.Windows.Forms.Label
$lbl_Password.text                        = "Password"
$lbl_Password.AutoSize                    = $true
$lbl_Password.width                       = 25
$lbl_Password.height                      = 10
$lbl_Password.location                    = New-Object System.Drawing.Point(14,65)
$lbl_Password.Font                        = 'Microsoft Sans Serif,10'

$btn_Enviar                               = New-Object system.Windows.Forms.Button
$btn_Enviar.text                          = "Enviar"
$btn_Enviar.width                         = 86
$btn_Enviar.height                        = 37
$btn_Enviar.enabled                       = $false
$btn_Enviar.location                      = New-Object System.Drawing.Point(186,308)
$btn_Enviar.Font                          = 'Microsoft Sans Serif,10,style=Bold'

$btn_DesconectarAzure                     = New-Object system.Windows.Forms.Button
$btn_DesconectarAzure.text                = "Desconectar de Azure"
$btn_DesconectarAzure.width               = 148
$btn_DesconectarAzure.height              = 63
$btn_DesconectarAzure.enabled             = $false
$btn_DesconectarAzure.location            = New-Object System.Drawing.Point(200,26)
$btn_DesconectarAzure.Font                = 'Microsoft Sans Serif,10,style=Bold'

$gr_AzureConex.controls.AddRange(@($btn_ConectarAzure,$btn_DesconectarAzure))
$frm_Main.controls.AddRange(@($lbl_Titulo,$gr_AzureConex,$gr_Credenciales,$btn_Enviar))
$gr_Credenciales.controls.AddRange(@($txt_AppId,$lbl_AppID,$txt_Password,$lbl_Password))

$btn_ConectarAzure.Add_Click({ conectarAzure })
$btn_DesconectarAzure.Add_Click({ desconectarAzure $true })
$btn_Enviar.Add_Click({ enviarCredenciales })

####################################################
################ End frm_Main ######################
####################################################



####################################################
################### frm_Menu #######################
####################################################

$frm_Menu                                 = New-Object system.Windows.Forms.Form
$frm_Menu.ClientSize                      = New-Object System.Drawing.Size(502, 536)
$frm_Menu.FormBorderStyle                 = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_Menu.MaximizeBox                     = $false
$frm_Menu.Name                            = "frm_Menu"
$frm_Menu.Text                            = "Administración de WVD - Menú Principal"

$lbl_MenuPcpal                            = New-Object System.Windows.Forms.Label
$lbl_MenuPcpal.AutoSize                   = $true
$lbl_MenuPcpal.Font                       = New-Object System.Drawing.Font("Microsoft Sans Serif", 18,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)
$lbl_MenuPcpal.Location                   = New-Object System.Drawing.Point(130, 20)
$lbl_MenuPcpal.Name                       = "lbl_MenuPcpal"
$lbl_MenuPcpal.Size                       = New-Object System.Drawing.Size(228, 36)
$lbl_MenuPcpal.Text                       = "Menú Principal"

$btn_InfoHostPool                         = New-Object System.Windows.Forms.Button
$btn_InfoHostPool.Location                = New-Object System.Drawing.Point(130, 94)
$btn_InfoHostPool.Name                    = "btn_InfoHostPool"
$btn_InfoHostPool.Size                    = New-Object System.Drawing.Size(235, 102)
$btn_InfoHostPool.Text                    = "Ver HostPools Disponibles"
$btn_InfoHostPool.UseVisualStyleBackColor = $true
$btn_InfoHostPool.Font                    = 'Microsoft Sans Serif,10,style=Bold'

$frm_Menu.Controls.AddRange(@($lbl_MenuPcpal,$btn_InfoHostPool))

$btn_InfoHostPool.Add_Click({ lanzarVentanaInfo })

####################################################
################# End frm_Menu #####################
####################################################



####################################################
############### frm_InfoHostPool ###################
####################################################

$frm_InfoHostPool                         = New-Object System.Windows.Forms.Form
$frm_InfoHostPool.ClientSize              = New-Object System.Drawing.Size(673, 686)
$frm_InfoHostPool.FormBorderStyle         = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_InfoHostPool.MaximizeBox             = $false
$frm_InfoHostPool.Name                    = "frm_InfoHostPool"
$frm_InfoHostPool.Text                    = "Administración de WVD - Info HostPools"

$lbl_InfoHostPool                         = New-Object System.Windows.Forms.Label
$lbl_InfoHostPool.AutoSize                = $true
$lbl_InfoHostPool.Font                    = New-Object System.Drawing.Font("Microsoft Sans Serif", 16.2,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)
$lbl_InfoHostPool.Location                = New-Object System.Drawing.Point(155, 9)
$lbl_InfoHostPool.Name                    = "lbl_InfoHostPool"
$lbl_InfoHostPool.Size                    = New-Object System.Drawing.Size(363, 32)
$lbl_InfoHostPool.Text                    = "Información de HostPools"

$cb_ListaHostPools                        = New-Object System.Windows.Forms.ComboBox
$cb_ListaHostPools.FormattingEnabled      = $true
$cb_ListaHostPools.Location               = New-Object System.Drawing.Point(254, 73)
$cb_ListaHostPools.Name                   = "cb_ListaHostPools"
$cb_ListaHostPools.Size                   = New-Object System.Drawing.Size(390, 24)
$cb_ListaHostPools.DropDownStyle          = [System.Windows.Forms.ComboBoxStyle]::DropDownList

$lbl_SeleccionHostPool                    = New-Object System.Windows.Forms.Label
$lbl_SeleccionHostPool.AutoSize           = $true
$lbl_SeleccionHostPool.Location           = New-Object System.Drawing.Point(28, 76)
$lbl_SeleccionHostPool.Name               = "lbl_SeleccionHostPool"
$lbl_SeleccionHostPool.Size               = New-Object System.Drawing.Size(220, 17)
$lbl_SeleccionHostPool.Text               = "Selecciona un HostPool Disponible"

$gr_ParametrosHostPool                    = New-Object System.Windows.Forms.GroupBox
$gr_ParametrosHostPool.Controls.Add($txt_Ring)
$gr_ParametrosHostPool.Controls.Add($lbl_Ring)
$gr_ParametrosHostPool.Controls.Add($txt_ValidationEnv)
$gr_ParametrosHostPool.Controls.Add($lbl_ValidationEnv)
$gr_ParametrosHostPool.Controls.Add($txt_LoadBalancerType)
$gr_ParametrosHostPool.Controls.Add($lbl_LoadBalancerType)
$gr_ParametrosHostPool.Controls.Add($txt_MaxSessionLimit)
$gr_ParametrosHostPool.Controls.Add($lbl_MaxSessionLimit)
$gr_ParametrosHostPool.Controls.Add($txt_CustomRdpProperty)
$gr_ParametrosHostPool.Controls.Add($lbl_CustomRdpProperty)
$gr_ParametrosHostPool.Controls.Add($txt_Persistent)
$gr_ParametrosHostPool.Controls.Add($lbl_Persistent)
$gr_ParametrosHostPool.Controls.Add($txt_Description)
$gr_ParametrosHostPool.Controls.Add($lbl_Description)
$gr_ParametrosHostPool.Controls.Add($txt_FriendlyName)
$gr_ParametrosHostPool.Controls.Add($lbl_FriendlyName)
$gr_ParametrosHostPool.Controls.Add($txt_HostPoolName)
$gr_ParametrosHostPool.Controls.Add($lbl_HostPoolName)
$gr_ParametrosHostPool.Controls.Add($txt_TenantGroupName)
$gr_ParametrosHostPool.Controls.Add($txt_TenantName)
$gr_ParametrosHostPool.Controls.Add($lbl_TenantGroupName)
$gr_ParametrosHostPool.Controls.Add($lbl_TenantName)
$gr_ParametrosHostPool.Location           = New-Object System.Drawing.Point(42, 132)
$gr_ParametrosHostPool.Name               = "gr_ParametrosHostPool"
$gr_ParametrosHostPool.Size               = New-Object System.Drawing.Size(589, 456)
$gr_ParametrosHostPool.TabStop            = $false
$gr_ParametrosHostPool.Text               = "Parámetros del HostPool"

$txt_Ring                                 = New-Object System.Windows.Forms.TextBox
$txt_Ring.Location                        = New-Object System.Drawing.Point(155, 411)
$txt_Ring.Name                            = "txt_Ring"
$txt_Ring.Size                            = New-Object System.Drawing.Size(410, 22)
$txt_Ring.ReadOnly                        = $true

$lbl_Ring                                 = New-Object System.Windows.Forms.Label
$lbl_Ring.AutoSize                        = $true
$lbl_Ring.Location                        = New-Object System.Drawing.Point(112, 414)
$lbl_Ring.Name                            = "lbl_Ring"
$lbl_Ring.Size                            = New-Object System.Drawing.Size(37, 17)
$lbl_Ring.Text                            = "Ring"

$txt_ValidationEnv                        = New-Object System.Windows.Forms.TextBox
$txt_ValidationEnv.Location               = New-Object System.Drawing.Point(155, 373)
$txt_ValidationEnv.Name                   = "txt_ValidationEnv"
$txt_ValidationEnv.Size                   = New-Object System.Drawing.Size(410, 22)
$txt_ValidationEnv.ReadOnly               = $true

$lbl_ValidationEnv                        = New-Object System.Windows.Forms.Label
$lbl_ValidationEnv.AutoSize               = $true
$lbl_ValidationEnv.Location               = New-Object System.Drawing.Point(55, 376)
$lbl_ValidationEnv.Name                   = "lbl_ValidationEnv"
$lbl_ValidationEnv.Size                   = New-Object System.Drawing.Size(94, 17)
$lbl_ValidationEnv.Text                   = "ValidationEnv"

$txt_LoadBalancerType                     = New-Object System.Windows.Forms.TextBox
$txt_LoadBalancerType.Location            = New-Object System.Drawing.Point(155, 335)
$txt_LoadBalancerType.Name                = "txt_LoadBalancerType"
$txt_LoadBalancerType.Size                = New-Object System.Drawing.Size(410, 22)
$txt_LoadBalancerType.ReadOnly            = $true

$lbl_LoadBalancerType                     = New-Object System.Windows.Forms.Label
$lbl_LoadBalancerType.AutoSize            = $true
$lbl_LoadBalancerType.Location            = New-Object System.Drawing.Point(21, 338)
$lbl_LoadBalancerType.Name                = "lbl_LoadBalancerType"
$lbl_LoadBalancerType.Size                = New-Object System.Drawing.Size(128, 17)
$lbl_LoadBalancerType.Text                = "LoadBalancerType"

$txt_MaxSessionLimit                      = New-Object System.Windows.Forms.TextBox
$txt_MaxSessionLimit.Location             = New-Object System.Drawing.Point(155, 297)
$txt_MaxSessionLimit.Name                 = "txt_MaxSessionLimit"
$txt_MaxSessionLimit.Size                 = New-Object System.Drawing.Size(410, 22)
$txt_MaxSessionLimit.ReadOnly             = $true

$lbl_MaxSessionLimit                      = New-Object System.Windows.Forms.Label
$lbl_MaxSessionLimit.AutoSize             = $true
$lbl_MaxSessionLimit.Location             = New-Object System.Drawing.Point(37, 300)
$lbl_MaxSessionLimit.Name                 = "lbl_MaxSessionLimit"
$lbl_MaxSessionLimit.Size                 = New-Object System.Drawing.Size(112, 17)
$lbl_MaxSessionLimit.Text                 = "MaxSessionLimit"

$txt_CustomRdpProperty                    = New-Object System.Windows.Forms.TextBox
$txt_CustomRdpProperty.Location           = New-Object System.Drawing.Point(155, 260)
$txt_CustomRdpProperty.Name               = "txt_CustomRdpProperty"
$txt_CustomRdpProperty.Size               = New-Object System.Drawing.Size(410, 22)
$txt_CustomRdpProperty.ReadOnly           = $true

$lbl_CustomRdpProperty                    = New-Object System.Windows.Forms.Label
$lbl_CustomRdpProperty.AutoSize           = $true
$lbl_CustomRdpProperty.Location           = New-Object System.Drawing.Point(14, 263)
$lbl_CustomRdpProperty.Name               = "lbl_CustomRdpProperty"
$lbl_CustomRdpProperty.Size               = New-Object System.Drawing.Size(135, 17)
$lbl_CustomRdpProperty.Text               = "CustomRdpProperty"

$txt_Persistent                           = New-Object System.Windows.Forms.TextBox
$txt_Persistent.Location                  = New-Object System.Drawing.Point(155, 221)
$txt_Persistent.Name                      = "txt_Persistent"
$txt_Persistent.Size                      = New-Object System.Drawing.Size(410, 22)
$txt_Persistent.ReadOnly                  = $true

$lbl_Persistent                           = New-Object System.Windows.Forms.Label
$lbl_Persistent.AutoSize                  = $true
$lbl_Persistent.Location                  = New-Object System.Drawing.Point(78, 224)
$lbl_Persistent.Name                      = "lbl_Persistent"
$lbl_Persistent.Size                      = New-Object System.Drawing.Size(71, 17)
$lbl_Persistent.Text                      = "Persistent"

$txt_Description                          = New-Object System.Windows.Forms.TextBox
$txt_Description.Location                 = New-Object System.Drawing.Point(155, 182)
$txt_Description.Name                     = "txt_Description"
$txt_Description.Size                     = New-Object System.Drawing.Size(410, 22)
$txt_Description.ReadOnly                 = $true

$lbl_Description                          = New-Object System.Windows.Forms.Label
$lbl_Description.AutoSize                 = $true
$lbl_Description.Location                 = New-Object System.Drawing.Point(70, 185)
$lbl_Description.Name                     = "lbl_Description"
$lbl_Description.Size                     = New-Object System.Drawing.Size(79, 17)
$lbl_Description.Text                     = "Description"

$txt_FriendlyName                         = New-Object System.Windows.Forms.TextBox
$txt_FriendlyName.Location                = New-Object System.Drawing.Point(155, 144)
$txt_FriendlyName.Name                    = "txt_FriendlyName"
$txt_FriendlyName.Size                    = New-Object System.Drawing.Size(410, 22)
$txt_FriendlyName.ReadOnly                = $true

$lbl_FriendlyName                         = New-Object System.Windows.Forms.Label
$lbl_FriendlyName.AutoSize                = $true
$lbl_FriendlyName.Location                = New-Object System.Drawing.Point(54, 147)
$lbl_FriendlyName.Name                    = "lbl_FriendlyName"
$lbl_FriendlyName.Size                    = New-Object System.Drawing.Size(95, 17)
$lbl_FriendlyName.Text                    = "FriendlyName"

$txt_HostPoolName                         = New-Object System.Windows.Forms.TextBox
$txt_HostPoolName.Location                = New-Object System.Drawing.Point(155, 105)
$txt_HostPoolName.Name                    = "txt_HostPoolName"
$txt_HostPoolName.Size                    = New-Object System.Drawing.Size(410, 22)
$txt_HostPoolName.ReadOnly                = $true

$lbl_HostPoolName                         = New-Object System.Windows.Forms.Label
$lbl_HostPoolName.AutoSize                = $true
$lbl_HostPoolName.Location                = New-Object System.Drawing.Point(47, 108)
$lbl_HostPoolName.Name                    = "lbl_HostPoolName"
$lbl_HostPoolName.Size                    = New-Object System.Drawing.Size(102, 17)
$lbl_HostPoolName.Text                    = "HostPoolName"

$txt_TenantGroupName                      = New-Object System.Windows.Forms.TextBox
$txt_TenantGroupName.Location             = New-Object System.Drawing.Point(155, 68)
$txt_TenantGroupName.Name                 = "txt_TenantGroupName"
$txt_TenantGroupName.Size                 = New-Object System.Drawing.Size(410, 22)
$txt_TenantGroupName.ReadOnly             = $true

$txt_TenantName                           = New-Object System.Windows.Forms.TextBox
$txt_TenantName.Location                  = New-Object System.Drawing.Point(155, 31)
$txt_TenantName.Name                      = "txt_TenantName"
$txt_TenantName.Size                      = New-Object System.Drawing.Size(410, 22)
$txt_TenantName.ReadOnly                  = $true

$lbl_TenantGroupName                      = New-Object System.Windows.Forms.Label
$lbl_TenantGroupName.AutoSize             = $true
$lbl_TenantGroupName.Location             = New-Object System.Drawing.Point(19, 71)
$lbl_TenantGroupName.Name                 = "lbl_TenantGroupName"
$lbl_TenantGroupName.Size                 = New-Object System.Drawing.Size(130, 17)
$lbl_TenantGroupName.Text                 = "TenantGroupName"

$lbl_TenantName                           = New-Object System.Windows.Forms.Label
$lbl_TenantName.AutoSize                  = $true
$lbl_TenantName.Location                  = New-Object System.Drawing.Point(59, 34)
$lbl_TenantName.Name                      = "lbl_TenantName"
$lbl_TenantName.Size                      = New-Object System.Drawing.Size(90, 17)
$lbl_TenantName.Text                      = "TenantName"

$btn_Volver                               = New-Object System.Windows.Forms.Button
$btn_Volver.Location                      = New-Object System.Drawing.Point(205, 610)
$btn_Volver.Name                          = "btn_Volver"
$btn_Volver.Size                          = New-Object System.Drawing.Size(229, 64)
$btn_Volver.Text                          = "Volver"
$btn_Volver.UseVisualStyleBackColor       = $true


$frm_InfoHostPool.Controls.AddRange(@($btn_Volver,$gr_ParametrosHostPool,$lbl_SeleccionHostPool,$cb_ListaHostPools,$lbl_InfoHostPool))

$frm_InfoHostPool.Add_Load( { cargarHostPools } )

$btn_Volver.Add_Click({ cerrarVentana $frm_InfoHostPool })
$cb_ListaHostPools.Add_SelectedIndexChanged( { poblarParametrosHostPool $cb_ListaHostPools.SelectedItem.ToString() } )

####################################################
############ End frm_InfoHostPool ##################
####################################################



####################################################
################ Global Imports ####################
####################################################
Import-Module AzureAD
####################################################
############## End Global Imports ##################
####################################################



####################################################
############## Global Variables ####################
####################################################
$global:aadContext = $null
$global:tenantName = "UCLM"
$global:deploymentURL = "https://rdbroker.wvd.microsoft.com"
####################################################
############# End Global Variables #################
####################################################



####################################################
############## Global Functions ####################
####################################################

function cerrarVentana ($ventana){
    $ventana.Close()
}

function generarPopUp ($opciones, $icono, $titulo, $mensaje) {
    $ButtonType = $null
    $MessageIcon = $null
    $MessageBody = $null
    $MessageTitle = $null

    if ($opciones -eq "SiNo") {
        $ButtonType = [System.Windows.MessageBoxButton]::YesNo
    } elseif ($opciones -eq "Ok") {
        $ButtonType = [System.Windows.MessageBoxButton]::OK
    }

    if ($icono -eq "Info") {
        $MessageIcon = [System.Windows.MessageBoxImage]::Information
    } elseif ($icono -eq "Warning") {
        $MessageIcon = [System.Windows.MessageBoxImage]::Warning
    } elseif ($icono -eq "Error") {
        $MessageIcon = [System.Windows.MessageBoxImage]::Error
    } elseif ($icono -eq "Pregunta") {
        $MessageIcon = [System.Windows.MessageBoxImage]::Question
    }

    $MessageTitle = $titulo
    $MessageBody = $mensaje

    return ([System.Windows.MessageBox]::Show($MessageBody, $MessageTitle, $ButtonType, $MessageIcon))
}

function desconectarAzure ($ventanaMain) {
    if ($ventanaMain -eq $true) {
        if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "¿Desconectar de Azure?") -eq "Yes") {
            Disconnect-AzureAD
            $global:aadContext = $null
            habilitarCredenciales $false
        }
    } else {
        Disconnect-AzureAD
        $global:aadContext = $null
    }
}

function preguntaSalir ($ventana) {
    if ((generarPopUp "SiNo" "Warning" "Aviso" "Cerrar el programa cerrará su sesión en Azure. ¿Continuar?") -eq "Yes") {
        desconectarAzure $false
        cerrarVentana $ventana
    }
}

####################################################
############# End Global Functions #################
####################################################


####################################################
############# Functions frm_Main ###################
####################################################

function conectarAzure {
    $btn_ConectarAzure.Enabled = $false
    $global:aadContext = Connect-AzureAD

    if ($?){
        generarPopUp "Ok" "Info" "Información" "Se ha iniciado sesión en Azure correctamente"

        habilitarCredenciales $true
    } else {
        generarPopUp "Ok" "Warning" "Ha habido un problema" "Ha habido un problema al intentar conectar con Azure. Inténtelo de nuevo"
        $btn_ConectarAzure.Enabled = $true
    }
        
}

function habilitarCredenciales($habilitar) {
    if ($habilitar -eq $true) {
        $btn_ConectarAzure.Enabled = $false
        $btn_DesconectarAzure.Enabled = $true
        $frm_Main.ClientSize = '495,400'
        $txt_AppId.Enabled = $true
        $txt_Password.Enabled = $true
        $btn_Enviar.Enabled = $true
    } else {
        $btn_ConectarAzure.Enabled = $true
        $btn_DesconectarAzure.Enabled = $false
        $frm_Main.ClientSize = '495,172'
        $txt_AppId.Enabled = $false
        $txt_Password.Enabled = $false
        $btn_Enviar.Enabled = $false
    }
}

function enviarCredenciales {
    if ($txt_AppId.Text -eq "") {
        generarPopUp "Ok" "Warning" "Aviso" "El campo 'App ID' no puede estar vacío"
    } elseif ($txt_Password.Text -eq "") {
        generarPopUp "Ok" "Warning" "Aviso" "El campo 'Password' no puede estar vacío"
    } else {
        $btn_Enviar.Enabled = $false
        $btn_DesconectarAzure.Enabled = $false

        $creds = New-Object System.Management.Automation.PSCredential($txt_AppId.Text, (ConvertTo-SecureString $txt_Password.Text -AsPlainText -Force))
        Add-RdsAccount -DeploymentUrl $global:deploymentURL -Credential $creds -ServicePrincipal -AadTenantId $global:aadContext.TenantId.Guid

        if ($?){
            generarPopUp "Ok" "Info" "Información" "Se ha enlazado correctamente con el servicio."
            $frm_Main.Dispose()
            $frm_Menu.ShowDialog()
        } else {
            generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al enlazar con el servicio. Compruebe las credenciales e inténtelo de nuevo."
            $btn_Enviar.Enabled = $true
            $btn_DesconectarAzure.Enabled = $true
        }

    }
}

####################################################
########### End functions frm_Main #################
####################################################


####################################################
############# Functions frm_Menu ###################
####################################################

function lanzarVentanaInfo {
    $frm_InfoHostPool.ShowDialog()
}

####################################################
########### End functions frm_Menu #################
####################################################



####################################################
########## Functions frm_InfoHostPool ##############
####################################################

function cargarHostPools {
    $cb_ListaHostPools.Items.Clear()
    $hostPools = Get-RdsHostPool -TenantName $global:tenantName

    if ($?) {
        if ($hostPools -is "System.Object") {
            $cb_ListaHostPools.Items.Add($hostPools.HostPoolName)
            $cb_ListaHostPools.Refresh()
            $cb_ListaHostPools.SelectedIndex = 0
            poblarParametrosHostPool $hostPools.HostPoolName
        } elseif ($hostPools -is "System.Array") {
            
            foreach ($hostPool in $hostPools) {
                $cb_ListaHostPools.Items.Add($hostPool.HostPoolName)
            }

            $cb_ListaHostPools.Refresh()
        }
    }
}

function poblarParametrosHostPool($hostPoolName) {
    $hostpool = Get-RdsHostPool -TenantName $global:tenantName -Name $hostPoolName
    
    if ($?) {
        $txt_TenantName.Text = $hostpool.TenantName
        $txt_TenantGroupName.Text = $hostpool.TenantGroupName
        $txt_HostPoolName.Text = $hostpool.HostPoolName
        $txt_FriendlyName.Text = $hostpool.FriendlyName
        $txt_Description.Text = $hostpool.Description
        $txt_Persistent.Text = $hostpool.Persistent
        $txt_CustomRdpProperty.Text = $hostpool.CustomRdpProperty
        $txt_MaxSessionLimit.Text = $hostpool.MaxSessionLimit
        $txt_LoadBalancerType.Text = $hostpool.LoadBalancerType
        $txt_ValidationEnv.Text = $hostpool.ValidationEnv
        $txt_Ring.Text = $hostpool.Ring
    } else {
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener los parámetros del HostPool."
    }
    
}

####################################################
######## End Functions frm_InfoHostPool ############
####################################################



[void]$frm_Main.ShowDialog()
