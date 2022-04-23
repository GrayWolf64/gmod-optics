TOOL.Tab = "Optics"
TOOL.Category		= "Lens"
TOOL.Name			= "Concave Lens"
TOOL.Command		= nil
TOOL.ConfigName		= ""

cleanup.Register("Concave lens")

if CLIENT then
 local toolfontcolor0 = Color( 143 ,188 ,143 )
 local toolfontcolor1 = Color( 255, 20, 20 )
 local textcolor0 = Color(152 ,251 ,152)
 local textcolor1 = Color(190, 190, 190)
 local alphablack0 = Color(0 ,0 ,0 ,175 )

 MsgC(textcolor0, "[ OPTICS ] Concave lens tool script loaded!\n")

  TOOL.Information = { "left", "right" }
  language.Add("tool.concavelens_tool.name", "Concave Lens Tool")
  language.Add("tool.concavelens_tool.desc", "Create or modify a concave lens.")
  language.Add("tool.concavelens_tool.left", "Create a concave lens.")
  language.Add("tool.concavelens_tool.right", "Apply changes to a concave lens.")
  language.Add("Undone_concavelens_tool", "The concave lens has been undone.")

    function TOOL:DrawToolScreen( width, height )
     surface.SetDrawColor( toolfontcolor0 ); surface.DrawRect( 0, 0, width, height )
     draw.SimpleText( "Optics", "opticsdefaultfont", width / 2, height / 5.5, toolfontcolor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
     draw.SimpleText( "--Concave Lens", "opticsdefaultfontbd", width / 2, height / 2.5, toolfontcolor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end

    function TOOL.BuildCPanel(basepanel0)

      local label0 = vgui.Create("DLabel", basepanel0)
      label0:Dock(TOP)
      label0:DockMargin(5, 2.5, 5, 5)
      label0:SetText("This is the header")
      label0:SetTextColor(alphablack0)

      local collapsible00 = vgui.Create("DCollapsibleCategory", basepanel0)
      collapsible00:Dock(TOP)
      collapsible00:DockMargin(10, 5, 10, 5)
      collapsible00:SetLabel("Lens Models")
      collapsible00:SetAnimTime(0.5)

      local basepanel1 = vgui.Create("DPanel", collapsible00)
      basepanel1:SetSize(200 * monitor_ratiow, 405 * monitor_ratioh)
      basepanel1:DockMargin(0, 5 * monitor_ratioh, 2.5 * monitor_ratiow, 10 * monitor_ratioh)
      basepanel1:Dock(TOP)

      local panellist00 = vgui.Create("DPanelList", basepanel1)
      panellist00:EnableHorizontal(true)
      collapsible00:SetContents(panellist00)

      local desc0 = vgui.Create( "DLabel", basepanel1)
      desc0:SetColor(textcolor1)
      desc0:SetText( "Model Selection, click one to choose it." )
      desc0:SizeToContents()
      desc0:Dock(BOTTOM)
      desc0:DockMargin(10 * monitor_ratiow, 10 * monitor_ratioh, 10 * monitor_ratiow, 5 * monitor_ratioh)

      local modellist0 = vgui.Create("DListView", basepanel1)
      modellist0:AddColumn("Model Name")
      modellist0:AddColumn("Description")
      modellist0:Dock(TOP)
      modellist0:SetTall(basepanel1:GetTall() - 25 * monitor_ratioh)

      modellist0:AddLine("Model 1","Default Concave Lens Model")

      local collapsible0 = vgui.Create("DCollapsibleCategory", basepanel0)  //originally parented to basepanel2
      basepanel0:AddItem(collapsible0)
      collapsible0:SetPos(10 * monitor_ratiow,450 * monitor_ratioh)
      collapsible0:SetLabel("Lens Configuration")
      collapsible0:SetExpanded( true )
      collapsible0:SetSize(400 * monitor_ratiow,200 * monitor_ratioh)
      collapsible0:SetAnimTime(0.5)

      local basepanel2 = vgui.Create("DPanel", collapsible0)
      basepanel2:SetSize(400 * monitor_ratiow, 200 * monitor_ratioh)
      basepanel2:Dock(TOP)
      basepanel2:DockPadding(5 * monitor_ratiow, 2.5 * monitor_ratioh, 5 * monitor_ratiow, 2.5 * monitor_ratioh)

      local panellist0 = vgui.Create("DPanelList", basepanel2)
      panellist0:SetSpacing(2.5 * monitor_ratioh)
      panellist0:EnableHorizontal(false)
      panellist0:EnableVerticalScrollbar(true)
      collapsible0:SetContents(panellist0)

      local collapsible0_content1 = vgui.Create("DCheckBoxLabel", basepanel2)
      collapsible0_content1:SetText("Do Weld")
      collapsible0_content1:SetTextColor( alphablack0 )
      collapsible0_content1:SizeToContents()
      collapsible0_content1:Dock(TOP)
      collapsible0_content1:SetConVar("Optics_Boolean_DoWeldConcaveLens_CLIENT")

      local collapsible0_content2 = vgui.Create("DNumSlider", basepanel2)
      collapsible0_content2:Dock(TOP)
      collapsible0_content2:DockMargin(5 * monitor_ratiow, 7.5 * monitor_ratioh, 5 * monitor_ratiow, 7.5 * monitor_ratioh)
      collapsible0_content2:SetText("Focal length")
      collapsible0_content2:SetDark(true)
      collapsible0_content2:SetMin(0)
      collapsible0_content2:SetMax(200)
      collapsible0_content2:SetDecimals(0)
      collapsible0_content2:SetConVar("Optics_ConcaveLensFocalLength")

    end
end
