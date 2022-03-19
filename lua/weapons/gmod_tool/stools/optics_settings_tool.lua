TOOL.Tab = "Optics"
TOOL.Category		= "Settings"
TOOL.Name			= "General"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if CLIENT then
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
      label0:SetText("This is the header")
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