Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

####################################################
################### frm_Main #######################
####################################################

$frm_Main                                   = New-Object system.Windows.Forms.Form
$frm_Main.ClientSize                        = New-Object System.Drawing.Size(495, 172)
$frm_Main.text                              = "Administraci�n de Usuarios - Conexi�n a Azure"
$frm_Main.TopMost                           = $false
$frm_Main.MaximizeBox                       = $false
$frm_Main.Name                              = "frm_Main"
$frm_Main.FormBorderStyle                   = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_Main.icon                              = "./resources/users.ico"

$btn_ConectarAzure                          = New-Object system.Windows.Forms.Button
$btn_ConectarAzure.text                     = "Conectar a Azure"
$btn_ConectarAzure.width                    = 148
$btn_ConectarAzure.height                   = 63
$btn_ConectarAzure.location                 = New-Object System.Drawing.Point(16,26)
$btn_ConectarAzure.Font                     = 'Microsoft Sans Serif,10,style=Bold'

$lbl_Titulo                                 = New-Object system.Windows.Forms.Label
$lbl_Titulo.text                            = "Herramienta de Gesti�n de Usuarios"
$lbl_Titulo.AutoSize                        = $true
$lbl_Titulo.width                           = 624
$lbl_Titulo.height                          = 286
$lbl_Titulo.location                        = New-Object System.Drawing.Point(46,16)
$lbl_Titulo.Font                            = 'Microsoft Sans Serif,14,style=Bold'

$gr_AzureConex                              = New-Object system.Windows.Forms.Groupbox
$gr_AzureConex.height                       = 102
$gr_AzureConex.width                        = 376
$gr_AzureConex.text                         = "Conexi�n a Azure"
$gr_AzureConex.location                     = New-Object System.Drawing.Point(53,56)

$gr_Credenciales                            = New-Object system.Windows.Forms.Groupbox
$gr_Credenciales.height                     = 105
$gr_Credenciales.width                      = 316
$gr_Credenciales.text                       = "Credenciales"
$gr_Credenciales.location                   = New-Object System.Drawing.Point(78,189)

$txt_AppId                                  = New-Object system.Windows.Forms.TextBox
$txt_AppId.multiline                        = $false
$txt_AppId.width                            = 183
$txt_AppId.height                           = 20
$txt_AppId.enabled                          = $false
$txt_AppId.location                         = New-Object System.Drawing.Point(112,24)
$txt_AppId.Font                             = 'Microsoft Sans Serif,10'

$lbl_AppID                                  = New-Object system.Windows.Forms.Label
$lbl_AppID.text                             = "App ID"
$lbl_AppID.AutoSize                         = $true
$lbl_AppID.width                            = 25
$lbl_AppID.height                           = 10
$lbl_AppID.location                         = New-Object System.Drawing.Point(14,28)
$lbl_AppID.Font                             = 'Microsoft Sans Serif,10'

$txt_Password                               = New-Object system.Windows.Forms.TextBox
$txt_Password.multiline                     = $false
$txt_Password.width                         = 183
$txt_Password.height                        = 20
$txt_Password.enabled                       = $false
$txt_Password.location                      = New-Object System.Drawing.Point(112,62)
$txt_Password.Font                          = 'Microsoft Sans Serif,10'
$txt_Password.PasswordChar                  = '*'

$lbl_Password                               = New-Object system.Windows.Forms.Label
$lbl_Password.text                          = "Password"
$lbl_Password.AutoSize                      = $true
$lbl_Password.width                         = 25
$lbl_Password.height                        = 10
$lbl_Password.location                      = New-Object System.Drawing.Point(14,65)
$lbl_Password.Font                          = 'Microsoft Sans Serif,10'

$btn_Enviar                                 = New-Object system.Windows.Forms.Button
$btn_Enviar.text                            = "Enviar"
$btn_Enviar.width                           = 86
$btn_Enviar.height                          = 37
$btn_Enviar.enabled                         = $false
$btn_Enviar.location                        = New-Object System.Drawing.Point(186,308)
$btn_Enviar.Font                            = 'Microsoft Sans Serif,10,style=Bold'

