###################################################
###### Solución para la administración de WVD #####
######      TFM - Diego Andérica Richard      #####
######              ESI - UCLM                #####
###################################################



Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationCore, PresentationFramework
Add-Type -Assembly System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

####################################################
############## Iconos e Imágenes ###################
####################################################

$app_icon     = [System.Drawing.Icon]::ExtractAssociatedIcon(".\resources\app_icon.ico")
$back_image   = [System.Drawing.Image]::FromFile(".\resources\back.ico")

####################################################
############## Iconos e Imágenes ###################
####################################################



####################################################
################### Fuentes ########################
####################################################

$fnt_10Bold    = New-Object System.Drawing.Font("Microsoft Sans Serif", 10, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, 0)
$fnt_14Bold    = New-Object System.Drawing.Font("Microsoft Sans Serif", 14, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, 0)
$fnt_10Regular = New-Object System.Drawing.Font("Microsoft Sans Serif", 10, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, 0)
$fnt_18Bold    = New-Object System.Drawing.Font("Microsoft Sans Serif", 18, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, 0)
$fnt_16Bold    = New-Object System.Drawing.Font("Microsoft Sans Serif", 16, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, 0)
$fnt_12Bold    = New-Object System.Drawing.Font("Microsoft Sans Serif", 12, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, 0)

####################################################
################### Fuentes ########################
####################################################



####################################################
################### frm_Main #######################
####################################################

$frm_Main                                               = New-Object system.Windows.Forms.Form
$frm_Main.ClientSize                                    = New-Object System.Drawing.Size(495, 170)
$frm_Main.Text                                          = "Administración de WVD - Conexión a Azure"
$frm_Main.TopMost                                       = $false
$frm_Main.MaximizeBox                                   = $false
$frm_Main.Name                                          = "frm_Main"
$frm_Main.FormBorderStyle                               = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_Main.Icon                                          = $app_icon

$btn_ConectarAzure                                      = New-Object system.Windows.Forms.Button
$btn_ConectarAzure.Text                                 = "Conectar a Azure"
$btn_ConectarAzure.Size                                 = New-Object System.Drawing.Size(148, 63)
$btn_ConectarAzure.Location                             = New-Object System.Drawing.Point(16, 26)
$btn_ConectarAzure.Font                                 = $fnt_10Bold

$lbl_Titulo                                             = New-Object system.Windows.Forms.Label
$lbl_Titulo.Text                                        = "Herramienta de Administración de WVD"
$lbl_Titulo.AutoSize                                    = $true
$lbl_Titulo.Size                                        = New-Object System.Drawing.Size(624, 286)
$lbl_Titulo.Location                                    = New-Object System.Drawing.Point(20, 16)
$lbl_Titulo.Font                                        = $fnt_14Bold

$gr_AzureConex                                          = New-Object system.Windows.Forms.Groupbox
$gr_AzureConex.Size                                     = New-Object System.Drawing.Size(365, 100)
$gr_AzureConex.Text                                     = "Conexión a Azure"
$gr_AzureConex.Location                                 = New-Object System.Drawing.Point(60, 55)

$gr_Credenciales                                        = New-Object system.Windows.Forms.Groupbox
$gr_Credenciales.Size                                   = New-Object System.Drawing.Size(316, 105)
$gr_Credenciales.Text                                   = "Credenciales"
$gr_Credenciales.Location                               = New-Object System.Drawing.Point(78, 189)

$txt_AppId                                              = New-Object system.Windows.Forms.TextBox
$txt_AppId.Multiline                                    = $false
$txt_AppId.Size                                         = New-Object System.Drawing.Size(183, 20)
$txt_AppId.Enabled                                      = $false
$txt_AppId.Location                                     = New-Object System.Drawing.Point(112,24)
$txt_AppId.Font                                         = $fnt_10Regular

$lbl_AppID                                              = New-Object system.Windows.Forms.Label
$lbl_AppID.Text                                         = "App ID"
$lbl_AppID.AutoSize                                     = $true
$lbl_AppID.Size                                         = New-Object System.Drawing.Size(25, 10)
$lbl_AppID.Location                                     = New-Object System.Drawing.Point(14, 28)
$lbl_AppID.Font                                         = $fnt_10Regular

$txt_Password                                           = New-Object system.Windows.Forms.TextBox
$txt_Password.Multiline                                 = $false
$txt_Password.Size                                      = New-Object System.Drawing.Size(183, 20)
$txt_Password.Enabled                                   = $false
$txt_Password.Location                                  = New-Object System.Drawing.Point(112, 62)
$txt_Password.Font                                      = $fnt_10Regular
$txt_Password.PasswordChar                              = '*'

$lbl_Password                                           = New-Object system.Windows.Forms.Label
$lbl_Password.Text                                      = "Password"
$lbl_Password.AutoSize                                  = $true
$lbl_Password.Size                                      = New-Object System.Drawing.Size(25, 10)
$lbl_Password.Location                                  = New-Object System.Drawing.Point(14, 65)
$lbl_Password.Font                                      = $fnt_10Regular

$btn_Enviar                                             = New-Object system.Windows.Forms.Button
$btn_Enviar.Text                                        = "Enviar"
$btn_Enviar.Size                                        = New-Object System.Drawing.Size(86, 37)
$btn_Enviar.Enabled                                     = $false
$btn_Enviar.Location                                    = New-Object System.Drawing.Point(200, 308)
$btn_Enviar.Font                                        = $fnt_10Bold

$btn_DesconectarAzure                                   = New-Object system.Windows.Forms.Button
$btn_DesconectarAzure.Text                              = "Desconectar de Azure"
$btn_DesconectarAzure.Size                              = New-Object System.Drawing.Size(148, 63)
$btn_DesconectarAzure.Enabled                           = $false
$btn_DesconectarAzure.Location                          = New-Object System.Drawing.Point(200, 26)
$btn_DesconectarAzure.Font                              = $fnt_10Bold

$btn_ConectarAzure.Add_Click( { conectarAzure } )
$btn_DesconectarAzure.Add_Click( { desconectarAzure $true } )
$btn_Enviar.Add_Click( { enviarCredenciales } )

$gr_AzureConex.Controls.AddRange(@($btn_ConectarAzure, $btn_DesconectarAzure))
$gr_Credenciales.Controls.AddRange(@($txt_AppId, $lbl_AppID, $txt_Password, $lbl_Password))
$frm_Main.controls.AddRange(@($lbl_Titulo, $gr_AzureConex, $gr_Credenciales, $btn_Enviar))

####################################################
################ End frm_Main ######################
####################################################



####################################################
################### frm_Menu #######################
####################################################

$frm_Menu                                               = New-Object system.Windows.Forms.Form
$frm_Menu.ClientSize                                    = New-Object System.Drawing.Size(430, 390)
$frm_Menu.FormBorderStyle                               = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_Menu.MaximizeBox                                   = $false
$frm_Menu.Name                                          = "frm_Menu"
$frm_Menu.Text                                          = "Administración de WVD - Menú Principal"
$frm_Menu.Icon                                          = $app_icon

$lbl_MenuPcpal                                          = New-Object System.Windows.Forms.Label
$lbl_MenuPcpal.AutoSize                                 = $true
$lbl_MenuPcpal.Font                                     = $fnt_18Bold
$lbl_MenuPcpal.Location                                 = New-Object System.Drawing.Point(97, 20)
$lbl_MenuPcpal.Name                                     = "lbl_MenuPcpal"
$lbl_MenuPcpal.Size                                     = New-Object System.Drawing.Size(228, 36)
$lbl_MenuPcpal.Text                                     = "Menú Principal"

$lbl_PreguntaMenu                                       = New-Object System.Windows.Forms.Label
$lbl_PreguntaMenu.AutoSize                              = $true
$lbl_PreguntaMenu.Font                                  = $fnt_10Regular
$lbl_PreguntaMenu.Location                              = New-Object System.Drawing.Point(60, 60)
$lbl_PreguntaMenu.Name                                  = "lbl_PreguntaMenu"
$lbl_PreguntaMenu.Size                                  = New-Object System.Drawing.Size(230, 36)
$lbl_PreguntaMenu.Text                                  = "Escoja una de las opciones disponibles..."

$btn_InfoHostPool                                       = New-Object System.Windows.Forms.Button
$btn_InfoHostPool.Location                              = New-Object System.Drawing.Point(95, 110)
$btn_InfoHostPool.Name                                  = "btn_InfoHostPool"
$btn_InfoHostPool.Size                                  = New-Object System.Drawing.Size(235, 100)
$btn_InfoHostPool.Text                                  = "Ver HostPools Disponibles"
$btn_InfoHostPool.UseVisualStyleBackColor               = $true
$btn_InfoHostPool.Font                                  = $fnt_10Bold

$btn_GestionGrupos                                      = New-Object System.Windows.Forms.Button
$btn_GestionGrupos.Location                             = New-Object System.Drawing.Point(95, 240)
$btn_GestionGrupos.Name                                 = "btn_GestionGrupos"
$btn_GestionGrupos.Size                                 = New-Object System.Drawing.Size(235, 100)
$btn_GestionGrupos.Text                                 = "Administrar Grupos de Aplicaciones"
$btn_GestionGrupos.UseVisualStyleBackColor              = $true
$btn_GestionGrupos.Font                                 = $fnt_10Bold

