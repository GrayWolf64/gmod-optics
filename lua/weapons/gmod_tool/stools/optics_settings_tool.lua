TOOL.Tab = "Optics"
TOOL.Category		= "Settings"
TOOL.Name			= "General"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if CLIENT then

  local textcolor0 = Color(190, 190, 190)
  local textcolor1 = Color(105 ,105 ,105)
  local textcolor2 = Color(0 ,238 ,118 )
  local textcolor3 = Color(152 ,251 ,152)
  local textcolor4 = Color(248 ,248 ,255)
  local toolfontcolor0 = Color( 255, 20, 20 )
  local toolfontcolor1 = Color( 141 ,238 ,238 )
  local toolfontcolor2 = Color( 30 ,144 ,255 )
  local alphablack0 = Color(0 ,0 ,0 ,255 )

  MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info!")
  MsgC(textcolor3, "[ OPTICS ] General Settings Tool Defined!\n")

  TOOL.Information = { "reload" }
  language.Add("tool.optics_settings_tool.name", "General Settings Tool")
  language.Add("tool.optics_settings_tool.desc", "Modify general settings.")
  language.Add("tool.optics_settings_tool.reload", "Bring up the general settings menu.")

    function TOOL:DrawToolScreen( width, height )

      surface.SetDrawColor( toolfontcolor1 ); surface.DrawRect( 0, 0, width , height)
      draw.SimpleText( "Optics", "opticsdefaultfont", width / 2, height / 5.5, toolfontcolor0, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
      draw.SimpleText( "--General", "opticsdefaultfontbd", width / 2, height / 2, toolfontcolor0, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
      draw.SimpleText( "Settings", "opticsdefaultfontbd", width / 2, height / 1.5, toolfontcolor0, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

       local pointedent = self:GetOwner():GetEyeTrace().Entity
       if pointedent:IsValid() == true and pointedent:GetClass() == "optics_concavelens" then
        surface.SetDrawColor( textcolor2 )
        surface.DrawRect( 0, 195, width , height / 5)
        draw.SimpleText( "OnConcaveLens", "opticsdefaultfontbd", width / 2, height / 1.2, toolfontcolor2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
       end

    end

    function TOOL.BuildCPanel(basepanel0)

      local label0 = vgui.Create("DLabel", basepanel0)
      label0:Dock(TOP)
      label0:DockMargin(5, 2.5, 5, 5)
      label0:SetText("Point at a concave lens using toolgun to show something.")
      label0:SetTextColor(alphablack0)

      local collapsible00 = vgui.Create("DCollapsibleCategory", basepanel0)
      collapsible00:Dock(TOP)
      collapsible00:DockMargin(5, 5, 5, 10)
      collapsible00:SetLabel("General Settings")
      collapsible00:SetAnimTime(0.5)
      collapsible00:SetExpanded(false)

      local basepanel01 = vgui.Create("DPanel", collapsible00)
      basepanel01:SetSize(200, 140)
      basepanel01:DockMargin(0, 5, 2.5, 10)
      basepanel01:Dock(TOP)

      local checkbox0 = vgui.Create("DCheckBoxLabel", basepanel01)
      checkbox0:Dock(TOP)
      checkbox0:DockMargin(5, 5, 5, 10)
      checkbox0:SetText("Draw some lines")
      checkbox0:SizeToContents()
      checkbox0:SetConVar("Optics_Boolean_GeneralSettingsToolDrawDebugLines_CLIENT")
      checkbox0:SetValue(true)
      checkbox0:SetTextColor(alphablack0)

      local slider01 = vgui.Create( "DNumSlider", basepanel01)
      slider01:Dock(TOP)
      slider01:SetDark(true)
      slider01:DockMargin(5, 2.5, 5, 5)
      slider01:SetText( "Lens Max Detection Distance Front" )
      slider01:SetMin( 0 )
      slider01:SetMax( 10000 )
      slider01:SetDecimals( 0 )
      slider01:SetConVar( "Optics_LensMaxDetectionDistanceFront" )

      local slider02 = vgui.Create( "DNumSlider", basepanel01)
      slider02:Dock(TOP)
      slider02:SetDark(true)
      slider02:DockMargin(5, 10, 5, 5)
      slider02:SetText( "Lens Max Detection Distance Back" )
      slider02:SetMin( 0 )
      slider02:SetMax( 10000 )
      slider02:SetDecimals( 0 )
      slider02:SetConVar( "Optics_LensMaxDetectionDistanceback" )

      local notice02 = vgui.Create("DLabel", basepanel01)
      notice02:SetText("Some settings require you to apply to certain things to take effect.")
      notice02:Dock(BOTTOM)
      notice02:SetColor(textcolor0)
      notice02:DockMargin(5, 10, 5,0.5)

      local collapsible0 = vgui.Create("DCollapsibleCategory", basepanel0)
      collapsible0:Dock(TOP)
      collapsible0:DockMargin(5, 5, 5, 10)
      collapsible0:SetLabel("Pointed Concave Lens Information")
      collapsible0:SetAnimTime(0.5)
      collapsible0:SetExpanded(false)

      local basepanel1 = vgui.Create("DPanel", collapsible0)
      basepanel1:SetSize(200, 300)
      basepanel1:DockMargin(0, 5, 2.5, 10)
      basepanel1:Dock(TOP)

      local desc0 = vgui.Create("DLabel", basepanel1)
      desc0:SetColor(textcolor0)
      desc0:SetText( "When not pointing at a concave lens, this section is hidden." )
      desc0:SizeToContents()
      desc0:Dock(BOTTOM)
      desc0:DockMargin(10, 10, 10, 7.5)

      local colorbutton0 = vgui.Create("DColorButton", basepanel1)
      colorbutton0:Dock(TOP)
      colorbutton0:DockMargin(5, 5, 5, 5)
      colorbutton0:SetHeight(20)
      colorbutton0:Paint( 20, 20 )
      colorbutton0:SetColor(toolfontcolor0)
      colorbutton0:SetTextColor(textcolor4)

      local desc1 = vgui.Create("DLabel", basepanel1)
      desc1:SetColor(alphablack0)
      desc1:SetText( "Current focal length" )
      desc1:SizeToContents()
      desc1:Dock(TOP)
      desc1:DockMargin(7.5, 5, 7.5, 7.5)

      local textbox0 = vgui.Create("DTextEntry", basepanel1)
      textbox0:Dock( TOP )
      textbox0:DockMargin(40, 2, 50, 10)
      textbox0:SetEditable(false)
      textbox0:SetPlaceholderText("Integer")
      textbox0:SetTextColor(textcolor2)

      local desc2 = vgui.Create("DLabel", basepanel1)
      desc2:SetColor( alphablack0 )
      desc2:SetText( "Is Welded" )
      desc2:SizeToContents()
      desc2:Dock(TOP)
      desc2:DockMargin(5, 2, 10, 7.5)

      local textbox1 = vgui.Create("DTextEntry", basepanel1)
      textbox1:Dock( TOP )
      textbox1:DockMargin(40, 2, 50, 10)
      textbox1:SetEditable(false)
      textbox1:SetPlaceholderText("True or false")
      textbox1:SetTextColor(textcolor2)

      local desc3 = vgui.Create("DLabel", basepanel1)
      desc3:SetColor( alphablack0 )
      desc3:SetText( "Is Imaging" )
      desc3:SizeToContents()
      desc3:Dock(TOP)
      desc3:DockMargin(5, 2, 10, 7.5)

      local desc4 = vgui.Create("DLabel", basepanel1)
      desc4:SetColor( textcolor1 )
      desc4:SetText( "(If there are any objects touched by the front or back trace lines)" )
      desc4:SizeToContents()
      desc4:Dock(TOP)
      desc4:DockMargin(5, 2, 10, 7.5)

      local textbox2 = vgui.Create("DTextEntry", basepanel1)
      textbox2:Dock( TOP )
      textbox2:DockMargin(40, 2.5, 50, 10)
      textbox2:SetEditable(false)
      textbox2:SetTextColor(textcolor2)
      textbox2:SetPlaceholderText("True or false")

      local desc6 = vgui.Create("DLabel", basepanel1)
      desc6:SetColor( alphablack0 )
      desc6:SetText( "Is No-collide" )
      desc6:SizeToContents()
      desc6:Dock(TOP)
      desc6:DockMargin(5, 2, 10, 7.5)

      local textbox3 = vgui.Create("DTextEntry", basepanel1)
      textbox3:Dock( TOP )
      textbox3:DockMargin(40, 2.5, 50, 10)
      textbox3:SetEditable(false)
      textbox3:SetTextColor(textcolor2)
      textbox3:SetPlaceholderText("True or false")

      function basepanel0:Think()

        local convar0 = GetConVar("Optics_String_Index_PointingAtConcaveLens_CLIENT")
        local convar1 = GetConVar("Optics_Boolean_PointingAtConcaveLens_CLIENT")
        local convar2 = GetConVar("Optics_Boolean_IsDoWeld_PointedConcaveLens_CLIENT")
        local convar3 = GetConVar("Optics_Boolean_IsNoCollide_PointedConcaveLens_CLIENT")
        local convar4 = GetConVar("Optics_Boolean_FocalLength_PointedConcaveLens_CLIENT")
        local convar5 = GetConVar("Optics_Boolean_IsImaging_PointedConcaveLens_CLIENT")

        if convar1:GetBool() == true then
          colorbutton0:SetColor(textcolor2)
          colorbutton0:SetText(convar0:GetString())
        else
          colorbutton0:SetColor(toolfontcolor0)
          colorbutton0:SetText(" Entity Index: N/A")
        end

        textbox0:SetText(tostring(convar4:GetInt()))
        textbox1:SetText(tostring(convar2:GetBool()))
        textbox2:SetText(tostring(convar5:GetBool()))
        textbox3:SetText(tostring(convar3:GetBool()))

      end

    end

  function TOOL:Think()
   local thing = self:GetOwner():GetEyeTrace().Entity

   local convar0 = GetConVar("Optics_String_Index_PointingAtConcaveLens_CLIENT")
   local convar1 = GetConVar("Optics_Boolean_PointingAtConcaveLens_CLIENT")
   local convar2 = GetConVar("Optics_Boolean_IsDoWeld_PointedConcaveLens_CLIENT")
   local convar3 = GetConVar("Optics_Boolean_IsNoCollide_PointedConcaveLens_CLIENT")
   local convar4 = GetConVar("Optics_Boolean_FocalLength_PointedConcaveLens_CLIENT")
   local convar5 = GetConVar("Optics_Boolean_IsImaging_PointedConcaveLens_CLIENT")

   if thing:IsValid() == true and thing:GetClass() == "optics_concavelens" then
     convar0:SetString(" Entity Index: " .. tostring(thing:EntIndex()))
     convar1:SetBool(true)

     convar2:SetBool(thing:GetNWBool("IsWelded"))
     convar3:SetBool(thing:GetNWBool("NoCollide"))
     convar4:SetInt(thing:GetNWInt("FocalLength"))
   else
     convar0:SetString(" Entity Index: " .. "N/A")
     convar1:SetBool(false)

     convar2:SetBool(false)
     convar3:SetBool(false)
     convar4:SetInt(0)
     convar5:SetBool(false)
   end

     if thing:IsValid() == true and self:GetOwner():GetActiveWeapon():GetClass() == "gmod_tool" and thing:GetClass() == "optics_concavelens"
     and GetConVar("Optics_Boolean_GeneralSettingsToolDrawDebugLines_CLIENT"):GetBool() == true
     then

       local thingpos = thing:GetPos()
       local thingangles = thing:GetAngles()
       local thingindex = thing:EntIndex()
       local tr_front_hitpos = (Optics_ConcaveLensTraces_Front_Table[thingindex]).HitPos
       local tr_back_hitpos = (Optics_ConcaveLensTraces_Back_Table[thingindex]).HitPos

       local alphalinecolor0 = Color(0, 0, 0, 175)
       local alphatextcolor0 = Color(255,255,255,200)
       local alphaspherecolor0 = Color(255 ,0 , 0, 200)
       local alphaspherecolor1 = Color(138 ,43 ,226)

       local Convar_Int_MaxDetect_Front = GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt()
       local Convar_Int_MaxDetect_Back = GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt()

       hook.Add( "PostDrawTranslucentRenderables", "baseline_and_ball0", function()
          local x2 = thing:OBBMaxs()
          if thing:IsValid() == true then
           render.DrawLine( thingpos, thingpos + thingangles:Right() * Convar_Int_MaxDetect_Front, alphaspherecolor0 )
           render.DrawLine( thingpos, thingpos - thingangles:Right() * Convar_Int_MaxDetect_Back, alphaspherecolor0 )

           render.DrawLine( thingpos, tr_front_hitpos, alphaspherecolor1)
           render.DrawLine( thingpos, tr_back_hitpos, alphaspherecolor1)

           render.DrawWireframeBox(thingpos,thingangles,x2,-x2,alphalinecolor0)

           render.DrawWireframeSphere(tr_front_hitpos, 0.5, 6, 6, alphaspherecolor1)
           render.DrawWireframeSphere(tr_back_hitpos, 0.5, 6, 6, alphaspherecolor1)

           render.DrawWireframeSphere( thingpos, 2.5, 8, 8, alphaspherecolor0 )
          end
       end )

          hook.Add( "PostDrawTranslucentRenderables", "concavelensinfo0", function()
            if thing:IsValid() == true then
             local pos0a = Vector(thingpos.x , thingpos.y, thingpos.z + 16)
             local ang0 = self:GetOwner():EyeAngles()
             local ang0a = Angle( ang0.x, ang0.y, - ang0.z )
             ang0a:RotateAroundAxis( ang0a:Up(), -90 )
             ang0a:RotateAroundAxis( ang0a:Forward(), 90 )
             cam.Start3D2D( pos0a, ang0a, 0.1 )
               draw.SimpleText( "Lens", "opticsdefaultfontbd", 16, 0, alphatextcolor0 )
             cam.End3D2D()

             local pos1 = thingpos + thing:GetAngles():Right() * Convar_Int_MaxDetect_Front
             local pos1a = Vector(pos1.x , pos1.y, pos1.z + 12)
             local ang1 = self:GetOwner():EyeAngles()
             local ang1a = Angle( ang1.x, ang1.y, - ang1.z )
             ang1a:RotateAroundAxis( ang1a:Up(), -90 )
             ang1a:RotateAroundAxis( ang1a:Forward(), 90 )
             cam.Start3D2D( pos1a, ang1a, 0.1 )
               draw.SimpleText( "Max Detect Front", "opticsdefaultfontbd", 16, 0, alphatextcolor0 )
             cam.End3D2D()

             local pos2 = thingpos - thing:GetAngles():Right() * Convar_Int_MaxDetect_Back
             local pos2a = Vector(pos2.x , pos2.y, pos2.z + 12)
             local ang2 = self:GetOwner():EyeAngles()
             local ang2a = Angle( ang2.x, ang2.y, - ang2.z )
             ang2a:RotateAroundAxis( ang2a:Up(), -90 )
             ang2a:RotateAroundAxis( ang2a:Forward(), 90 )
             cam.Start3D2D( pos2a, ang2a, 0.1 )
               draw.SimpleText( "Max Detect Back", "opticsdefaultfontbd", 16, 0, alphatextcolor0 )
             cam.End3D2D()
            end

          end )

           local x0 = Vector( 1, 1, 1 )

           hook.Add( "PostDrawTranslucentRenderables", "sidebox0", function()
            if thing:IsValid() == true then
             local pos1b = thingpos + thingangles:Right() * Convar_Int_MaxDetect_Front
             box_front = render.DrawWireframeBox( pos1b, angle_zero, x0, -x0, alphaspherecolor0 )
            end

            if thing:IsValid() == true then
             local pos2b = thingpos - thingangles:Right() * Convar_Int_MaxDetect_Back
             box_back = render.DrawWireframeBox( pos2b, angle_zero, x0, -x0, alphaspherecolor0 )
            end
           end )

     else

      hook.Add( "PostDrawTranslucentRenderables", "baseline_and_ball0", function()
        render.ClearStencil()
      end)
      hook.Add( "PostDrawTranslucentRenderables", "concavelensinfo0", function()
        render.ClearStencil()
      end)
      hook.Add( "PostDrawTranslucentRenderables", "sidebox0", function()
        render.ClearStencil()
      end)

     end

  end

end

if CLIENT then  --[[simplify needed--]]
  function TOOL:Holster()
    hook.Add( "PostDrawTranslucentRenderables", "baseline_and_ball0", function()
      render.ClearStencil()
    end)
    hook.Add( "PostDrawTranslucentRenderables", "concavelensinfo0", function()
      render.ClearStencil()
    end)
    hook.Add( "PostDrawTranslucentRenderables", "sidebox0", function()
      render.ClearStencil()
    end)
  end
end

function TOOL:Reload() return true end

if SERVER then

  function TOOL:Reload( trace )
    return false
  end

end