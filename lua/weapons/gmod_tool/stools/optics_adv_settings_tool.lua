TOOL.Tab = "Optics"
TOOL.Category		= "Settings"
TOOL.Name			= "Advanced"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if CLIENT then

    local textcolor1 = Color(152 ,251 ,152)
    local alphablack0 = Color(0 ,0 ,0 ,250 )

    MsgC(textcolor1, "[ OPTICS ] Advanced Settings Tool Script Loaded!\n")

    language.Add("tool.optics_adv_settings_tool.name", "Advanced Settings Tool")
    language.Add("tool.optics_adv_settings_tool.desc", "Modify advanced settings.")
    language.Add("tool.optics_adv_settings_tool.0", "Nothing here.")

   local imageoutputframe = vgui.Create("DFrame")
   imageoutputframe:SetDeleteOnClose(false)
   imageoutputframe:SetTitle("Current Imaging Output")
   imageoutputframe:SetSize(256, 256)
   imageoutputframe:SetPos(10,200)
   imageoutputframe:ShowCloseButton(false)
   imageoutputframe:Hide()

   function TOOL:DrawHUD()
     imageoutputframe:Show()
   end

   function TOOL:Holster()
     imageoutputframe:Hide()
   end

   function TOOL.BuildCPanel(basepanel0)

      local label0 = vgui.Create("DLabel", basepanel0)
      label0:SetText("This is the text on the top.")
      label0:SetColor(alphablack0)
      label0:Dock(TOP)
      label0:DockMargin(5 * monitor_ratiow, 2.5 * monitor_ratioh, 2.5 * monitor_ratiow, 5 * monitor_ratioh)

   end

end