$btn_InfoHostPool.Add_Click( { lanzarVentana $frm_InfoHostPool } )
$btn_GestionGrupos.Add_Click( { $lst_GruposApps.Items.Clear()
                                lanzarVentana $frm_GestionGrupos } )

$frm_Menu.Controls.AddRange(@($lbl_MenuPcpal, $lbl_PreguntaMenu, $btn_InfoHostPool, $btn_GestionGrupos))

####################################################
################# End frm_Menu #####################
####################################################



####################################################
############### frm_InfoHostPool ###################
####################################################

$frm_InfoHostPool                                       = New-Object System.Windows.Forms.Form
$frm_InfoHostPool.ClientSize                            = New-Object System.Drawing.Size(673, 686)
$frm_InfoHostPool.FormBorderStyle                       = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_InfoHostPool.MaximizeBox                           = $false
$frm_InfoHostPool.Name                                  = "frm_InfoHostPool"
$frm_InfoHostPool.Text                                  = "Administración de WVD - Info HostPools"
$frm_InfoHostPool.Icon                                  = $app_icon

$lbl_InfoHostPool                                       = New-Object System.Windows.Forms.Label
$lbl_InfoHostPool.AutoSize                              = $true
$lbl_InfoHostPool.Font                                  = $fnt_16Bold
$lbl_InfoHostPool.Location                              = New-Object System.Drawing.Point(155, 9)
$lbl_InfoHostPool.Name                                  = "lbl_InfoHostPool"
$lbl_InfoHostPool.Size                                  = New-Object System.Drawing.Size(363, 32)
$lbl_InfoHostPool.Text                                  = "Información de HostPools"

$cb_ListaHostPools                                      = New-Object System.Windows.Forms.ComboBox
$cb_ListaHostPools.FormattingEnabled                    = $true
$cb_ListaHostPools.Location                             = New-Object System.Drawing.Point(254, 73)
$cb_ListaHostPools.Name                                 = "cb_ListaHostPools"
$cb_ListaHostPools.Size                                 = New-Object System.Drawing.Size(390, 24)
$cb_ListaHostPools.DropDownStyle                        = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$cb_ListaHostPools.Font                                 = $fnt_10Regular

$lbl_SeleccionHostPool                                  = New-Object System.Windows.Forms.Label
$lbl_SeleccionHostPool.AutoSize                         = $true
$lbl_SeleccionHostPool.Location                         = New-Object System.Drawing.Point(28, 76)
$lbl_SeleccionHostPool.Name                             = "lbl_SeleccionHostPool"
$lbl_SeleccionHostPool.Size                             = New-Object System.Drawing.Size(220, 17)
$lbl_SeleccionHostPool.Text                             = "Seleccione un HostPool Disponible"

$gr_ParametrosHostPool                                  = New-Object System.Windows.Forms.GroupBox
$gr_ParametrosHostPool.Location                         = New-Object System.Drawing.Point(42, 132)
$gr_ParametrosHostPool.Name                             = "gr_ParametrosHostPool"
$gr_ParametrosHostPool.Size                             = New-Object System.Drawing.Size(589, 456)
$gr_ParametrosHostPool.Text                             = "Parámetros del HostPool"

$txt_Ring                                               = New-Object System.Windows.Forms.TextBox
$txt_Ring.Location                                      = New-Object System.Drawing.Point(155, 411)
$txt_Ring.Name                                          = "txt_Ring"
$txt_Ring.Size                                          = New-Object System.Drawing.Size(410, 22)
$txt_Ring.ReadOnly                                      = $true
$txt_Ring.Font                                          = $fnt_10Regular

$lbl_Ring                                               = New-Object System.Windows.Forms.Label
$lbl_Ring.AutoSize                                      = $true
$lbl_Ring.Location                                      = New-Object System.Drawing.Point(112, 414)
$lbl_Ring.Name                                          = "lbl_Ring"
$lbl_Ring.Size                                          = New-Object System.Drawing.Size(37, 17)
$lbl_Ring.Text                                          = "Ring"

$txt_ValidationEnv                                      = New-Object System.Windows.Forms.TextBox
$txt_ValidationEnv.Location                             = New-Object System.Drawing.Point(155, 373)
$txt_ValidationEnv.Name                                 = "txt_ValidationEnv"
$txt_ValidationEnv.Size                                 = New-Object System.Drawing.Size(410, 22)
$txt_ValidationEnv.ReadOnly                             = $true
$txt_ValidationEnv.Font                                 = $fnt_10Regular

$lbl_ValidationEnv                                      = New-Object System.Windows.Forms.Label
$lbl_ValidationEnv.AutoSize                             = $true
$lbl_ValidationEnv.Location                             = New-Object System.Drawing.Point(55, 376)
$lbl_ValidationEnv.Name                                 = "lbl_ValidationEnv"
$lbl_ValidationEnv.Size                                 = New-Object System.Drawing.Size(94, 17)
$lbl_ValidationEnv.Text                                 = "ValidationEnv"

$txt_LoadBalancerType                                   = New-Object System.Windows.Forms.TextBox
$txt_LoadBalancerType.Location                          = New-Object System.Drawing.Point(155, 335)
$txt_LoadBalancerType.Name                              = "txt_LoadBalancerType"
$txt_LoadBalancerType.Size                              = New-Object System.Drawing.Size(410, 22)
$txt_LoadBalancerType.ReadOnly                          = $true
$txt_LoadBalancerType.Font                              = $fnt_10Regular

$lbl_LoadBalancerType                                   = New-Object System.Windows.Forms.Label
$lbl_LoadBalancerType.AutoSize                          = $true
$lbl_LoadBalancerType.Location                          = New-Object System.Drawing.Point(21, 338)
$lbl_LoadBalancerType.Name                              = "lbl_LoadBalancerType"
$lbl_LoadBalancerType.Size                              = New-Object System.Drawing.Size(128, 17)
$lbl_LoadBalancerType.Text                              = "LoadBalancerType"

$txt_MaxSessionLimit                                    = New-Object System.Windows.Forms.TextBox
$txt_MaxSessionLimit.Location                           = New-Object System.Drawing.Point(155, 297)
$txt_MaxSessionLimit.Name                               = "txt_MaxSessionLimit"
$txt_MaxSessionLimit.Size                               = New-Object System.Drawing.Size(410, 22)
$txt_MaxSessionLimit.ReadOnly                           = $true
$txt_MaxSessionLimit.Font                               = $fnt_10Regular

$lbl_MaxSessionLimit                                    = New-Object System.Windows.Forms.Label
$lbl_MaxSessionLimit.AutoSize                           = $true
$lbl_MaxSessionLimit.Location                           = New-Object System.Drawing.Point(37, 300)
$lbl_MaxSessionLimit.Name                               = "lbl_MaxSessionLimit"
$lbl_MaxSessionLimit.Size                               = New-Object System.Drawing.Size(112, 17)
$lbl_MaxSessionLimit.Text                               = "MaxSessionLimit"

$txt_CustomRdpProperty                                  = New-Object System.Windows.Forms.TextBox
$txt_CustomRdpProperty.Location                         = New-Object System.Drawing.Point(155, 260)
$txt_CustomRdpProperty.Name                             = "txt_CustomRdpProperty"
$txt_CustomRdpProperty.Size                             = New-Object System.Drawing.Size(410, 22)
$txt_CustomRdpProperty.ReadOnly                         = $true
$txt_CustomRdpProperty.Font                             = $fnt_10Regular

$lbl_CustomRdpProperty                                  = New-Object System.Windows.Forms.Label
$lbl_CustomRdpProperty.AutoSize                         = $true
$lbl_CustomRdpProperty.Location                         = New-Object System.Drawing.Point(14, 263)
$lbl_CustomRdpProperty.Name                             = "lbl_CustomRdpProperty"
$lbl_CustomRdpProperty.Size                             = New-Object System.Drawing.Size(135, 17)
$lbl_CustomRdpProperty.Text                             = "CustomRdpProperty"

$txt_Persistent                                         = New-Object System.Windows.Forms.TextBox
$txt_Persistent.Location                                = New-Object System.Drawing.Point(155, 221)
$txt_Persistent.Name                                    = "txt_Persistent"
$txt_Persistent.Size                                    = New-Object System.Drawing.Size(410, 22)
$txt_Persistent.ReadOnly                                = $true
$txt_Persistent.Font                                    = $fnt_10Regular

$lbl_Persistent                                         = New-Object System.Windows.Forms.Label
$lbl_Persistent.AutoSize                                = $true
$lbl_Persistent.Location                                = New-Object System.Drawing.Point(78, 224)
$lbl_Persistent.Name                                    = "lbl_Persistent"
$lbl_Persistent.Size                                    = New-Object System.Drawing.Size(71, 17)
$lbl_Persistent.Text                                    = "Persistent"

$txt_Description                                        = New-Object System.Windows.Forms.TextBox
$txt_Description.Location                               = New-Object System.Drawing.Point(155, 182)
$txt_Description.Name                                   = "txt_Description"
$txt_Description.Size                                   = New-Object System.Drawing.Size(410, 22)
$txt_Description.ReadOnly                               = $true
$txt_Description.Font                                   = $fnt_10Regular

$lbl_Description                                        = New-Object System.Windows.Forms.Label
$lbl_Description.AutoSize                               = $true
$lbl_Description.Location                               = New-Object System.Drawing.Point(70, 185)
$lbl_Description.Name                                   = "lbl_Description"
$lbl_Description.Size                                   = New-Object System.Drawing.Size(79, 17)
$lbl_Description.Text                                   = "Description"

