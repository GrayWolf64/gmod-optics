TOOL.Tab = "Optics"
TOOL.Category		= "Settings"
TOOL.Name			= "Advanced"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if CLIENT then

    local alphablack0 = Color(0 ,0 ,0 ,250 )

    MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info!")
    MsgC(Color(152 ,251 ,152), "[ OPTICS ] Advanced Settings Tool Defined!\n")

    language.Add("tool.optics_adv_settings_tool.name", "Advanced Settings Tool")
    language.Add("tool.optics_adv_settings_tool.desc", "Modify advanced settings.")
    language.Add("tool.optics_adv_settings_tool.0", "Nothing here.")

   local imageoutputframe_front = vgui.Create("DFrame")
   imageoutputframe_front:SetDeleteOnClose(false)
   imageoutputframe_front:SetTitle("Current (Pointed) Imaging Output Front")
   imageoutputframe_front:SetSize(ScrW() / 4, ScrH() / 4)
   imageoutputframe_front:SetPos(10,200)
   imageoutputframe_front:ShowCloseButton(false)
   imageoutputframe_front:Hide()

   local imageoutputframe_back = vgui.Create("DFrame")
   imageoutputframe_back:SetDeleteOnClose(false)
   imageoutputframe_back:SetTitle("Current (Pointed) Imaging Output Back")
   imageoutputframe_back:SetSize(ScrW() / 4, ScrH() / 4)
   imageoutputframe_back:SetPos(10,500)
   imageoutputframe_back:ShowCloseButton(false)
   imageoutputframe_back:Hide()

   local image_front = vgui.Create("DImage", imageoutputframe_front)
   image_front:Dock(FILL)

   local image_back = vgui.Create("DImage", imageoutputframe_back)
   image_back:Dock(FILL)

   function TOOL:Think()
    local thing = self:GetOwner():GetEyeTrace().Entity
    if thing:IsValid() == true and thing:GetClass() == "optics_concavelens" then
      if thing:GetNWBool("IsImagingFront") == true then
       image_front:SetMaterial(Optics_ConcaveLensImagingResult_Material_Front_Table[thing:EntIndex()])
      end
      if thing:GetNWBool("IsImagingBack") == true then
       image_back:SetMaterial(Optics_ConcaveLensImagingResult_Material_Back_Table[thing:EntIndex()])
      end
    else
      image_front:SetMaterial(nil)
      image_back:SetMaterial(nil)
    end
   end

   function TOOL:DrawHUD()
     imageoutputframe_front:Show()
     imageoutputframe_back:Show()
     image_front:Show()
     image_back:Show()
   end

   function TOOL:Holster()
     imageoutputframe_front:Hide()
     imageoutputframe_back:Hide()
     image_front:Hide()
     image_back:Hide()
   end

   function TOOL.BuildCPanel(basepanel0)

      local label0 = vgui.Create("DLabel", basepanel0)
      label0:SetText("This is the text on the top.")
      label0:SetColor(alphablack0)
      label0:Dock(TOP)
      label0:DockMargin(5, 2.5, 2.5, 5)

   end

end