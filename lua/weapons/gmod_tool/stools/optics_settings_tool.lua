TOOL.Tab = "Optics"
TOOL.Category		= "Settings"
TOOL.Name			= "General"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if CLIENT then

  MsgC(Color(152 ,251 ,152), "[ OPTICS ] Settings tool script loaded!\n")

  TOOL.Information = { "reload" }
  language.Add("tool.optics_settings_tool.name", "General Settings Tool")
  language.Add("tool.optics_settings_tool.desc", "Modify general settings.")
  language.Add("tool.optics_settings_tool.reload", "Bring up the general settings menu.")

    function TOOL:DrawToolScreen( width, height )

      local toolfontcolor = Color( 255, 20, 20 )

	    surface.SetDrawColor( Color( 141 ,238 ,238 ) )
	    surface.DrawRect( 0, 0, width , height)
	    draw.SimpleText( "Optics", "opticsdefaultfont", width / 2, height / 5.5, toolfontcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
      draw.SimpleText( "--General", "opticsdefaultfontbd", width / 2, height / 2, toolfontcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
      draw.SimpleText( "Settings", "opticsdefaultfontbd", width / 2, height / 1.5, toolfontcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

       local pointedent = self:GetOwner():GetEyeTrace().Entity
       if pointedent:IsValid() == true and pointedent:GetClass() == "optics_concavelens" then
        surface.SetDrawColor( Color( 	0 ,238 ,118 ) )
        surface.DrawRect( 0, 195, width , height / 5)
        draw.SimpleText( "On Concave lens", "opticsdefaultfontbd", width / 2, height / 1.2, Color( 30 ,144 ,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
       end

    end

    function TOOL.BuildCPanel(basepanel0)
      //local textcolor0 = Color(105 ,105 ,105)
      local textcolor1 = Color(190, 190, 190)

      local label0 = vgui.Create("DLabel", basepanel0)
        label0:Dock(TOP)
        label0:DockMargin(5, 2.5, 5, 5)
        label0:SetText("Point at a concave lens to show something.")
      label0:SetTextColor(color_black)

      local collapsible0 = vgui.Create("DCollapsibleCategory", basepanel0)
        collapsible0:Dock(TOP)
        collapsible0:DockMargin(5 * monitor_ratiow, 5 * monitor_ratioh, 5 * monitor_ratiow, 10 * monitor_ratioh)
        collapsible0:SetLabel("Concave Lens Information")
        collapsible0:SetAnimTime(0.5)
      collapsible0:SetExpanded(false)

      local basepanel1 = vgui.Create("DPanel", collapsible0)
        basepanel1:SetSize(200 * monitor_ratiow, 200 * monitor_ratioh)
        basepanel1:DockMargin(0, 5 * monitor_ratioh, 2.5 * monitor_ratiow, 10 * monitor_ratioh)
      basepanel1:Dock(TOP)

      local desc0 = vgui.Create("DLabel", basepanel1)
        desc0:SetColor(textcolor1)
        desc0:SetText( "When not pointing at a concave lens, this section is hidden." )
        desc0:SizeToContents()
        desc0:Dock(BOTTOM)
      desc0:DockMargin(10 * monitor_ratiow, 10 * monitor_ratioh, 10 * monitor_ratiow, 7.5 * monitor_ratioh)

      local desc1 = vgui.Create("DLabel", basepanel1)
         desc1:SetColor(color_black)
         desc1:SetText( "Current focal length" )
         desc1:SizeToContents()
         desc1:Dock(TOP)
         desc1:DockMargin(5 * monitor_ratiow, 5 * monitor_ratioh, 10 * monitor_ratiow, 7.5 * monitor_ratioh)

         local textbox0 = vgui.Create("DTextEntry", basepanel1)
         textbox0:Dock( TOP )
         textbox0:DockMargin(40 * monitor_ratiow, 2.5 * monitor_ratioh, 220 * monitor_ratiow, 10 * monitor_ratioh)
      textbox0:SetEditable(false)

      local desc2 = vgui.Create("DLabel", basepanel1)
         desc2:SetColor(color_black)
         desc2:SetText( "Is Welded" )
         desc2:SizeToContents()
         desc2:Dock(TOP)
         desc2:DockMargin(5 * monitor_ratiow, 2.5 * monitor_ratioh, 10 * monitor_ratiow, 7.5 * monitor_ratioh)

         local textbox1 = vgui.Create("DTextEntry", basepanel1)
         textbox1:Dock( TOP )
         textbox1:DockMargin(40 * monitor_ratiow, 2.5 * monitor_ratioh, 220 * monitor_ratiow, 10 * monitor_ratioh)
      textbox1:SetEditable(false)

      local desc3 = vgui.Create("DLabel", basepanel1)
         desc3:SetColor(color_black)
         desc3:SetText( "Is Imaging" )
         desc3:SizeToContents()
         desc3:Dock(TOP)
         desc3:DockMargin(5 * monitor_ratiow, 2.5 * monitor_ratioh, 10 * monitor_ratiow, 7.5 * monitor_ratioh)

         local textbox2 = vgui.Create("DTextEntry", basepanel1)
         textbox2:Dock( TOP )
         textbox2:DockMargin(40, 2.5 * monitor_ratioh, 220 * monitor_ratiow, 10 * monitor_ratioh)
      textbox2:SetEditable(false)

    end

  function optics_opengeneralsettingsmenu()
	 local generalsettingsmenu = vgui.Create("DFrame")
       generalsettingsmenu:SetTitle("General Settings")
       generalsettingsmenu:MakePopup()
       generalsettingsmenu:Center()
   generalsettingsmenu:SetSize(450 * monitor_ratiow,350 * monitor_ratioh)

   local background0 = vgui.Create("DPanel", generalsettingsmenu)
   background0:Dock(FILL)

   local lens_maxdetectiondistancefront_slider = vgui.Create( "DNumSlider", background0)
       lens_maxdetectiondistancefront_slider:Dock(TOP)
       lens_maxdetectiondistancefront_slider:SetDark(true)
       lens_maxdetectiondistancefront_slider:DockMargin(5, 2.5, 5, 5)
       lens_maxdetectiondistancefront_slider:SetText( "Lens Max Detection Distance Front" )
       lens_maxdetectiondistancefront_slider:SetMin( 0 )
       lens_maxdetectiondistancefront_slider:SetMax( 100000 )
       lens_maxdetectiondistancefront_slider:SetDecimals( 0 )
   lens_maxdetectiondistancefront_slider:SetConVar( "Optics_LensMaxDetectionDistanceFront" )

   local lens_maxdetectiondistanceback_slider = vgui.Create( "DNumSlider", background0)
       lens_maxdetectiondistanceback_slider:Dock(TOP)
       lens_maxdetectiondistanceback_slider:SetDark(true)
       lens_maxdetectiondistanceback_slider:DockMargin(5, 10, 5, 5)
       lens_maxdetectiondistanceback_slider:SetText( "Lens Max Detection Distance Back" )
       lens_maxdetectiondistanceback_slider:SetMin( 0 )	
       lens_maxdetectiondistanceback_slider:SetMax( 100000 )
       lens_maxdetectiondistanceback_slider:SetDecimals( 0 )
   lens_maxdetectiondistanceback_slider:SetConVar( "Optics_LensMaxDetectionDistanceback" )

  end

  function TOOL:Think()
   local thing = self:GetOwner():GetEyeTrace().Entity
     if thing:IsValid() == true and self:GetOwner():GetActiveWeapon():GetClass() == "gmod_tool" and thing:GetClass() == "optics_concavelens"
     then

       local linecolor0 = Color(0, 0, 0, 175)
       local spherecolor0 = Color(255 ,0 , 0, 200)
       hook.Add( "PostDrawTranslucentRenderables", "baseline_and_ball0", function()
          local x2 = Vector( 12, 2, 12 )
          if thing:IsValid() == true then
           render.DrawLine( thing:GetPos(), thing:GetPos() + thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt(), spherecolor0 )
           render.DrawLine( thing:GetPos(), thing:GetPos() - thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt(), spherecolor0 )
           render.DrawWireframeBox(thing:GetPos(),thing:GetAngles(),x2,-x2,linecolor0)
           render.DrawWireframeSphere( thing:GetPos(), 2.5, 4, 4, spherecolor0 )
          end
       end )

          hook.Add( "PostDrawTranslucentRenderables", "concavelensinfo0", function()
            local textcolor0 = Color(255,255,255,200)
            if thing:IsValid() == true then
             local pos0 = thing:GetPos()
             local pos0a = Vector(pos0.x , pos0.y, pos0.z + 16)
             local ang0 = self:GetOwner():EyeAngles()
             local ang0a = Angle( ang0.x, ang0.y, - ang0.z )
             ang0a:RotateAroundAxis( ang0a:Up(), -90 )
             ang0a:RotateAroundAxis( ang0a:Forward(), 90 )
             cam.Start3D2D( pos0a, ang0a, 0.1 )
               draw.SimpleText( "Concave Lens", "opticsdefaultfontbd", 16, 0, textcolor0 )
             cam.End3D2D()

             local pos1 = thing:GetPos() + thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt()
             local pos1a = Vector(pos1.x , pos1.y, pos1.z + 12)
             local ang1 = self:GetOwner():EyeAngles()
             local ang1a = Angle( ang1.x, ang1.y, - ang1.z )
             ang1a:RotateAroundAxis( ang1a:Up(), -90 )
             ang1a:RotateAroundAxis( ang1a:Forward(), 90 )
             cam.Start3D2D( pos1a, ang1a, 0.1 )
               draw.SimpleText( "Max Detect Front", "opticsdefaultfontbd", 16, 0, textcolor0 )
             cam.End3D2D()

             local pos2 = thing:GetPos() - thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt()
             local pos2a = Vector(pos2.x , pos2.y, pos2.z + 12)
             local ang2 = self:GetOwner():EyeAngles()
             local ang2a = Angle( ang2.x, ang2.y, - ang2.z )
             ang2a:RotateAroundAxis( ang2a:Up(), -90 )
             ang2a:RotateAroundAxis( ang2a:Forward(), 90 )
             cam.Start3D2D( pos2a, ang2a, 0.1 )
               draw.SimpleText( "Max Detect Back", "opticsdefaultfontbd", 16, 0, textcolor0 )
             cam.End3D2D()
            end

          end )

           local x0 = Vector( 1, 1, 1 )
           hook.Add( "PostDrawTranslucentRenderables", "sidebox0", function()
            if thing:IsValid() == true then
             local pos1b = thing:GetPos() + thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt()
             box_front = render.DrawWireframeBox( pos1b, angle_zero, x0, -x0, spherecolor0 )
            end
            if thing:IsValid() == true then
             local pos2b = thing:GetPos() - thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt()
             box_back = render.DrawWireframeBox( pos2b, angle_zero, x0, -x0, spherecolor0 )
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

  net.Receive("optics_opengeneralsettingsmenu", optics_opengeneralsettingsmenu)

end

 function TOOL:Reload()     return true end

  if SERVER then

    util.AddNetworkString("optics_opengeneralsettingsmenu")
   function TOOL:Reload( trace )
     net.Start("optics_opengeneralsettingsmenu") net.Send(self:GetOwner())
     return false
    end

  end