$txt_FriendlyName                                       = New-Object System.Windows.Forms.TextBox
$txt_FriendlyName.Location                              = New-Object System.Drawing.Point(155, 144)
$txt_FriendlyName.Name                                  = "txt_FriendlyName"
$txt_FriendlyName.Size                                  = New-Object System.Drawing.Size(410, 22)
$txt_FriendlyName.ReadOnly                              = $true
$txt_FriendlyName.Font                                  = $fnt_10Regular

$lbl_FriendlyName                                       = New-Object System.Windows.Forms.Label
$lbl_FriendlyName.AutoSize                              = $true
$lbl_FriendlyName.Location                              = New-Object System.Drawing.Point(54, 147)
$lbl_FriendlyName.Name                                  = "lbl_FriendlyName"
$lbl_FriendlyName.Size                                  = New-Object System.Drawing.Size(95, 17)
$lbl_FriendlyName.Text                                  = "FriendlyName"

$txt_HostPoolName                                       = New-Object System.Windows.Forms.TextBox
$txt_HostPoolName.Location                              = New-Object System.Drawing.Point(155, 105)
$txt_HostPoolName.Name                                  = "txt_HostPoolName"
$txt_HostPoolName.Size                                  = New-Object System.Drawing.Size(410, 22)
$txt_HostPoolName.ReadOnly                              = $true
$txt_HostPoolName.Font                                  = $fnt_10Regular

$lbl_HostPoolName                                       = New-Object System.Windows.Forms.Label
$lbl_HostPoolName.AutoSize                              = $true
$lbl_HostPoolName.Location                              = New-Object System.Drawing.Point(47, 108)
$lbl_HostPoolName.Name                                  = "lbl_HostPoolName"
$lbl_HostPoolName.Size                                  = New-Object System.Drawing.Size(102, 17)
$lbl_HostPoolName.Text                                  = "HostPoolName"

$txt_TenantGroupName                                    = New-Object System.Windows.Forms.TextBox
$txt_TenantGroupName.Location                           = New-Object System.Drawing.Point(155, 68)
$txt_TenantGroupName.Name                               = "txt_TenantGroupName"
$txt_TenantGroupName.Size                               = New-Object System.Drawing.Size(410, 22)
$txt_TenantGroupName.ReadOnly                           = $true
$txt_TenantGroupName.Font                               = $fnt_10Regular

$txt_TenantName                                         = New-Object System.Windows.Forms.TextBox
$txt_TenantName.Location                                = New-Object System.Drawing.Point(155, 31)
$txt_TenantName.Name                                    = "txt_TenantName"
$txt_TenantName.Size                                    = New-Object System.Drawing.Size(410, 22)
$txt_TenantName.ReadOnly                                = $true
$txt_TenantName.Font                                    = $fnt_10Regular

$lbl_TenantGroupName                                    = New-Object System.Windows.Forms.Label
$lbl_TenantGroupName.AutoSize                           = $true
$lbl_TenantGroupName.Location                           = New-Object System.Drawing.Point(19, 71)
$lbl_TenantGroupName.Name                               = "lbl_TenantGroupName"
$lbl_TenantGroupName.Size                               = New-Object System.Drawing.Size(130, 17)
$lbl_TenantGroupName.Text                               = "TenantGroupName"

$lbl_TenantName                                         = New-Object System.Windows.Forms.Label
$lbl_TenantName.AutoSize                                = $true
$lbl_TenantName.Location                                = New-Object System.Drawing.Point(59, 34)
$lbl_TenantName.Name                                    = "lbl_TenantName"
$lbl_TenantName.Size                                    = New-Object System.Drawing.Size(90, 17)
$lbl_TenantName.Text                                    = "TenantName"

$btn_VolverInfoHostPool                                 = New-Object System.Windows.Forms.Button
$btn_VolverInfoHostPool.Location                        = New-Object System.Drawing.Point(205, 610)
$btn_VolverInfoHostPool.Name                            = "btn_Volver"
$btn_VolverInfoHostPool.Size                            = New-Object System.Drawing.Size(229, 64)
$btn_VolverInfoHostPool.UseVisualStyleBackColor         = $true
$btn_VolverInfoHostPool.Image                           = $back_image
$btn_VolverInfoHostPool.ImageAlign                      = [System.Drawing.ContentAlignment]::MiddleCenter

$frm_InfoHostPool.Add_Load( { cargarHostPools $frm_InfoHostPool $cb_ListaHostPools } )
$btn_VolverInfoHostPool.Add_Click( { cerrarVentana $frm_InfoHostPool } )
$cb_ListaHostPools.Add_SelectedIndexChanged( { poblarParametrosHostPool $cb_ListaHostPools.SelectedItem } )

$gr_ParametrosHostPool.Controls.AddRange(@($txt_Ring,$lbl_Ring, $txt_ValidationEnv, $lbl_ValidationEnv, $txt_LoadBalancerType, $lbl_LoadBalancerType, $txt_MaxSessionLimit, $lbl_MaxSessionLimit, $txt_CustomRdpProperty, $lbl_CustomRdpProperty, $txt_Persistent, $lbl_Persistent, $txt_Description, $lbl_Description, $txt_FriendlyName, $lbl_FriendlyName, $txt_HostPoolName, $lbl_HostPoolName, $txt_TenantGroupName, $txt_TenantName, $lbl_TenantGroupName, $lbl_TenantName))
$frm_InfoHostPool.Controls.AddRange(@($btn_VolverInfoHostPool, $gr_ParametrosHostPool, $lbl_SeleccionHostPool, $cb_ListaHostPools, $lbl_InfoHostPool))

####################################################
############ End frm_InfoHostPool ##################
####################################################



####################################################
############## frm_GestionGrupos ###################
####################################################

$frm_GestionGrupos                                      = New-Object System.Windows.Forms.Form
$frm_GestionGrupos.ClientSize                           = New-Object System.Drawing.Size(885, 620)
$frm_GestionGrupos.FormBorderStyle                      = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_GestionGrupos.MainMenuStrip                        = $mnu_Strip
$frm_GestionGrupos.MaximizeBox                          = $false
$frm_GestionGrupos.Name                                 = "frm_GestionGrupos"
$frm_GestionGrupos.Text                                 = "Administración de WVD - Gestionar Grupos Apps"
$frm_GestionGrupos.Icon                                 = $app_icon


$lbl_TituloGestionGrupos                                = New-Object System.Windows.Forms.Label
$lbl_TituloGestionGrupos.AutoSize                       = $true
$lbl_TituloGestionGrupos.Font                           = $fnt_16Bold
$lbl_TituloGestionGrupos.Location                       = New-Object System.Drawing.Point(240, 9)
$lbl_TituloGestionGrupos.Name                           = "lbl_TituloGestionGrupos"
$lbl_TituloGestionGrupos.Size                           = New-Object System.Drawing.Size(363, 32)
$lbl_TituloGestionGrupos.Text                           = "Gestionar Grupos de Aplicaciones"

$lbl_SeleccionHostPoolGestion                           = New-Object System.Windows.Forms.Label
$lbl_SeleccionHostPoolGestion.AutoSize                  = $true
$lbl_SeleccionHostPoolGestion.Font                      = $fnt_10Regular
$lbl_SeleccionHostPoolGestion.Location                  = New-Object System.Drawing.Point(72, 60)
$lbl_SeleccionHostPoolGestion.Name                      = "lbl_SeleccionHostPoolGestion"
$lbl_SeleccionHostPoolGestion.Size                      = New-Object System.Drawing.Size(268, 20)
$lbl_SeleccionHostPoolGestion.Text                      = "Seleccione un HostPool disponible"

$cb_SeleccionHostPoolGestion                            = New-Object System.Windows.Forms.ComboBox
$cb_SeleccionHostPoolGestion.FormattingEnabled          = $true
$cb_SeleccionHostPoolGestion.Location                   = New-Object System.Drawing.Point(346, 58)
$cb_SeleccionHostPoolGestion.Name                       = "cb_SeleccionHostPoolGestion"
$cb_SeleccionHostPoolGestion.Size                       = New-Object System.Drawing.Size(444, 24)
$cb_SeleccionHostPoolGestion.DropDownStyle              = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$cb_SeleccionHostPoolGestion.Font                       = $fnt_10Regular

$gr_AppsDisponibles                                     = New-Object System.Windows.Forms.GroupBox
$gr_AppsDisponibles.Location                            = New-Object System.Drawing.Point(12, 106)
$gr_AppsDisponibles.Name                                = "gr_AppsDisponibles"
$gr_AppsDisponibles.Size                                = New-Object System.Drawing.Size(543, 285)
$gr_AppsDisponibles.Text                                = "Grupos de Apps Disponibles"

$lst_GruposApps                                         = New-Object System.Windows.Forms.ListBox
$lst_GruposApps.FormattingEnabled                       = $true
$lst_GruposApps.ItemHeight                              = 16
$lst_GruposApps.Location                                = New-Object System.Drawing.Point(6, 21)
$lst_GruposApps.Name                                    = "lst_GruposApps"
$lst_GruposApps.Size                                    = New-Object System.Drawing.Size(531, 260)
$lst_GruposApps.Font                                    = $fnt_10Regular

