TOOL.Tab = "Optics"
TOOL.Category		= "Settings"
TOOL.Name			= "Advanced"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if CLIENT then

    local alphablack0 = Color(0 ,0 ,0 ,255 )
    local toolfontcolor0 = Color( 255, 20, 20 )
    local toolfontcolor1 = Color( 141 ,238 ,238 )

    language.Add("tool.optics_adv_settings_tool.name", "Advanced Settings Tool")
    language.Add("tool.optics_adv_settings_tool.desc", "Modify advanced settings.")
    language.Add("tool.optics_adv_settings_tool.0", "Nothing here.")

    function TOOL:DrawToolScreen( width, height )

      surface.SetDrawColor( toolfontcolor1 ); surface.DrawRect( 0, 0, width , height)
      draw.SimpleText( "Optics", "opticsdefaultfont", width / 2, height / 5.5, toolfontcolor0, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
      draw.SimpleText( "--Advanced", "opticsdefaultfontbd", width / 2, height / 2, toolfontcolor0, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
      draw.SimpleText( "Settings", "opticsdefaultfontbd", width / 2, height / 1.5, toolfontcolor0, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end

   local scrw, scrh = ScrW(), ScrH()

   local imageoutputframe_front = vgui.Create("DFrame")
   imageoutputframe_front:SetDeleteOnClose(false)
   imageoutputframe_front:SetTitle("Current ( Pointed ) Imaging Output Front")
   imageoutputframe_front:SetSize(scrw / 4, scrh / 4)
   imageoutputframe_front:SetPos(10,200)
   imageoutputframe_front:ShowCloseButton(false)
   imageoutputframe_front:Hide()

   local imageoutputframe_back = vgui.Create("DFrame")
   imageoutputframe_back:SetDeleteOnClose(false)
   imageoutputframe_back:SetTitle("Current ( Pointed ) Imaging Output Back")
   imageoutputframe_back:SetSize(scrw / 4, scrh / 4)
   imageoutputframe_back:SetPos(10,480)
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
     if GetConVar("Optics_Bool_ShowCurrentImagingOutputFront_CLIENT"):GetBool() == true then
       imageoutputframe_front:Show()
       image_front:Show()
     else
       imageoutputframe_front:Hide()
       image_front:Hide()
     end

     if GetConVar("Optics_Bool_ShowCurrentImagingOutputBack_CLIENT"):GetBool() == true then
       imageoutputframe_back:Show()
       image_back:Show()
     else
       imageoutputframe_back:Hide()
       image_back:Hide()
      end
   end

   function TOOL:Holster()
     imageoutputframe_front:Hide()
     imageoutputframe_back:Hide()
     image_front:Hide()
     image_back:Hide()
   end

   function TOOL.BuildCPanel(basepanel0)

      local label0 = vgui.Create("DLabel", basepanel0)
      label0:SetText("Manage some settings besides general settings.")
      label0:SetColor(alphablack0)
      label0:Dock(TOP)
      label0:DockMargin(5, 2.5, 2.5, 5)

      local collapsible0 = vgui.Create("DCollapsibleCategory", basepanel0)
      collapsible0:Dock(TOP)
      collapsible0:DockMargin(5, 5, 5, 10)
      collapsible0:SetLabel("Advanced Settings")
      collapsible0:SetAnimTime(0.5)
      collapsible0:SetExpanded(false)

      local basepanel1 = vgui.Create("DPanel", collapsible0)
      basepanel1:SetSize(200, 180)
      basepanel1:DockMargin(0, 5, 2.5, 10)
      basepanel1:Dock(TOP)

      local slider01 = vgui.Create( "DNumSlider", basepanel1)
      slider01:Dock(TOP)
      slider01:SetDark(true)
      slider01:DockMargin(5, 2.5, 5, 2.5)
      slider01:SetText( "Lens Imaging Quality" )
      slider01:SetMin( 0 )
      slider01:SetMax( 100 )
      slider01:SetDecimals( 0 )
      slider01:SetConVar( "Optics_Int_LensImagingQuality_CLIENT" )

      local checkbox0 = vgui.Create("DCheckBoxLabel", basepanel1)
      checkbox0:SetText("Show Current Imaging Output ( Front )")
      checkbox0:SetDark(true)
      checkbox0:Dock(TOP)
      checkbox0:DockMargin(5, 5, 5, 5)
      checkbox0:SetConVar("Optics_Bool_ShowCurrentImagingOutputFront_CLIENT")
      checkbox0:SetChecked(false)

      local checkbox1 = vgui.Create("DCheckBoxLabel", basepanel1)
      checkbox1:SetText("Show Current Imaging Output ( Back )")
      checkbox1:SetDark(true)
      checkbox1:Dock(TOP)
      checkbox1:DockMargin(5, 5, 5, 5)
      checkbox1:SetConVar("Optics_Bool_ShowCurrentImagingOutputBack_CLIENT")
      checkbox1:SetChecked(false)

      local label1 = vgui.Create("DLabel", basepanel1)
      label1:Dock(BOTTOM)
      label1:DockMargin(5, 5, 5, 5)
      label1:SetText("Manage the advanced settings.")
      label1:SetTextColor(alphablack0)

   end

end