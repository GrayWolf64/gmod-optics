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
	    surface.SetDrawColor( Color( 141 ,238 ,238 ) )
	    surface.DrawRect( 0, 0, width, height )
	    draw.SimpleText( "Optics", "opticsdefaultfont", width / 2, height / 5.5, Color( 255, 20, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        draw.SimpleText( "--General", "opticsdefaultfontbd", width / 2, height / 2, Color( 255, 20, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        draw.SimpleText( "Settings", "opticsdefaultfontbd", width / 2, height / 1.5, Color( 255, 20, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end

    function TOOL.BuildCPanel(basepanel0)
      local label0 = vgui.Create("DLabel", basepanel0)
      label0:Dock(TOP)
      label0:DockMargin(5, 2.5, 5, 5)
      label0:SetText("Point at a concave lens to show something.")
      label0:SetTextColor(color_black)
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
     if thing:IsValid() == true and thing:GetClass() == "optics_concavelens" then

       local linecolor0 = Color(0, 0, 0)
       hook.Add( "PostDrawTranslucentRenderables", "baseline0", function()
         if thing:IsValid() == true then
           render.DrawLine( thing:GetPos(), thing:GetPos() + thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt(), linecolor0 )
           render.DrawLine( thing:GetPos(), thing:GetPos() - thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt(), linecolor0 )
         end
       end )   
  
       local spritecolor0 = Color(255 ,0 , 0)
       hook.Add( "PostDrawTranslucentRenderables", "pointsprites0", function()
         if thing:IsValid() == true then
          render.DrawWireframeSphere( thing:GetPos(), 2, 4, 4, spritecolor0 )
         end
       end )

          hook.Add("PostDrawOpaqueRenderables", "concavelensinfo0", function()

            if thing:IsValid() == true then
             local pos0 = thing:GetPos()
             local ang0 = self:GetOwner():EyeAngles()
             local ang1 = Angle( ang0.x, ang0.y, - ang0.z )
             ang1:RotateAroundAxis( ang1:Up(), -90 )
             ang1:RotateAroundAxis( ang1:Forward(), 90 )
           
             cam.Start3D2D( pos0, ang1, 0.1 )
               draw.SimpleText( "Concave Lens", "opticsdefaultfontbd", 16, 0, color_white )
             cam.End3D2D()
            end

          end )

           hook.Add( "PostDrawTranslucentRenderables", "sidebox", function()
            if thing:IsValid() == true then
             local pos1 = thing:GetPos() + thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt()
             local x0 = Vector( 1, 1, 1 )
             box_front = render.DrawBox( pos1, angle_zero, x0, -x0, color_black )
            end
            if thing:IsValid() == true then
             local pos2 = thing:GetPos() - thing:GetAngles():Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt()
             local x1 = Vector( 1, 1, 1 )
             box_back = render.DrawBox( pos2, angle_zero, x1, -x1, color_black )
            end
           end )
          

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