$btn_CrearGrupoApps                                     = New-Object System.Windows.Forms.Button
$btn_CrearGrupoApps.Location                            = New-Object System.Drawing.Point(55, 414)
$btn_CrearGrupoApps.Name                                = "btn_CrearGrupoApps"
$btn_CrearGrupoApps.Size                                = New-Object System.Drawing.Size(317, 82)
$btn_CrearGrupoApps.Text                                = "Crear nuevo grupo de aplicaciones"
$btn_CrearGrupoApps.UseVisualStyleBackColor             = $true
$btn_CrearGrupoApps.Font                                = $fnt_10Regular

$btn_EliminarGrupoApps                                  = New-Object System.Windows.Forms.Button
$btn_EliminarGrupoApps.Location                         = New-Object System.Drawing.Point(498, 414)
$btn_EliminarGrupoApps.Name                             = "btn_EliminarGrupoApps"
$btn_EliminarGrupoApps.Size                             = New-Object System.Drawing.Size(317, 82)
$btn_EliminarGrupoApps.Text                             = "Eliminar grupo de aplicaciones"
$btn_EliminarGrupoApps.UseVisualStyleBackColor          = $true
$btn_EliminarGrupoApps.Enabled                          = $false
$btn_EliminarGrupoApps.Font                             = $fnt_10Regular

$btn_InfoGrupoApps                                      = New-Object System.Windows.Forms.Button
$btn_InfoGrupoApps.Location                             = New-Object System.Drawing.Point(580, 156)
$btn_InfoGrupoApps.Name                                 = "btn_InfoGrupoApps"
$btn_InfoGrupoApps.Size                                 = New-Object System.Drawing.Size(264, 66)
$btn_InfoGrupoApps.Text                                 = "Ver información del grupo"
$btn_InfoGrupoApps.UseVisualStyleBackColor              = $true
$btn_InfoGrupoApps.Enabled                              = $false
$btn_InfoGrupoApps.Font                                 = $fnt_10Regular

$btn_EditarGrupoApps                                    = New-Object System.Windows.Forms.Button
$btn_EditarGrupoApps.Location                           = New-Object System.Drawing.Point(580, 283)
$btn_EditarGrupoApps.Name                               = "btn_EditarGrupoApps"
$btn_EditarGrupoApps.Size                               = New-Object System.Drawing.Size(264, 66)
$btn_EditarGrupoApps.Text                               = "Editar parámetros del grupo"
$btn_EditarGrupoApps.UseVisualStyleBackColor            = $true
$btn_EditarGrupoApps.Enabled                            = $false
$btn_EditarGrupoApps.Font                               = $fnt_10Regular

$btn_VolverGestionGrupos                                = New-Object System.Windows.Forms.Button
$btn_VolverGestionGrupos.Location                       = New-Object System.Drawing.Point(274, 526)
$btn_VolverGestionGrupos.Name                           = "btn_VolverGestionGrupos"
$btn_VolverGestionGrupos.Size                           = New-Object System.Drawing.Size(317, 79)
$btn_VolverGestionGrupos.Image                          = $back_image
$btn_VolverGestionGrupos.ImageAlign                     = [System.Drawing.ContentAlignment]::MiddleCenter
$btn_VolverGestionGrupos.UseVisualStyleBackColor        = $true
$btn_VolverGestionGrupos.Font                           = $fnt_10Regular

$btn_CrearGrupoApps.Add_Click( { lanzarVentana $frm_CrearGrupo } )
$btn_EliminarGrupoApps.Add_Click( { eliminarGrupo } )
$btn_InfoGrupoApps.Add_Click( { lanzarVentanaInfoGrupo $lst_GruposApps.SelectedItem $false } )
$btn_EditarGrupoApps.Add_Click( { lanzarVentanaInfoGrupo $lst_GruposApps.SelectedItem $true } )
$btn_VolverGestionGrupos.Add_Click( { cerrarVentana $frm_GestionGrupos } )
$lst_GruposApps.Add_MouseDoubleClick( { lanzarVentanaInfoGrupo $lst_GruposApps.SelectedItem $false } )
$lst_GruposApps.Add_SelectedIndexChanged( { comprobarSeleccionListaGruposApps } )
$cb_SeleccionHostPoolGestion.Add_SelectedIndexChanged( { poblarListaGruposApps $cb_SeleccionHostPoolGestion.SelectedItem } )
$frm_GestionGrupos.Add_Load( { cargarHostPools $frm_GestionGrupos $cb_SeleccionHostPoolGestion
                               habilitarBotonesGestionGrupos $false} )

$gr_AppsDisponibles.Controls.AddRange(@($lst_GruposApps))
$frm_GestionGrupos.controls.AddRange(@($lbl_TituloGestionGrupos, $btn_VolverGestionGrupos, $btn_EditarGrupoApps, $btn_InfoGrupoApps, $btn_EliminarGrupoApps, $btn_CrearGrupoApps, $gr_AppsDisponibles, $cb_SeleccionHostPoolGestion, $lbl_SeleccionHostPoolGestion, $mnu_Strip))

####################################################
########### End frm_GestionGrupos ##################
####################################################



####################################################
############## frm_InfoGrupoApps ###################
####################################################

$frm_InfoGrupoApps                                      = New-Object System.Windows.Forms.Form
$frm_InfoGrupoApps.ClientSize                           = New-Object System.Drawing.Size(971, 727)
$frm_InfoGrupoApps.FormBorderStyle                      = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_InfoGrupoApps.MaximizeBox                          = $false
$frm_InfoGrupoApps.Name                                 = "frm_InfoGrupoApps"
$frm_InfoGrupoApps.Text                                 = "Administración de WVD - Info Grupo de Apps"
$frm_InfoGrupoApps.Icon                                 = $app_icon

$lbl_InfoGrupoApps                                      = New-Object System.Windows.Forms.Label
$lbl_InfoGrupoApps.AutoSize                             = $true
$lbl_InfoGrupoApps.Font                                 = $fnt_16Bold
$lbl_InfoGrupoApps.Location                             = New-Object System.Drawing.Point(233, 9)
$lbl_InfoGrupoApps.Name                                 = "lbl_InfoGrupoApps"
$lbl_InfoGrupoApps.Size                                 = New-Object System.Drawing.Size(540, 32)
$lbl_InfoGrupoApps.Text                                 = "Información del Grupo de Aplicaciones"

$gr_ValoresGrupoApps                                    = New-Object System.Windows.Forms.GroupBox
$gr_ValoresGrupoApps.Location                           = New-Object System.Drawing.Point(38, 188)
$gr_ValoresGrupoApps.Name                               = "gr_ValoresGrupoApps"
$gr_ValoresGrupoApps.Size                               = New-Object System.Drawing.Size(409, 313)
$gr_ValoresGrupoApps.Text                               = "Valores del Grupo de Aplicaciones"

$txt_TenantNameGr                                       = New-Object System.Windows.Forms.TextBox
$txt_TenantNameGr.Location                              = New-Object System.Drawing.Point(145, 72)
$txt_TenantNameGr.Name                                  = "txt_TenantNameGr"
$txt_TenantNameGr.ReadOnly                              = $true
$txt_TenantNameGr.Size                                  = New-Object System.Drawing.Size(247, 22)
$txt_TenantNameGr.Font                                  = $fnt_10Regular

$txt_HostPoolNameGr                                     = New-Object System.Windows.Forms.TextBox
$txt_HostPoolNameGr.Location                            = New-Object System.Drawing.Point(145, 112)
$txt_HostPoolNameGr.Name                                = "txt_HostPoolNameGr"
$txt_HostPoolNameGr.ReadOnly                            = $true
$txt_HostPoolNameGr.Size                                = New-Object System.Drawing.Size(247, 22)
$txt_HostPoolNameGr.Font                                = $fnt_10Regular

$txt_AppGroupName                                       = New-Object System.Windows.Forms.TextBox
$txt_AppGroupName.Location                              = New-Object System.Drawing.Point(145, 152)
$txt_AppGroupName.Name                                  = "txt_AppGroupName"
$txt_AppGroupName.ReadOnly                              = $true
$txt_AppGroupName.Size                                  = New-Object System.Drawing.Size(247, 22)
$txt_AppGroupName.Font                                  = $fnt_10Regular

$txt_DescriptionGr                                      = New-Object System.Windows.Forms.TextBox
$txt_DescriptionGr.Location                             = New-Object System.Drawing.Point(145, 192)
$txt_DescriptionGr.Name                                 = "txt_DescriptionGr"
$txt_DescriptionGr.ReadOnly                             = $true
$txt_DescriptionGr.Size                                 = New-Object System.Drawing.Size(247, 22)
$txt_DescriptionGr.Font                                 = $fnt_10Regular

$txt_ResourceType                                       = New-Object System.Windows.Forms.TextBox
$txt_ResourceType.Location                              = New-Object System.Drawing.Point(145, 272)
$txt_ResourceType.Name                                  = "txt_ResourceType"
$txt_ResourceType.ReadOnly                              = $true
$txt_ResourceType.Size                                  = New-Object System.Drawing.Size(247, 22)
$txt_ResourceType.Font                                  = $fnt_10Regular

$txt_FriendlyNameGr                                     = New-Object System.Windows.Forms.TextBox
$txt_FriendlyNameGr.Location                            = New-Object System.Drawing.Point(145, 232)
$txt_FriendlyNameGr.Name                                = "txt_FriendlyNameGr"
$txt_FriendlyNameGr.ReadOnly                            = $true
$txt_FriendlyNameGr.Size                                = New-Object System.Drawing.Size(247, 22)
$txt_FriendlyNameGr.Font                                = $fnt_10Regular

