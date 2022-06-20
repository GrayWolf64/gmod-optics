TOOL.Tab = "Optics"
TOOL.Category  = "Light Sources"
TOOL.Name  = "Laser"
TOOL.Command  = nil
TOOL.ConfigName  = ""

if CLIENT then

 local textcolor0 = Color(152 ,251 ,152)
 local textcolor1 = Color(190, 190, 190)
 local alphablack0 = Color(0 ,0 ,0 ,255)

 MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info: ")
 MsgC(textcolor0, "Laser Tool OK!\n")

 language.Add("tool.optics_laser_tool.name", "Laser Tool")
 language.Add("tool.optics_laser_tool.desc", "Create or modify a laser.")
 language.Add("tool.optics_laser_tool.left", "Create a laser.")
 language.Add("tool.optics_laser_tool.right", "Apply changes to a laser.")

 function TOOL.BuildCPanel(basepanel0)

    local label0 = vgui.Create("DLabel", basepanel0)
    label0:Dock(TOP)
    label0:DockMargin(5, 5, 5, 2.5)
    label0:SetText("This tool helps you with laser, and more.")
    label0:SetTextColor(alphablack0)
    label0:SizeToContents()

    local label01 = vgui.Create("DLabel", basepanel0)
    label01:Dock(TOP)
    label01:DockMargin(5, 5, 5, 2.5)
    label01:SetText("Another line of text for place holding.")
    label01:SetTextColor(alphablack0)
    label01:SizeToContents()

    local collapsible00 = vgui.Create("DCollapsibleCategory", basepanel0)
    collapsible00:Dock(TOP)
    collapsible00:DockMargin(10, 5, 10, 5)
    collapsible00:SetLabel("Laser Models")
    collapsible00:SetAnimTime(0.5)
    collapsible00:SetExpanded(false)

    local basepanel1 = vgui.Create("DPanel", collapsible00)
    basepanel1:SetSize(200, 240)
    basepanel1:DockMargin(0, 5, 2.5, 5)
    basepanel1:Dock(TOP)

    local listlayout00 = vgui.Create("DListLayout", basepanel1)
    collapsible00:SetContents(listlayout00)

    local desc0 = vgui.Create( "DLabel", basepanel1)
    desc0:SetColor(textcolor1)
    desc0:SetText( "Model Selection, click one to choose it." )
    desc0:SizeToContents()
    desc0:Dock(BOTTOM)
    desc0:DockMargin(10, 10, 10, 5)

    local modellist0 = vgui.Create("DListView", basepanel1)
    modellist0:AddColumn("Model Name")
    modellist0:AddColumn("Description")
    modellist0:Dock(TOP)
    modellist0:SetTall(basepanel1:GetTall() - 25)
    modellist0:SetMultiSelect(false)

    modellist0:AddLine("Cylinder Shaped","Default Laser Model")

 end

end