$btn_DesconectarAzure                       = New-Object system.Windows.Forms.Button
$btn_DesconectarAzure.text                  = "Desconectar de Azure"
$btn_DesconectarAzure.width                 = 148
$btn_DesconectarAzure.height                = 63
$btn_DesconectarAzure.enabled               = $false
$btn_DesconectarAzure.location              = New-Object System.Drawing.Point(200,26)
$btn_DesconectarAzure.Font                  = 'Microsoft Sans Serif,10,style=Bold'

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

$frm_Menu                                               = New-Object system.Windows.Forms.Form
$frm_Menu.ClientSize                                    = New-Object System.Drawing.Size(502, 536)
$frm_Menu.FormBorderStyle                               = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_Menu.MaximizeBox                                   = $false
$frm_Menu.Name                                          = "frm_Menu"
$frm_Menu.Text                                          = "Administraci�n de WVD - Men� Principal"

$lbl_MenuPcpal                                          = New-Object System.Windows.Forms.Label
$lbl_MenuPcpal.AutoSize                                 = $true
$lbl_MenuPcpal.Font                                     = New-Object System.Drawing.Font("Microsoft Sans Serif", 18,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)
$lbl_MenuPcpal.Location                                 = New-Object System.Drawing.Point(130, 20)
$lbl_MenuPcpal.Name                                     = "lbl_MenuPcpal"
$lbl_MenuPcpal.Size                                     = New-Object System.Drawing.Size(228, 36)
$lbl_MenuPcpal.Text                                     = "Men� Principal"