$txt_TenantGrName                                       = New-Object System.Windows.Forms.TextBox
$txt_TenantGrName.Location                              = New-Object System.Drawing.Point(145, 32)
$txt_TenantGrName.Name                                  = "txt_TenantGrName"
$txt_TenantGrName.ReadOnly                              = $true
$txt_TenantGrName.Size                                  = New-Object System.Drawing.Size(247, 22)
$txt_TenantGrName.Font                                  = $fnt_10Regular

$lbl_ResourceType                                       = New-Object System.Windows.Forms.Label
$lbl_ResourceType.AutoSize                              = $true
$lbl_ResourceType.Location                              = New-Object System.Drawing.Point(38, 275)
$lbl_ResourceType.Name                                  = "lbl_ResourceType"
$lbl_ResourceType.Size                                  = New-Object System.Drawing.Size(101, 17)
$lbl_ResourceType.Text                                  = "ResourceType"

$lbl_FriendlyNameGr                                     = New-Object System.Windows.Forms.Label
$lbl_FriendlyNameGr.AutoSize                            = $true
$lbl_FriendlyNameGr.Location                            = New-Object System.Drawing.Point(44, 235)
$lbl_FriendlyNameGr.Name                                = "lbl_FriendlyNameGr"
$lbl_FriendlyNameGr.Size                                = New-Object System.Drawing.Size(95, 17)
$lbl_FriendlyNameGr.Text                                = "FriendlyName"

$lbl_DescriptionGr                                      = New-Object System.Windows.Forms.Label
$lbl_DescriptionGr.AutoSize                             = $true
$lbl_DescriptionGr.Location                             = New-Object System.Drawing.Point(60, 195)
$lbl_DescriptionGr.Name                                 = "lbl_DescriptionGr"
$lbl_DescriptionGr.Size                                 = New-Object System.Drawing.Size(79, 17)
$lbl_DescriptionGr.Text                                 = "Description"

$lbl_AppGroupName                                       = New-Object System.Windows.Forms.Label
$lbl_AppGroupName.AutoSize                              = $true
$lbl_AppGroupName.Location                              = New-Object System.Drawing.Point(29, 155)
$lbl_AppGroupName.Name                                  = "lbl_AppGroupName"
$lbl_AppGroupName.Size                                  = New-Object System.Drawing.Size(110, 17)
$lbl_AppGroupName.Text                                  = "AppGroupName"

$lbl_HostPoolNameGr                                     = New-Object System.Windows.Forms.Label
$lbl_HostPoolNameGr.AutoSize                            = $true
$lbl_HostPoolNameGr.Location                            = New-Object System.Drawing.Point(37, 115)
$lbl_HostPoolNameGr.Name                                = "lbl_HostPoolNameGr"
$lbl_HostPoolNameGr.Size                                = New-Object System.Drawing.Size(102, 17)
$lbl_HostPoolNameGr.Text                                = "HostPoolName"

$lbl_TenantNameGr                                       = New-Object System.Windows.Forms.Label
$lbl_TenantNameGr.AutoSize                              = $true
$lbl_TenantNameGr.Location                              = New-Object System.Drawing.Point(49, 75)
$lbl_TenantNameGr.Name                                  = "lbl_TenantNameGr"
$lbl_TenantNameGr.Size                                  = New-Object System.Drawing.Size(90, 17)
$lbl_TenantNameGr.Text                                  = "TenantName"

$lbl_TenantGrName                                       = New-Object System.Windows.Forms.Label
$lbl_TenantGrName.AutoSize                              = $true
$lbl_TenantGrName.Location                              = New-Object System.Drawing.Point(9, 35)
$lbl_TenantGrName.Name                                  = "lbl_TenantGrName"
$lbl_TenantGrName.Size                                  = New-Object System.Drawing.Size(130, 17)
$lbl_TenantGrName.Text                                  = "TenantGroupName"

$gr_AppsGrupo                                           = New-Object System.Windows.Forms.GroupBox
$gr_AppsGrupo.Location                                  = New-Object System.Drawing.Point(495, 71)
$gr_AppsGrupo.Name                                      = "gr_AppsGrupo"
$gr_AppsGrupo.Size                                      = New-Object System.Drawing.Size(444, 256)
$gr_AppsGrupo.Text                                      = "Aplicaciones del Grupo"

$chcklst_AppsGrupo                                      = New-Object System.Windows.Forms.CheckedListBox
$chcklst_AppsGrupo.Enabled                              = $false
$chcklst_AppsGrupo.FormattingEnabled                    = $true
$chcklst_AppsGrupo.Location                             = New-Object System.Drawing.Point(7, 22)
$chcklst_AppsGrupo.Name                                 = "chcklst_AppsGrupo"
$chcklst_AppsGrupo.Size                                 = New-Object System.Drawing.Size(431, 225)
$chcklst_AppsGrupo.Font                                 = $fnt_10Regular

$gr_UsuariosGrupo                                       = New-Object System.Windows.Forms.GroupBox
$gr_UsuariosGrupo.Location                              = New-Object System.Drawing.Point(495, 354)
$gr_UsuariosGrupo.Name                                  = "gr_UsuariosGrupo"
$gr_UsuariosGrupo.Size                                  = New-Object System.Drawing.Size(444, 256)
$gr_UsuariosGrupo.Text                                  = "Usuarios del Grupo"

$lst_UsuariosGrupo                                      = New-Object System.Windows.Forms.ListBox
$lst_UsuariosGrupo.FormattingEnabled                    = $true
$lst_UsuariosGrupo.ItemHeight                           = 16
$lst_UsuariosGrupo.Location                             = New-Object System.Drawing.Point(6, 21)
$lst_UsuariosGrupo.Name                                 = "lst_UsuariosGrupo"
$lst_UsuariosGrupo.Size                                 = New-Object System.Drawing.Size(432, 228)
$lst_UsuariosGrupo.Font                                 = $fnt_10Regular

$btn_VolverGr                                           = New-Object System.Windows.Forms.Button
$btn_VolverGr.Location                                  = New-Object System.Drawing.Point(342, 631)
$btn_VolverGr.Name                                      = "btn_VolverGr"
$btn_VolverGr.Size                                      = New-Object System.Drawing.Size(287, 76)
$btn_VolverGr.Image                                     = $back_image
$btn_VolverGr.ImageAlign                                = [System.Drawing.ContentAlignment]::MiddleCenter
$btn_VolverGr.UseVisualStyleBackColor                   = $true

$btn_EditarApps                                         = New-Object System.Windows.Forms.Button
$btn_EditarApps.Location                                = New-Object System.Drawing.Point(955, 136)
$btn_EditarApps.Name                                    = "btn_EditarApps"
$btn_EditarApps.Size                                    = New-Object System.Drawing.Size(139, 121)
$btn_EditarApps.Text                                    = "Guardar cambios de aplicaciones"
$btn_EditarApps.UseVisualStyleBackColor                 = $true
$btn_EditarApps.Font                                    = $fnt_10Regular

$btn_AniadirUsuarios                                    = New-Object System.Windows.Forms.Button
$btn_AniadirUsuarios.Location                           = New-Object System.Drawing.Point(955, 371)
$btn_AniadirUsuarios.Name                               = "btn_AniadirUsuarios"
$btn_AniadirUsuarios.Size                               = New-Object System.Drawing.Size(139, 69)
$btn_AniadirUsuarios.Text                               = "Añadir Usuarios"
$btn_AniadirUsuarios.UseVisualStyleBackColor            = $true
$btn_AniadirUsuarios.Font                               = $fnt_10Regular

$btn_SubirCSV                                           = New-Object System.Windows.Forms.Button
$btn_SubirCSV.Location                                  = New-Object System.Drawing.Point(955, 452)
$btn_SubirCSV.Name                                      = "btn_SubirCSV"
$btn_SubirCSV.Size                                      = New-Object System.Drawing.Size(139, 69)
$btn_SubirCSV.Text                                      = "Subir CSV"
$btn_SubirCSV.UseVisualStyleBackColor                   = $true
$btn_SubirCSV.Font                                      = $fnt_10Regular

$btn_EliminarUsuario                                    = New-Object System.Windows.Forms.Button
$btn_EliminarUsuario.Location                           = New-Object System.Drawing.Point(955, 533)
$btn_EliminarUsuario.Name                               = "btn_EliminarUsuario"
$btn_EliminarUsuario.Size                               = New-Object System.Drawing.Size(139, 69)
$btn_EliminarUsuario.Text                               = "Eliminar Usuario"
$btn_EliminarUsuario.UseVisualStyleBackColor            = $true
$btn_EliminarUsuario.Enabled                            = $false
$btn_EliminarUsuario.Font                               = $fnt_10Regular

$btn_VolverGr.Add_Click( { cerrarVentana $frm_InfoGrupoApps } )
$btn_EditarApps.Add_Click( { guardarCambiosAppsGrupo } )
$btn_AniadirUsuarios.Add_Click( { lanzarVentana $frm_AddUsuario } )
$btn_SubirCSV.Add_Click( { addCSV } )
$btn_EliminarUsuario.Add_Click( { eliminarUsuario } )
$lst_UsuariosGrupo.Add_SelectedIndexChanged( { comprobarSeleccionUsuarioGrupo } )
$frm_InfoGrupoApps.Add_Load( { rellenarInfoGrupoApps } )

