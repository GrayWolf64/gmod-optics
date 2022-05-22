TOOL.Tab = "Optics"
TOOL.Category		= "Settings"
TOOL.Name			= "Advanced"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if CLIENT then

    local textcolor1 = Color(152 ,251 ,152)
    local alphablack0 = Color(0 ,0 ,0 ,250 )

    MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info!")
    MsgC(textcolor1, "[ OPTICS ] Advanced Settings Tool Defined!\n")

    language.Add("tool.optics_adv_settings_tool.name", "Advanced Settings Tool")
    language.Add("tool.optics_adv_settings_tool.desc", "Modify advanced settings.")
    language.Add("tool.optics_adv_settings_tool.0", "Nothing here.")

   local imageoutputframe = vgui.Create("DFrame")
   imageoutputframe:SetDeleteOnClose(false)
   imageoutputframe:SetTitle("Current (Pointed) Imaging Output")
   imageoutputframe:SetSize(ScrW() / 4, ScrH() / 4)
   imageoutputframe:SetPos(10,200)
   imageoutputframe:ShowCloseButton(false)
   imageoutputframe:Hide()

   local image0 = vgui.Create("DImage", imageoutputframe)
   image0:Dock(FILL)

   function TOOL:Think()
    local thing = self:GetOwner():GetEyeTrace().Entity
    if thing:IsValid() == true and thing:GetClass() == "optics_concavelens" and thing:GetNWBool("IsImaging") == true then
      image0:SetMaterial(Optics_ConcaveLensImagingResult_Material_Front_Table[thing:EntIndex()])
    else
      image0:SetMaterial(nil)
    end
   end

   function TOOL:DrawHUD()
     imageoutputframe:Show()
     image0:Show()
   end

   function TOOL:Holster()
     imageoutputframe:Hide()
     image0:Hide()
   end

   function TOOL.BuildCPanel(basepanel0)

      local label0 = vgui.Create("DLabel", basepanel0)
      label0:SetText("This is the text on the top.")
      label0:SetColor(alphablack0)
      label0:Dock(TOP)
      label0:DockMargin(5, 2.5, 2.5, 5)

   end

end