$btn_InfoHostPool                                       = New-Object System.Windows.Forms.Button
$btn_InfoHostPool.Location                              = New-Object System.Drawing.Point(130, 94)
$btn_InfoHostPool.Name                                  = "btn_InfoHostPool"
$btn_InfoHostPool.Size                                  = New-Object System.Drawing.Size(235, 102)
$btn_InfoHostPool.Text                                  = "Ver HostPools Disponibles"
$btn_InfoHostPool.UseVisualStyleBackColor               = $true
$btn_InfoHostPool.Font                                  = New-Object System.Drawing.Font("Microsoft Sans Serif", 10,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$btn_GestionGrupos                                      = New-Object System.Windows.Forms.Button
$btn_GestionGrupos.Location                             = New-Object System.Drawing.Point(136, 217)
$btn_GestionGrupos.Name                                 = "btn_GestionGrupos"
$btn_GestionGrupos.Size                                 = New-Object System.Drawing.Size(231, 102)
$btn_GestionGrupos.Text                                 = "Gestionar Grupos de Aplicaciones"
$btn_GestionGrupos.UseVisualStyleBackColor              = $true
$btn_GestionGrupos.Font                                 = New-Object System.Drawing.Font("Microsoft Sans Serif", 10,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$frm_Menu.Controls.AddRange(@($lbl_MenuPcpal,$btn_InfoHostPool,$btn_GestionGrupos))

$btn_InfoHostPool.Add_Click({ lanzarVentana $frm_InfoHostPool })
$btn_GestionGrupos.Add_Click( { lanzarVentana $frm_GestionGrupos } )

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
$frm_InfoHostPool.Text                                  = "Administraci�n de WVD - Info HostPools"

$lbl_InfoHostPool                                       = New-Object System.Windows.Forms.Label
$lbl_InfoHostPool.AutoSize                              = $true
$lbl_InfoHostPool.Font                                  = New-Object System.Drawing.Font("Microsoft Sans Serif", 16.2,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)
$lbl_InfoHostPool.Location                              = New-Object System.Drawing.Point(155, 9)
$lbl_InfoHostPool.Name                                  = "lbl_InfoHostPool"
$lbl_InfoHostPool.Size                                  = New-Object System.Drawing.Size(363, 32)
$lbl_InfoHostPool.Text                                  = "Informaci�n de HostPools"

$cb_ListaHostPools                                      = New-Object System.Windows.Forms.ComboBox
$cb_ListaHostPools.FormattingEnabled                    = $true
$cb_ListaHostPools.Location                             = New-Object System.Drawing.Point(254, 73)
$cb_ListaHostPools.Name                                 = "cb_ListaHostPools"
$cb_ListaHostPools.Size                                 = New-Object System.Drawing.Size(390, 24)
$cb_ListaHostPools.DropDownStyle                        = [System.Windows.Forms.ComboBoxStyle]::DropDownList

$lbl_SeleccionHostPool                                  = New-Object System.Windows.Forms.Label
$lbl_SeleccionHostPool.AutoSize                         = $true
$lbl_SeleccionHostPool.Location                         = New-Object System.Drawing.Point(28, 76)
$lbl_SeleccionHostPool.Name                             = "lbl_SeleccionHostPool"
$lbl_SeleccionHostPool.Size                             = New-Object System.Drawing.Size(220, 17)
$lbl_SeleccionHostPool.Text                             = "Selecciona un HostPool Disponible"

$gr_ParametrosHostPool                                  = New-Object System.Windows.Forms.GroupBox
$gr_ParametrosHostPool.Location                         = New-Object System.Drawing.Point(42, 132)
$gr_ParametrosHostPool.Name                             = "gr_ParametrosHostPool"
$gr_ParametrosHostPool.Size                             = New-Object System.Drawing.Size(589, 456)
$gr_ParametrosHostPool.TabStop                          = $false
$gr_ParametrosHostPool.Text                             = "Par�metros del HostPool"

$txt_Ring                                               = New-Object System.Windows.Forms.TextBox
$txt_Ring.Location                                      = New-Object System.Drawing.Point(155, 411)
$txt_Ring.Name                                          = "txt_Ring"
$txt_Ring.Size                                          = New-Object System.Drawing.Size(410, 22)
$txt_Ring.ReadOnly                                      = $true

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

$txt_TenantName                                         = New-Object System.Windows.Forms.TextBox
$txt_TenantName.Location                                = New-Object System.Drawing.Point(155, 31)
$txt_TenantName.Name                                    = "txt_TenantName"
$txt_TenantName.Size                                    = New-Object System.Drawing.Size(410, 22)
$txt_TenantName.ReadOnly                                = $true

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
$btn_VolverInfoHostPool.Text                            = "Volver"
$btn_VolverInfoHostPool.UseVisualStyleBackColor         = $true

$gr_ParametrosHostPool.Controls.AddRange(@($txt_Ring,$lbl_Ring,$txt_ValidationEnv,$lbl_ValidationEnv,$txt_LoadBalancerType,$lbl_LoadBalancerType,$txt_MaxSessionLimit,$lbl_MaxSessionLimit,$txt_CustomRdpProperty,$lbl_CustomRdpProperty,$txt_Persistent,$lbl_Persistent,$txt_Description,$lbl_Description,$txt_FriendlyName,$lbl_FriendlyName,$txt_HostPoolName,$lbl_HostPoolName,$txt_TenantGroupName,$txt_TenantName,$lbl_TenantGroupName,$lbl_TenantName))

$frm_InfoHostPool.Controls.AddRange(@($btn_VolverInfoHostPool,$gr_ParametrosHostPool,$lbl_SeleccionHostPool,$cb_ListaHostPools,$lbl_InfoHostPool))

$frm_InfoHostPool.Add_Load( { cargarHostPools $frm_InfoHostPool $cb_ListaHostPools } )
$btn_VolverInfoHostPool.Add_Click( { cerrarVentana $frm_InfoHostPool } )
$cb_ListaHostPools.Add_SelectedIndexChanged( { poblarParametrosHostPool $cb_ListaHostPools.SelectedItem.ToString() } )

####################################################
############ End frm_InfoHostPool ##################
####################################################



####################################################
############## frm_GestionGrupos ###################
####################################################

$frm_GestionGrupos                                      = New-Object System.Windows.Forms.Form
$frm_GestionGrupos.ClientSize                           = New-Object System.Drawing.Size(885, 621)
$frm_GestionGrupos.FormBorderStyle                      = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$frm_GestionGrupos.MainMenuStrip                        = $mnu_Strip
$frm_GestionGrupos.MaximizeBox                          = $false
$frm_GestionGrupos.Name                                 = "frm_GestionGrupos"
$frm_GestionGrupos.Text                                 = "Administraci�n de WVD - Gestionar Grupos Apps"

$mnu_Strip                                              = New-Object System.Windows.Forms.MenuStrip
$mnu_Strip.ImageScalingSize                             = New-Object System.Drawing.Size(20, 20)
$mnu_Strip.Location                                     = New-Object System.Drawing.Point(0, 0)
$mnu_Strip.Name                                         = "mnu_Strip"
$mnu_Strip.Size                                         = New-Object System.Drawing.Size(885, 28)
$mnu_Strip.Text                                         = "menuStrip"

$mnuItem_CerrarVentana                                  = New-Object System.Windows.Forms.ToolStripMenuItem
$mnuItem_CerrarVentana.Name                             = "mnuItem_CerrarVentana"
$mnuItem_CerrarVentana.Size                             = New-Object System.Drawing.Size(224, 26)
$mnuItem_CerrarVentana.Text                             = "Cerrar Ventana"

$mnu_Archivo                                            = New-Object System.Windows.Forms.ToolStripMenuItem
$mnu_Archivo.Name                                       = "mnu_Archivo"
$mnu_Archivo.Size                                       = New-Object System.Drawing.Size(73, 24)
$mnu_Archivo.Text                                       = "Archivo"

$lbl_SeleccionHostPoolGestion                           = New-Object System.Windows.Forms.Label
$lbl_SeleccionHostPoolGestion.AutoSize                  = $true
$lbl_SeleccionHostPoolGestion.Font                      = New-Object System.Drawing.Font("Microsoft Sans Serif", 10.2,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point, 0)
$lbl_SeleccionHostPoolGestion.Location                  = New-Object System.Drawing.Point(102, 53)
$lbl_SeleccionHostPoolGestion.Name                      = "lbl_SeleccionHostPoolGestion"
$lbl_SeleccionHostPoolGestion.Size                      = New-Object System.Drawing.Size(268, 20)
$lbl_SeleccionHostPoolGestion.Text                      = "Selecciona un HostPool disponible"

$cb_SeleccionHostPoolGestion                            = New-Object System.Windows.Forms.ComboBox
$cb_SeleccionHostPoolGestion.FormattingEnabled          = $true
$cb_SeleccionHostPoolGestion.Location                   = New-Object System.Drawing.Point(376, 51)
$cb_SeleccionHostPoolGestion.Name                       = "cb_SeleccionHostPoolGestion"
$cb_SeleccionHostPoolGestion.Size                       = New-Object System.Drawing.Size(444, 24)
$cb_SeleccionHostPoolGestion.DropDownStyle              = [System.Windows.Forms.ComboBoxStyle]::DropDownList

$gr_AppsDisponibles                                     = New-Object System.Windows.Forms.GroupBox
$gr_AppsDisponibles.Location                            = New-Object System.Drawing.Point(12, 99)
$gr_AppsDisponibles.Name                                = "gr_AppsDisponibles"
$gr_AppsDisponibles.Size                                = New-Object System.Drawing.Size(543, 280)
$gr_AppsDisponibles.TabStop                             = $false
$gr_AppsDisponibles.Text                                = "Grupos de Apps Disponibles"

$lst_GruposApps                                         = New-Object System.Windows.Forms.ListBox
$lst_GruposApps.FormattingEnabled                       = $true
$lst_GruposApps.ItemHeight                              = 16
$lst_GruposApps.Location                                = New-Object System.Drawing.Point(6, 21)
$lst_GruposApps.Name                                    = "lst_GruposApps"
$lst_GruposApps.Size                                    = New-Object System.Drawing.Size(531, 260)
$lst_GruposApps.Font                                    = New-Object System.Drawing.Font("Microsoft Sans Serif", 12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point, 0)

$btn_CrearGrupoApps                                     = New-Object System.Windows.Forms.Button
$btn_CrearGrupoApps.Location                            = New-Object System.Drawing.Point(83, 407)
$btn_CrearGrupoApps.Name                                = "btn_CrearGrupoApps"
$btn_CrearGrupoApps.Size                                = New-Object System.Drawing.Size(317, 82)
$btn_CrearGrupoApps.Text                                = "Crear nuevo grupo de aplicaciones"
$btn_CrearGrupoApps.UseVisualStyleBackColor             = $true

$btn_EliminarGrupoApps                                  = New-Object System.Windows.Forms.Button
$btn_EliminarGrupoApps.Location                         = New-Object System.Drawing.Point(523, 407)
$btn_EliminarGrupoApps.Name                             = "btn_EliminarGrupoApps"
$btn_EliminarGrupoApps.Size                             = New-Object System.Drawing.Size(317, 82)
$btn_EliminarGrupoApps.Text                             = "Eliminar grupo de aplicaciones"
$btn_EliminarGrupoApps.UseVisualStyleBackColor          = $true
$btn_EliminarGrupoApps.Enabled                          = $false

$btn_InfoGrupoApps                                      = New-Object System.Windows.Forms.Button
$btn_InfoGrupoApps.Location                             = New-Object System.Drawing.Point(600, 149)
$btn_InfoGrupoApps.Name                                 = "btn_InfoGrupoApps"
$btn_InfoGrupoApps.Size                                 = New-Object System.Drawing.Size(264, 66)
$btn_InfoGrupoApps.Text                                 = "Ver informaci�n del grupo"
$btn_InfoGrupoApps.UseVisualStyleBackColor              = $true
$btn_InfoGrupoApps.Enabled                              = $false

$btn_EditarGrupoApps                                    = New-Object System.Windows.Forms.Button
$btn_EditarGrupoApps.Location                           = New-Object System.Drawing.Point(600, 276)
$btn_EditarGrupoApps.Name                               = "btn_EditarGrupoApps"
$btn_EditarGrupoApps.Size                               = New-Object System.Drawing.Size(264, 66)
$btn_EditarGrupoApps.Text                               = "Editar par�metros del grupo"
$btn_EditarGrupoApps.UseVisualStyleBackColor            = $true
$btn_EditarGrupoApps.Enabled                            = $false

$btn_VolverGestionGrupos                                = New-Object System.Windows.Forms.Button
$btn_VolverGestionGrupos.Location                       = New-Object System.Drawing.Point(304, 519)
$btn_VolverGestionGrupos.Name                           = "btn_VolverGestionGrupos"
$btn_VolverGestionGrupos.Size                           = New-Object System.Drawing.Size(317, 79)
$btn_VolverGestionGrupos.Text                           = "Volver"
$btn_VolverGestionGrupos.UseVisualStyleBackColor        = $true

$mnu_Strip.Items.AddRange(@($mnu_Archivo))
$mnu_Archivo.DropDownItems.AddRange(@($mnuItem_CerrarVentana))
$gr_AppsDisponibles.Controls.AddRange(@($lst_GruposApps))
$frm_GestionGrupos.controls.AddRange(@($btn_VolverGestionGrupos,$btn_EditarGrupoApps,$btn_InfoGrupoApps,$btn_EliminarGrupoApps,$btn_CrearGrupoApps,$gr_AppsDisponibles,$cb_SeleccionHostPoolGestion,$lbl_SeleccionHostPoolGestion,$mnu_Strip))

$mnuItem_CerrarVentana.Add_Click( { preguntaSalir $frm_GestionGrupos } )
$btn_CrearGrupoApps.Add_Click( {  } )
$btn_EliminarGrupoApps.Add_Click( {  } )
$btn_InfoGrupoApps.Add_Click( { lanzarVentanaInfoGrupo $lst_GruposApps.SelectedItem $false } )
$btn_EditarGrupoApps.Add_Click( { lanzarVentanaInfoGrupo $lst_GruposApps.SelectedItem $true } )
$btn_VolverGestionGrupos.Add_Click( { preguntaSalir $frm_GestionGrupos } )
$lst_GruposApps.Add_MouseDoubleClick( { lanzarVentanaInfoGrupo $lst_GruposApps.SelectedItem $false } )
$lst_GruposApps.Add_SelectedIndexChanged( { comprobarSeleccionListaGruposApps } )

$frm_GestionGrupos.Add_Load( { cargarHostPools $frm_GestionGrupos $cb_SeleccionHostPoolGestion 
                               habilitarBotonesGestionGrupos $false} )
$cb_SeleccionHostPoolGestion.Add_SelectedIndexChanged( { poblarListaGruposApps $cb_SeleccionHostPoolGestion.SelectedItem.ToString() } )

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
$frm_InfoGrupoApps.Text                                 = "Administraci�n de WVD - Info Grupo de Apps"

$lbl_InfoGrupoApps                                      = New-Object System.Windows.Forms.Label
$lbl_InfoGrupoApps.AutoSize                             = $true
$lbl_InfoGrupoApps.Font                                 = New-Object System.Drawing.Font("Microsoft Sans Serif", 16.2,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)
$lbl_InfoGrupoApps.Location                             = New-Object System.Drawing.Point(233, 9)
$lbl_InfoGrupoApps.Name                                 = "lbl_InfoGrupoApps"
$lbl_InfoGrupoApps.Size                                 = New-Object System.Drawing.Size(540, 32)
$lbl_InfoGrupoApps.Text                                 = "Informaci�n del Grupo de Aplicaciones"

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

$txt_HostPoolNameGr                                     = New-Object System.Windows.Forms.TextBox
$txt_HostPoolNameGr.Location                            = New-Object System.Drawing.Point(145, 112)
$txt_HostPoolNameGr.Name                                = "txt_HostPoolNameGr"
$txt_HostPoolNameGr.ReadOnly                            = $true
$txt_HostPoolNameGr.Size                                = New-Object System.Drawing.Size(247, 22)

$txt_AppGroupName                                       = New-Object System.Windows.Forms.TextBox
$txt_AppGroupName.Location                              = New-Object System.Drawing.Point(145, 152)
$txt_AppGroupName.Name                                  = "txt_AppGroupName"
$txt_AppGroupName.ReadOnly                              = $true
$txt_AppGroupName.Size                                  = New-Object System.Drawing.Size(247, 22)

$txt_DescriptionGr                                      = New-Object System.Windows.Forms.TextBox
$txt_DescriptionGr.Location                             = New-Object System.Drawing.Point(145, 192)
$txt_DescriptionGr.Name                                 = "txt_DescriptionGr"
$txt_DescriptionGr.ReadOnly                             = $true
$txt_DescriptionGr.Size                                 = New-Object System.Drawing.Size(247, 22)

$txt_ResourceType                                       = New-Object System.Windows.Forms.TextBox
$txt_ResourceType.Location                              = New-Object System.Drawing.Point(145, 272)
$txt_ResourceType.Name                                  = "txt_ResourceType"
$txt_ResourceType.ReadOnly                              = $true
$txt_ResourceType.Size                                  = New-Object System.Drawing.Size(247, 22)

$txt_FriendlyNameGr                                     = New-Object System.Windows.Forms.TextBox
$txt_FriendlyNameGr.Location                            = New-Object System.Drawing.Point(145, 232)
$txt_FriendlyNameGr.Name                                = "txt_FriendlyNameGr"
$txt_FriendlyNameGr.ReadOnly                            = $true
$txt_FriendlyNameGr.Size                                = New-Object System.Drawing.Size(247, 22)

$txt_TenantGrName                                       = New-Object System.Windows.Forms.TextBox
$txt_TenantGrName.Location                              = New-Object System.Drawing.Point(145, 32)
$txt_TenantGrName.Name                                  = "txt_TenantGrName"
$txt_TenantGrName.ReadOnly                              = $true
$txt_TenantGrName.Size                                  = New-Object System.Drawing.Size(247, 22)

$lbl_ResourceType                                       = New-Object System.Windows.Forms.Label
$lbl_ResourceType.AutoSize                              = $true
$lbl_ResourceType.Location                              = New-Object System.Drawing.Point(38, 275)
$lbl_ResourceType.Name                                  = "lbl_ResourceType"
$lbl_ResourceType.Size                                  = New-Object System.Drawing.Size(101, 17)
$lbl_ResourceType.Text = "ResourceType"

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

$gr_UsuariosGrupo                                       = New-Object System.Windows.Forms.GroupBox
$gr_UsuariosGrupo.Location                              = New-Object System.Drawing.Point(495, 354)
$gr_UsuariosGrupo.Name                                  = "gr_UsuariosGrupo"
$gr_UsuariosGrupo.Size                                  = New-Object System.Drawing.Size(444, 256)
$gr_UsuariosGrupo.TabStop                               = $false
$gr_UsuariosGrupo.Text                                  = "Usuarios del Grupo"

$lst_UsuariosGrupo                                      = New-Object System.Windows.Forms.ListBox
$lst_UsuariosGrupo.FormattingEnabled                    = $true
$lst_UsuariosGrupo.ItemHeight                           = 16
$lst_UsuariosGrupo.Location                             = New-Object System.Drawing.Point(6, 21)
$lst_UsuariosGrupo.Name                                 = "lst_UsuariosGrupo"
$lst_UsuariosGrupo.Size                                 = New-Object System.Drawing.Size(432, 228)

$btn_VolverGr                                           = New-Object System.Windows.Forms.Button
$btn_VolverGr.Location                                  = New-Object System.Drawing.Point(342, 631)
$btn_VolverGr.Name                                      = "btn_VolverGr"
$btn_VolverGr.Size                                      = New-Object System.Drawing.Size(287, 76)
$btn_VolverGr.Text                                      = "Volver"
$btn_VolverGr.UseVisualStyleBackColor                   = $true

$btn_EditarApps                                         = New-Object System.Windows.Forms.Button
$btn_EditarApps.Location                                = New-Object System.Drawing.Point(955, 136)
$btn_EditarApps.Name                                    = "btn_EditarApps"
$btn_EditarApps.Size                                    = New-Object System.Drawing.Size(139, 121)
$btn_EditarApps.Text                                    = "Guardar cambios de aplicaciones"
$btn_EditarApps.UseVisualStyleBackColor                 = $true

$btn_AniadirUsuarios                                    = New-Object System.Windows.Forms.Button
$btn_AniadirUsuarios.Location                           = New-Object System.Drawing.Point(955, 371)
$btn_AniadirUsuarios.Name                               = "btn_AniadirUsuarios"
$btn_AniadirUsuarios.Size                               = New-Object System.Drawing.Size(139, 69)
$btn_AniadirUsuarios.Text                               = "A�adir Usuarios"
$btn_AniadirUsuarios.UseVisualStyleBackColor            = $true

$btn_SubirCSV                                           = New-Object System.Windows.Forms.Button
$btn_SubirCSV.Location                                  = New-Object System.Drawing.Point(955, 452)
$btn_SubirCSV.Name                                      = "btn_SubirCSV"
$btn_SubirCSV.Size                                      = New-Object System.Drawing.Size(139, 69)
$btn_SubirCSV.Text                                      = "Subir CSV"
$btn_SubirCSV.UseVisualStyleBackColor                   = $true

$btn_EliminarUsuario                                    = New-Object System.Windows.Forms.Button
$btn_EliminarUsuario.Location                           = New-Object System.Drawing.Point(955, 533)
$btn_EliminarUsuario.Name                               = "btn_EliminarUsuario"
$btn_EliminarUsuario.Size                               = New-Object System.Drawing.Size(139, 69)
$btn_EliminarUsuario.Text                               = "Eliminar Usuario"
$btn_EliminarUsuario.UseVisualStyleBackColor            = $true

$gr_UsuariosGrupo.Controls.AddRange(@($lst_UsuariosGrupo))
$gr_AppsGrupo.Controls.AddRange(@($chcklst_AppsGrupo))
$gr_ValoresGrupoApps.Controls.AddRange(@($txt_TenantNameGr,$txt_HostPoolNameGr,$txt_AppGroupName,$txt_DescriptionGr,$txt_ResourceType,$txt_FriendlyNameGr,$txt_TenantGrName,$lbl_ResourceType,$lbl_FriendlyNameGr,$lbl_DescriptionGr,$lbl_AppGroupName,$lbl_HostPoolNameGr,$lbl_TenantNameGr,$lbl_TenantGrName))
$frm_InfoGrupoApps.Controls.AddRange(@($btn_VolverGr,$gr_UsuariosGrupo,$gr_AppsGrupo,$gr_ValoresGrupoApps,$lbl_InfoGrupoApps,$btn_EditarApps,$btn_AniadirUsuarios,$btn_SubirCSV,$btn_EliminarUsuario))

$btn_VolverGr.Add_Click( { cerrarVentana $frm_InfoGrupoApps } )

$frm_InfoGrupoApps.Add_Load( { rellenarInfoGrupoApps } )

####################################################
############ End frm_InfoGrupoApps #################
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
        if ((generarPopUp "SiNo" "Pregunta" "Confirmar" "�Desconectar de Azure?") -eq "Yes") {
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
    if ((generarPopUp "SiNo" "Warning" "Aviso" "Se perder�n todos los cambios no guardados. �Continuar?") -eq "Yes") {
        desconectarAzure $false
        cerrarVentana $ventana
    }
}

function lanzarVentana ($ventana) {
    $ventana.ShowDialog()
}

function cargarHostPools ($formulario,$combobox) {
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
                poblarListaGruposApps $combobox.SelectedItem.ToString()
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
        generarPopUp "Ok" "Info" "Informaci�n" "Se ha iniciado sesi�n en Azure correctamente."

        habilitarCredenciales $true
    } else {
        generarPopUp "Ok" "Warning" "Ha habido un problema" "Ha habido un problema al intentar conectar con Azure. Int�ntelo de nuevo"
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
        generarPopUp "Ok" "Warning" "Aviso" "El campo 'App ID' no puede estar vac�o"
    } elseif ($txt_Password.Text -eq "") {
        generarPopUp "Ok" "Warning" "Aviso" "El campo 'Password' no puede estar vac�o"
    } else {
        $btn_Enviar.Enabled = $false
        $btn_DesconectarAzure.Enabled = $false

        $creds = New-Object System.Management.Automation.PSCredential($txt_AppId.Text, (ConvertTo-SecureString $txt_Password.Text -AsPlainText -Force))
        Add-RdsAccount -DeploymentUrl $global:deploymentURL -Credential $creds -ServicePrincipal -AadTenantId $global:aadContext.TenantId.Guid

        if ($?){
            generarPopUp "Ok" "Info" "Informaci�n" "Se ha enlazado correctamente con el servicio."
            $frm_Main.Dispose()
            lanzarVentana $frm_Menu
        } else {
            generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al enlazar con el servicio. Compruebe las credenciales e int�ntelo de nuevo."
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
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener los par�metros del HostPool."
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
}

function lanzarVentanaInfoGrupo ($grupoApps,$editarGrupo) {
    if ($lst_GruposApps.SelectedItems.Count -eq 1) {
        habilitarElementosEditarGrupo $editarGrupo

        $global:grupoSeleccionado = $grupoApps

        $frm_InfoGrupoApps.ShowDialog()
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

function habilitarElementosEditarGrupo ($habilitar) {
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
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener la informaci�n del grupo de aplicaciones."
        $frm_InfoGrupoApps.Close()
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
}

function obtenerAppsGrupoApps {
    if ($txt_ResourceType.Text -eq "Desktop") {
        $chcklst_AppsGrupo.Items.Add("Los grupos de tipo 'Desktop' no son compatibles con apps")
        $chcklst_AppsGrupo.Refresh()
    } else {
        $apps = Get-RdsRemoteApp -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado

        if ($?) {
            poblarListaAppsGrupo $apps
        } else {
            generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener las aplicaciones del grupo de aplicaciones."
            $frm_InfoGrupoApps.Close()
        }
    }
}

function poblarListaAppsGrupo ($apps) {
    $appsTotales = Get-RdsStartMenuApp -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado

    foreach ($app in $appsTotales) {
        if ($apps -contains $app) {
            $chcklst_AppsGrupo.Items.Add($app.RemoteAppName, $true)
        } else {
            $chcklst_AppsGrupo.Items.Add($app.RemoteAppName, $false)
        }
    }

    $chcklst_AppsGrupo.Refresh()
}

function obtenerUsuariosGrupoApps {
    $usuariosGrupo = Get-RdsAppGroupUser -TenantName $global:tenantName -HostPoolName $global:hostPoolSeleccionado -AppGroupName $global:grupoSeleccionado
    
    if ($?) {
        poblarListaUsuariosGrupo $usuariosGrupo
    } else {
        generarPopUp "Ok" "Error" "Error" "Ha ocurrido un error al obtener los usuarios del grupo de aplicaciones."
        $frm_InfoGrupoApps.Close()
    }
}

function poblarListaUsuariosGrupo ($usuarios) {
    if ($usuarios -isnot [system.array]) {
        $lst_UsuariosGrupo.Items.Add($usuarios.UserPrincipalName)
    } elseif ($usuarios -is [system.array]) {
        
        foreach ($usuario in $usuarios) {
            $lst_UsuariosGrupo.Items.Add($usuarios.UserPrincipalName)
        }
    }

    $lst_UsuariosGrupo.Refresh()
}



####################################################
######## End Functions frm_InfoGrupoApps ###########
####################################################


[void]$frm_Main.ShowDialog()