$gr_UsuariosGrupo.Controls.AddRange(@($lst_UsuariosGrupo))
$gr_AppsGrupo.Controls.AddRange(@($chcklst_AppsGrupo))
$gr_ValoresGrupoApps.Controls.AddRange(@($txt_TenantNameGr, $txt_HostPoolNameGr, $txt_AppGroupName, $txt_DescriptionGr, $txt_ResourceType, $txt_FriendlyNameGr, $txt_TenantGrName, $lbl_ResourceType, $lbl_FriendlyNameGr, $lbl_DescriptionGr, $lbl_AppGroupName, $lbl_HostPoolNameGr, $lbl_TenantNameGr, $lbl_TenantGrName))
$frm_InfoGrupoApps.Controls.AddRange(@($btn_VolverGr, $gr_UsuariosGrupo, $gr_AppsGrupo, $gr_ValoresGrupoApps, $lbl_InfoGrupoApps, $btn_EditarApps, $btn_AniadirUsuarios, $btn_SubirCSV, $btn_EliminarUsuario))

####################################################
############ End frm_InfoGrupoApps #################
####################################################



####################################################
################ frm_AddUsuario ####################
####################################################

$frm_AddUsuario                                         = New-Object System.Windows.Forms.Form
$frm_AddUsuario.ClientSize                              = New-Object System.Drawing.Size(720, 152)
$frm_AddUsuario.FormBorderStyle                         = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_AddUsuario.MaximizeBox                             = $false
$frm_AddUsuario.Name                                    = "frm_AddUsuario"
$frm_AddUsuario.Text                                    = "Añadir Usuario"
$frm_AddUsuario.Icon                                    = $app_icon

$lbl_CorreoUsuario                                      = New-Object System.Windows.Forms.Label
$lbl_CorreoUsuario.AutoSize                             = $true
$lbl_CorreoUsuario.Location                             = New-Object System.Drawing.Point(30, 25)
$lbl_CorreoUsuario.Name                                 = "lbl_CorreoUsuario"
$lbl_CorreoUsuario.Size                                 = New-Object System.Drawing.Size(129, 17)
$lbl_CorreoUsuario.Text                                 = "Correo Electrónico:"

$lbl_NotaAddUsuario                                     = New-Object System.Windows.Forms.Label
$lbl_NotaAddUsuario.Font                                = $fnt_12Bold
$lbl_NotaAddUsuario.Location                            = New-Object System.Drawing.Point(71, 65)
$lbl_NotaAddUsuario.Name                                = "lbl_NotaAddUsuario"
$lbl_NotaAddUsuario.Size                                = New-Object System.Drawing.Size(579, 66)
$lbl_NotaAddUsuario.Text                                = "NOTA: para añadir varios usuarios, separe los correos electrónicos mediante comas."
$lbl_NotaAddUsuario.TextAlign                           = [System.Drawing.ContentAlignment]::MiddleCenter

$txt_CorreosUsuarios                                    = New-Object System.Windows.Forms.TextBox
$txt_CorreosUsuarios.Location                           = New-Object System.Drawing.Point(165, 22)
$txt_CorreosUsuarios.Name                               = "txt_CorreosUsuarios"
$txt_CorreosUsuarios.Size                               = New-Object System.Drawing.Size(402, 22)
$txt_CorreosUsuarios.Font                               = $fnt_10Regular

$btn_AddCorreos                                         = New-Object System.Windows.Forms.Button
$btn_AddCorreos.Location                                = New-Object System.Drawing.Point(598, 12)
$btn_AddCorreos.Name                                    = "btn_AddCorreos"
$btn_AddCorreos.Size                                    = New-Object System.Drawing.Size(96, 38)
$btn_AddCorreos.Text                                    = "Añadir"
$btn_AddCorreos.UseVisualStyleBackColor                 = $true
$btn_AddCorreos.Font                                    = $fnt_10Regular

$btn_AddCorreos.Add_Click( { tratarUsuarios } )

$frm_AddUsuario.add_FormClosing( { $txt_CorreosUsuarios.Text = "" } )

$frm_AddUsuario.Controls.AddRange(@($btn_AddCorreos, $txt_CorreosUsuarios, $lbl_NotaAddUsuario, $lbl_CorreoUsuario))

####################################################
############### End frm_AddUsuario #################
####################################################



####################################################
################# frm_CrearGrupo ###################
####################################################

$frm_CrearGrupo                                         = New-Object System.Windows.Forms.Form
$frm_CrearGrupo.ClientSize                              = New-Object System.Drawing.Size(541, 256)
$frm_CrearGrupo.FormBorderStyle                         = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_CrearGrupo.MaximizeBox                             = $false
$frm_CrearGrupo.Name                                    = "frm_CrearGrupo"
$frm_CrearGrupo.Text                                    = "Administración de WVD - Nuevo Grupo"
$frm_CrearGrupo.Icon                                    = $app_icon

$lbl_NombreNGrupo                                       = New-Object System.Windows.Forms.Label
$lbl_NombreNGrupo.AutoSize                              = $true
$lbl_NombreNGrupo.Location                              = New-Object System.Drawing.Point(90, 39)
$lbl_NombreNGrupo.Name                                  = "lbl_NombreNGrupo"
$lbl_NombreNGrupo.Size                                  = New-Object System.Drawing.Size(62, 17)
$lbl_NombreNGrupo.Text                                  = "Nombre:"

$txt_NombreNGrupo                                       = New-Object System.Windows.Forms.TextBox
$txt_NombreNGrupo.Location                              = New-Object System.Drawing.Point(158, 36)
$txt_NombreNGrupo.Name                                  = "txt_NombreNGrupo"
$txt_NombreNGrupo.Size                                  = New-Object System.Drawing.Size(355, 22)
$txt_NombreNGrupo.TabIndex                              = 1
$txt_NombreNGrupo.Font                                  = $fnt_10Regular

$lbl_DescripciónNGrupo                                  = New-Object System.Windows.Forms.Label
$lbl_DescripciónNGrupo.AutoSize                         = $true
$lbl_DescripciónNGrupo.Location                         = New-Object System.Drawing.Point(66, 70)
$lbl_DescripciónNGrupo.Name                             = "lbl_DescripciónNGrupo"
$lbl_DescripciónNGrupo.Size                             = New-Object System.Drawing.Size(86, 17)
$lbl_DescripciónNGrupo.Text                             = "Descripción:"

$txt_DescripciónNGrupo                                  = New-Object System.Windows.Forms.TextBox
$txt_DescripciónNGrupo.Location                         = New-Object System.Drawing.Point(158, 67)
$txt_DescripciónNGrupo.Name                             = "txt_DescripciónNGrupo"
$txt_DescripciónNGrupo.Size                             = New-Object System.Drawing.Size(355, 22)
$txt_DescripciónNGrupo.TabIndex                         = 2
$txt_DescripciónNGrupo.Font                             = $fnt_10Regular

$lbl_FriendlyNameNGrupo                                 = New-Object System.Windows.Forms.Label
$lbl_FriendlyNameNGrupo.AutoSize                        = $true
$lbl_FriendlyNameNGrupo.Location                        = New-Object System.Drawing.Point(53, 101)
$lbl_FriendlyNameNGrupo.Name                            = "lbl_FriendlyNameNGrupo"
$lbl_FriendlyNameNGrupo.Size                            = New-Object System.Drawing.Size(99, 17)
$lbl_FriendlyNameNGrupo.Text                            = "FriendlyName:"

$txt_FriendlyNameNGrupo                                 = New-Object System.Windows.Forms.TextBox
$txt_FriendlyNameNGrupo.Location                        = New-Object System.Drawing.Point(158, 98)
$txt_FriendlyNameNGrupo.Name                            = "txt_FriendlyNameNGrupo"
$txt_FriendlyNameNGrupo.Size                            = New-Object System.Drawing.Size(355, 22)
$txt_FriendlyNameNGrupo.TabIndex                        = 3
$txt_FriendlyNameNGrupo.Font                            = $fnt_10Regular

$lbl_TipoRecursosNGrupo                                 = New-Object System.Windows.Forms.Label
$lbl_TipoRecursosNGrupo.AutoSize                        = $true
$lbl_TipoRecursosNGrupo.Location                        = New-Object System.Drawing.Point(28, 132)
$lbl_TipoRecursosNGrupo.Name                            = "lbl_TipoRecursosNGrupo"
$lbl_TipoRecursosNGrupo.Size                            = New-Object System.Drawing.Size(124, 17)
$lbl_TipoRecursosNGrupo.Text                            = "Tipo de Recursos:"

$cb_TipoRecursosNGrupo                                  = New-Object System.Windows.Forms.ComboBox
$cb_TipoRecursosNGrupo.FormattingEnabled                = $true
$cb_TipoRecursosNGrupo.Location                         = New-Object System.Drawing.Point(158, 129)
$cb_TipoRecursosNGrupo.Name                             = "cb_TipoRecursosNGrupo"
$cb_TipoRecursosNGrupo.Size                             = New-Object System.Drawing.Size(355, 24)
$cb_TipoRecursosNGrupo.DropDownStyle                    = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$cb_TipoRecursosNGrupo.TabIndex                         = 4
$cb_TipoRecursosNGrupo.Font                             = $fnt_10Regular

$btn_CancelarNGrupo                                     = New-Object System.Windows.Forms.Button
$btn_CancelarNGrupo.Location                            = New-Object System.Drawing.Point(57, 177)
$btn_CancelarNGrupo.Name                                = "btn_CancelarNGrupo"
$btn_CancelarNGrupo.Size                                = New-Object System.Drawing.Size(137, 50)
$btn_CancelarNGrupo.Text                                = "Cancelar"
$btn_CancelarNGrupo.UseVisualStyleBackColor             = $true
$btn_CancelarNGrupo.TabIndex                            = 5
$btn_CancelarNGrupo.Font                                = $fnt_10Regular

$btn_CrearNGrupo                                        = New-Object System.Windows.Forms.Button
$btn_CrearNGrupo.Location                               = New-Object System.Drawing.Point(346, 177)
$btn_CrearNGrupo.Name                                   = "btn_CrearNGrupo"
$btn_CrearNGrupo.Size                                   = New-Object System.Drawing.Size(137, 50)
$btn_CrearNGrupo.Text                                   = "Crear Grupo"
$btn_CrearNGrupo.UseVisualStyleBackColor                = $true
$btn_CrearNGrupo.TabIndex                               = 6
$btn_CrearNGrupo.Font                                   = $fnt_10Regular

$btn_CancelarNGrupo.Add_Click( { cancelarCreacionGrupo } )
$btn_CrearNGrupo.Add_Click( { crearNGrupo } )
$frm_CrearGrupo.Add_Load( { restablecerCamposNGrupo } )

$cb_TipoRecursosNGrupo.Items.AddRange(@("RemoteApp", "Desktop"))
$frm_CrearGrupo.Controls.AddRange(@($btn_CrearNGrupo, $btn_CancelarNGrupo, $cb_TipoRecursosNGrupo, $lbl_TipoRecursosNGrupo, $txt_FriendlyNameNGrupo, $lbl_FriendlyNameNGrupo, $txt_DescripciónNGrupo, $lbl_DescripciónNGrupo, $txt_NombreNGrupo, $lbl_NombreNGrupo))

####################################################
############### End frm_CrearGrupo #################
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

$global:aadContext            = $null
$global:tenantName            = "UCLM"
$global:deploymentURL         = "https://rdbroker.wvd.microsoft.com"
$global:grupoSeleccionado     = $null
$global:hostPoolSeleccionado  = $null
$global:appsActivas           = $null
$global:appsActivasAppName    = $null

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

function lanzarVentana ($ventana) {
    $ventana.ShowDialog()
}

function cargarHostPools ($formulario, $combobox) {
    $combobox.Items.Clear()
    $hostPools = Get-RdsHostPool -TenantName $global:tenantName

    if ($?) {
        if ($hostPools -isnot [system.array]) {
            $combobox.Items.Add($hostPools.HostPoolName)
            $combobox.Refresh()
            $combobox.SelectedIndex = 0

            if ($formulario.Name -eq "frm_InfoHostPool") {
                poblarParametrosHostPool $hostPools.HostPoolName
            } elseif ($formulario.Name -eq "frm_GestionGrupos") {
                poblarListaGruposApps $combobox.SelectedItem
            }
            
        } elseif ($hostPools -is [system.array]) {
            
            foreach ($hostPool in $hostPools) {
                $combobox.Items.Add($hostPool.HostPoolName)
            }

            $combobox.Refresh()
        }
    } else {
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al recuperar la lista de HostPools."
        cerrarVentana $formulario
    }
}

function peticionApps ($accion, $grupo) {
    if ($accion -eq "OBTENER") {
        return Get-RdsRemoteApp -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado
    } elseif ($accion -eq "ELIMINAR_GRUPO") {
        return Get-RdsRemoteApp -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $grupo
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
        generarPopUp "Ok" "Info" "Información" "Se ha iniciado sesión en Azure correctamente."

        habilitarCredenciales $true
    } else {
        generarPopUp "Ok" "Warning" "Ha habido un problema" "Ha habido un problema al intentar conectar con Azure. Inténtelo de nuevo"
        $btn_ConectarAzure.Enabled = $true
    }
        
}

function desconectarAzure ($ventanaMain) {
    if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "¿Desconectar de Azure?") -eq "Yes") {
        Disconnect-AzureAD
        $global:aadContext = $null
        habilitarCredenciales $false
    }
}

function habilitarCredenciales($habilitar) {
    if ($habilitar -eq $true) {
        $btn_ConectarAzure.Enabled = $false
        $btn_DesconectarAzure.Enabled = $true
        $frm_Main.ClientSize = '495, 365'
        $txt_AppId.Enabled = $true
        $txt_Password.Enabled = $true
        $btn_Enviar.Enabled = $true
    } else {
        $btn_ConectarAzure.Enabled = $true
        $btn_DesconectarAzure.Enabled = $false
        $frm_Main.ClientSize = '495, 170'
        $txt_AppId.Enabled = $false
        $txt_Password.Enabled = $false
        $btn_Enviar.Enabled = $false
    }
}

function enviarCredenciales {
    if ($txt_AppId.Text -eq "") {
        generarPopUp "Ok" "Warning" "Aviso" "El campo 'App ID' no puede estar vacío."
    } elseif ($txt_Password.Text -eq "") {
        generarPopUp "Ok" "Warning" "Aviso" "El campo 'Password' no puede estar vacío."
    } else {
        $btn_Enviar.Enabled = $false
        $btn_DesconectarAzure.Enabled = $false

        $creds = New-Object System.Management.Automation.PSCredential($txt_AppId.Text, (ConvertTo-SecureString $txt_Password.Text -AsPlainText -Force))
        Add-RdsAccount -DeploymentUrl $global:deploymentURL -Credential $creds -ServicePrincipal -AadTenantId $global:aadContext.TenantId.Guid

        if ($?){
            generarPopUp "Ok" "Info" "Información" "Se ha enlazado correctamente con el servicio."
            $frm_Main.Dispose()
            lanzarVentana $frm_Menu
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

####################################################
########### End functions frm_Menu #################
####################################################



####################################################
########## Functions frm_InfoHostPool ##############
####################################################

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



####################################################
########## Functions frm_GestionGrupos #############
####################################################

function poblarListaGruposApps ($hostPoolName) {
    $lst_GruposApps.Items.Clear()
    $global:hostPoolSeleccionado = $hostPoolName
    $gruposApps = Get-RdsAppGroup -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado

    if ($?) {
        if ($gruposApps -isnot [system.array]) {
            $lst_GruposApps.Items.Add($gruposApps.AppGroupName)
        } elseif ($gruposApps -is [system.array]) {
            
            foreach ($grupo in $gruposApps) {
                $lst_GruposApps.Items.Add($grupo.AppGroupName)
            }

        }
    } else {
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener los grupos de aplicaciones."
    }

    $lst_GruposApps.Refresh()
    comprobarSeleccionListaGruposApps
}

function lanzarVentanaInfoGrupo ($grupoApps, $editarGrupo) {
    if ($lst_GruposApps.SelectedItems.Count -eq 1) {
        $global:grupoSeleccionado = $grupoApps
        
        habilitarElementosEditarGrupo $editarGrupo

        lanzarVentana $frm_InfoGrupoApps
    }
}

function comprobarSeleccionListaGruposApps {
    if ($lst_GruposApps.SelectedIndex -lt 0) {
        habilitarBotonesGestionGrupos $false
    } else {
        habilitarBotonesGestionGrupos $true
    }
}

function habilitarBotonesGestionGrupos ($habilitar) {
    $btn_InfoGrupoApps.Enabled = $habilitar
    $btn_EditarGrupoApps.Enabled = $habilitar
    $btn_EliminarGrupoApps.Enabled = $habilitar
}

function habilitarElementosEditarGrupo ($habilitar, $tipo) {
    $btn_EditarApps.Visible = $habilitar
    $btn_AniadirUsuarios.Visible = $habilitar
    $btn_SubirCSV.Visible = $habilitar
    $btn_EliminarUsuario.Visible = $habilitar
    $chcklst_AppsGrupo.Enabled = $habilitar
    $lst_UsuariosGrupo.Enabled = $habilitar
    
    if ($habilitar -eq $true) {
        $frm_InfoGrupoApps.ClientSize = '1120, 727'
    } else {
        $frm_InfoGrupoApps.ClientSize = '971, 727'
    }
}

function eliminarGrupo {
    if ($lst_GruposApps.SelectedIndex -ge 0) {
        if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "¿Eliminar grupo seleccionado?") -eq "Yes") {
            eliminarAppsPublicadas "ELIMINAR_GRUPO" $lst_GruposApps.SelectedItem
            Remove-RdsAppGroup -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -Name $lst_GruposApps.SelectedItem

            if ($?) {
                generarPopUp "Ok" "Info" "Información" "Se ha eliminado correctamente el grupo de aplicaciones."

                poblarListaGruposApps $cb_SeleccionHostPoolGestion.SelectedItem
            } else {
                generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al eliminar el grupo de aplicaciones."
            }
        }
    }
}

function eliminarAppsPublicadas ($accion, $grupo) {
    $apps = peticionApps $accion $grupo

    foreach ($app in $apps) {
        Remove-RdsRemoteApp -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $grupo -Name $app.RemoteAppName
    }
}

####################################################
######## End Functions frm_GestionGrupos ###########
####################################################



####################################################
########## Functions frm_InfoGrupoApps #############
####################################################

function rellenarInfoGrupoApps {
    limpiarListasInfoGrupoApps
    obtenerInfoGrupoApps
    obtenerAppsGrupoApps
    obtenerUsuariosGrupoApps
}

function limpiarListasInfoGrupoApps {
    $lst_UsuariosGrupo.Items.Clear()
    $chcklst_AppsGrupo.Items.Clear()
}

function obtenerInfoGrupoApps {
    $infoGrupo = Get-RdsAppGroup -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -Name $global:grupoSeleccionado

    if ($?) {
        poblarInfoGrupoApps $infoGrupo
    } else {
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener la información del grupo de aplicaciones."
        cerrarVentana $frm_InfoGrupoApps
    }
}

function poblarInfoGrupoApps ($infoGrupo) {
    $txt_TenantGrName.Text = $infoGrupo.TenantGroupName
    $txt_TenantNameGr.Text = $infoGrupo.TenantName
    $txt_HostPoolNameGr.Text = $infoGrupo.HostPoolName
    $txt_AppGroupName.Text = $infoGrupo.AppGroupName
    $txt_DescriptionGr.Text = $infoGrupo.Description
    $txt_FriendlyNameGr.Text = $infoGrupo.FriendlyName
    $txt_ResourceType.Text = $infoGrupo.ResourceType

    comprobarTipoRecurso $infoGrupo.ResourceType
}

function comprobarTipoRecurso ($tipo) {
    if ($tipo -eq "Desktop") {
        $btn_EditarApps.Enabled = $false
    } else {
        $btn_EditarApps.Enabled = $true
    }
}

function obtenerAppsGrupoApps {
    if ($txt_ResourceType.Text -eq "Desktop") {
        $chcklst_AppsGrupo.Items.Add("Los grupos de tipo 'Desktop' no son compatibles con apps")
        $chcklst_AppsGrupo.Refresh()
    } else {
        $apps = peticionApps "OBTENER" $null

        if ($?) {
            poblarListaAppsGrupo $apps
        } else {
            generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener las aplicaciones del grupo de aplicaciones."
            cerrarVentana $frm_InfoGrupoApps
        }
    }
}

function poblarListaAppsGrupo ($apps) {
    $global:appsActivasAppName = @()
    
    foreach ($app in $apps) {
        $chcklst_AppsGrupo.Items.Add($app.RemoteAppName, $true)
        $global:appsActivasAppName += ,$app.RemoteAppName
    }
        
    $appsTotales = Get-RdsStartMenuApp -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado

    if ($?) {
        foreach ($app in $appsTotales) {
            if ($app.AppAlias -notin $global:appsActivasAppName) {
                $chcklst_AppsGrupo.Items.Add($app.AppAlias, $false)
            }
        }

        $chcklst_AppsGrupo.Refresh()
    } else {
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener las aplicaciones del grupo de aplicaciones."
        cerrarVentana $frm_InfoGrupoApps
    }
}

function obtenerUsuariosGrupoApps {
    $usuariosGrupo = Get-RdsAppGroupUser -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado
    
    if ($?) {
        poblarListaUsuariosGrupo $usuariosGrupo
    } else {
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener los usuarios del grupo de aplicaciones."
        cerrarVentana $frm_InfoGrupoApps
    }
}

function poblarListaUsuariosGrupo ($usuarios) {
    if ($usuarios -isnot [system.array] -and $usuarios -ne $null) {
        $lst_UsuariosGrupo.Items.Add($usuarios.UserPrincipalName)
    } elseif ($usuarios -is [system.array]) {
        
        foreach ($usuario in $usuarios) {
            $lst_UsuariosGrupo.Items.Add($usuario.UserPrincipalName)
        }

    }

    $lst_UsuariosGrupo.Refresh()
}

function guardarCambiosAppsGrupo {
    if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "¿Guardar cambios realizados en las aplicaciones?") -eq "Yes") {
        $appsSeleccionadas = $chcklst_AppsGrupo.CheckedItems

        foreach ($app in $global:appsActivasAppName) {
            Remove-RdsRemoteApp -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado -Name $app
        }

        foreach ($app in $appsSeleccionadas) {
            New-RdsRemoteApp -TenantName $global:tenantName -HostPoolname $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado -Name $app -AppAlias $app
        }
    }

    rellenarInfoGrupoApps
}

function addUsuarios ($direcciones) {
    foreach ($direccion in $direcciones) {
        if ([bool]($direccion -as [Net.Mail.MailAddress])) {
            Add-RdsAppGroupUser -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado -UserPrincipalName $txt_CorreosUsuarios.Text

            if (-not $?) {
                generarPopUp "Ok" "Error" "Aviso" "Ha ocurrido un error al añadir al usuario " + "$direccion" + "."
            }

        } else {
            generarPopUp "Ok" "Error" "Aviso" "La dirección " + $direccion + " no es una dirección válida y no será tenida en cuenta."
        }
                
    }

    $txt_CorreosUsuarios.Text = ""

    cerrarVentana $frm_AddUsuario
    rellenarInfoGrupoApps
}

function eliminarUsuario {
    if ($lst_UsuariosGrupo.SelectedItem -ne "") {
        if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "Se eliminará el usuario seleccionado. ¿Continuar?") -eq "Yes") {
            Remove-RdsAppGroupUser -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado -UserPrincipalName $lst_UsuariosGrupo.SelectedItem
            
            if ($?) {
                 generarPopUp "Ok" "Info" "Información" "Se ha eliminado correctamente al usuario."
            } else {
                generarPopUp "Ok" "Error" "Aviso" "Ha ocurrido un error al eliminar al usuario."
            }
        }
    }

    rellenarInfoGrupoApps

    if ($lst_UsuariosGrupo.Items.Count -le 0) {
        $btn_EliminarUsuario.Enabled = $false
    }
}

function comprobarSeleccionUsuarioGrupo {
    if ($lst_UsuariosGrupo.SelectedIndex -lt 0) {
        $btn_EliminarUsuario.Enabled = $false
    } else {
        $btn_EliminarUsuario.Enabled = $true
    }
}

function addCSV {
    if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "Al seleccionar un archivo CSV se sobreescribirán los usuarios existentes. ¿Continuar?") -eq "Yes") {
        $direcciones = @()

        $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
        $FileBrowser.filter = "Archivos CSV (*.csv)| *.csv"
        [void]$FileBrowser.ShowDialog()

        if ($FileBrowser.FileName) {
            $usuarios = import-csv $FileBrowser.FileName -Delimiter ";"

            if (!$usuarios) {
                generarPopUp "Ok" "Error" "Aviso" "Ha ocurrido un error al leer el archivo."
            } else {
            
                foreach ($usuario in $usuarios) {
                    $direcciones += ,$usuario.Correo
                }

                eliminarTodosUsuarios

                addUsuarios $direcciones
            }
        }
    }
}

function eliminarTodosUsuarios {
    $direcciones = $lst_UsuariosGrupo.Items


    foreach ($direccion in $direcciones) {
        Remove-RdsAppGroupUser -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado -UserPrincipalName $direccion

        if (!$?) {
            generarPopUp "Ok" "Error" "Aviso" "Ha ocurrido un error al eliminar al usuario " + $direccion + "."
        }
    }
}

####################################################
######## End Functions frm_InfoGrupoApps ###########
####################################################



####################################################
############ Functions frm_AddUsuario ##############
####################################################

function tratarUsuarios {
    if ($txt_CorreosUsuarios.Text -eq "") {
        generarPopUp "Ok" "Warning" "Aviso" "El campo de texto está vacío."        
    } else {
        if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "¿Añadir usuarios?") -eq "Yes") {
            $entrada = $txt_CorreosUsuarios.Text.Replace(" ", "")

            if ($entrada.Contains(",")) {
                $direcciones = $entrada.Text.Split(",")
                addUsuarios $direcciones
            } else {
                addUsuarios $entrada
            }
        }
    }
}

####################################################
########## End Functions frm_AddUsuario ############
####################################################



####################################################
############ Functions frm_CrearGrupo ##############
####################################################

function cancelarCreacionGrupo {
    if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "¿Cancelar creación del grupo?") -eq "Yes") {
        cerrarVentana $frm_CrearGrupo
    }
}

function restablecerCamposNGrupo {
    $txt_NombreNGrupo.Text = ""
    $txt_DescripciónNGrupo.Text = ""
    $txt_FriendlyNameNGrupo.Text = ""
    $cb_TipoRecursosNGrupo.SelectedIndex = 0
}

function crearNGrupo {
    if ($txt_NombreNGrupo.Text -ne "") {
        if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "¿Crear nuevo grupo con los parámetros seleccionados?") -eq "Yes") {
            New-RdsAppGroup -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -Name $txt_NombreNGrupo.Text -Description $txt_DescripciónNGrupo.Text -FriendlyName $txt_FriendlyNameNGrupo.Text -ResourceType $cb_TipoRecursosNGrupo.SelectedItem
            
            if ($?) {
                generarPopUp "OK" "Info" "Información" "El grupo se ha creado correctamente."

                cerrarVentana $frm_CrearGrupo

                poblarListaGruposApps $global:hostPoolSeleccionado
            } else {
                generarPopUp "OK" "Error" "Error" "Ha ocurrido un problema al crear el grupo."
            }
        }
    } else {
        generarPopUp "OK" "Info" "Aviso" "El campo de nombre no puede estar vacío."
    }
}

####################################################
########## End Functions frm_CrearGrupo ############
####################################################



[void]$frm_Main.ShowDialog()
