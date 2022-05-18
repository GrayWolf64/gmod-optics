TOOL.Tab = "Optics"
TOOL.Category  = "Lens"
TOOL.Name  = "Concave Lens"
TOOL.Command  = nil
TOOL.ConfigName  = ""

if CLIENT then
 local toolfontcolor0 = Color( 143 ,188 ,143 )
 local toolfontcolor1 = Color( 255, 20, 20 )
 local textcolor0 = Color(152 ,251 ,152)
 local textcolor1 = Color(190, 190, 190)
 local alphablack0 = Color(0 ,0 ,0 ,250)

 MsgC(textcolor0, "[ OPTICS ] Concave Lens Tool Defined!\n")

  TOOL.Information = { "left", "right" }
  language.Add("tool.optics_concavelens_tool.name", "Concave Lens Tool")
  language.Add("tool.optics_concavelens_tool.desc", "Create or modify a concave lens.")
  language.Add("tool.optics_concavelens_tool.left", "Create a concave lens.")
  language.Add("tool.optics_concavelens_tool.right", "Apply changes to a concave lens.")

    function TOOL:DrawToolScreen( width, height )
     surface.SetDrawColor( toolfontcolor0 ); surface.DrawRect( 0, 0, width, height )
     draw.SimpleText( "Optics", "opticsdefaultfont", width / 2, height / 5.5, toolfontcolor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
     draw.SimpleText( "--Concave Lens", "opticsdefaultfontbd", width / 2, height / 2.5, toolfontcolor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end

    function TOOL.BuildCPanel(basepanel0)

      local label0 = vgui.Create("DLabel", basepanel0)
      label0:Dock(TOP)
      label0:DockMargin(5 * monitor_ratiow, 2.5 * monitor_ratioh, 5 * monitor_ratiow, 5 * monitor_ratioh)
      label0:SetText("This tool helps you with concave lens, including previwing the image.")
      label0:SetTextColor(alphablack0)
      label0:SizeToContents()

      local label01 = vgui.Create("DLabel", basepanel0)
      label01:Dock(TOP)
      label01:DockMargin(5 * monitor_ratiow, 5 * monitor_ratioh, 5 * monitor_ratiow, 2.5 * monitor_ratioh)
      label01:SetText("Another line of text.")
      label01:SetTextColor(alphablack0)
      label01:SizeToContents()

      local collapsible00 = vgui.Create("DCollapsibleCategory", basepanel0)
      collapsible00:Dock(TOP)
      collapsible00:DockMargin(10, 5, 10, 5)
      collapsible00:SetLabel("Lens Models")
      collapsible00:SetAnimTime(0.5)

      local basepanel1 = vgui.Create("DPanel", collapsible00)
      basepanel1:SetSize(200 * monitor_ratiow, 340 * monitor_ratioh)
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
      modellist0:SetMultiSelect(false)

      modellist0:AddLine("Double Concave Lens","Default Concave Lens Model")

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

      local desc1 = vgui.Create("DLabel", basepanel2)
      desc1:SetColor(textcolor1)
      desc1:SetText( "Do what is says." )
      desc1:SizeToContents()
      desc1:Dock(BOTTOM)
      desc1:DockMargin(5 * monitor_ratiow, 10 * monitor_ratioh, 5 * monitor_ratiow, 5 * monitor_ratioh)

      local panellist0 = vgui.Create("DPanelList", basepanel2)
      panellist0:SetSpacing(2.5 * monitor_ratioh)
      panellist0:EnableHorizontal(false)
      panellist0:EnableVerticalScrollbar(true)
      collapsible0:SetContents(panellist0)

      local collapsible0_content0 = vgui.Create("DCheckBoxLabel", basepanel2)
      collapsible0_content0:SetText("Make No-collide")
      collapsible0_content0:SetTextColor( alphablack0 )
      collapsible0_content0:SizeToContents()
      collapsible0_content0:Dock(TOP)
      collapsible0_content0:DockMargin(2.5 * monitor_ratiow, 2.5 * monitor_ratioh, 2.5 * monitor_ratiow, 10 * monitor_ratioh)
      collapsible0_content0:SetConVar("Optics_Boolean_NoCollideConcaveLens_CLIENT")

      local collapsible0_content1 = vgui.Create("DCheckBoxLabel", basepanel2)
      collapsible0_content1:SetText("Do Weld")
      collapsible0_content1:SetTextColor( alphablack0 )
      collapsible0_content1:SizeToContents()
      collapsible0_content1:Dock(TOP)
      collapsible0_content1:DockMargin(2.5 * monitor_ratiow, 10 * monitor_ratioh, 2.5 * monitor_ratiow, 10 * monitor_ratioh)
      collapsible0_content1:SetConVar("Optics_Boolean_DoWeldConcaveLens_CLIENT")

      local desc2 = vgui.Create("DLabel", basepanel2)
      desc2:SetColor(textcolor1)
      desc2:SetText( "Do what is says." )
      desc2:SizeToContents()
      desc2:Dock(TOP)
      desc2:DockMargin(2.5 * monitor_ratiow, 10 * monitor_ratioh, 5 * monitor_ratiow, 2.5 * monitor_ratioh)

      local collapsible0_content2 = vgui.Create("DNumSlider", basepanel2)
      collapsible0_content2:Dock(TOP)
      collapsible0_content2:SetText("Focal length")
      collapsible0_content2:SetDark(true)
      collapsible0_content2:SetMin(0)
      collapsible0_content2:SetMax(200)
      collapsible0_content2:SetDecimals(0)
      collapsible0_content2:SetConVar("Optics_ConcaveLensFocalLength")

      function basepanel0:Think()
        local convar01 = GetConVar("Optics_SelectedConcaveLensModel")
        modellist0.OnRowSelected = function( panel, rowIndex, row )
          if row == 1 then
            convar01:SetString("models/optics/lens/concavelens_d_20x20.mdl")
          end
        end
      end

    end

end

cleanup.Register("Concave Lens")

function TOOL:Think()

  if CLIENT then return end

  local convar0 = GetConVar("Optics_SelectedConcaveLensModel")
  local user0 = self:GetOwner()

  self:MakeGhostEntity(convar0:GetString(),user0:GetPos(),user0:GetAngles())

  local ghostent0 = self.GhostEntity
  local min = ghostent0:OBBMins()
  local trace0 = user0:GetEyeTrace()

  local angle0 = trace0.HitNormal:Angle()
  angle0.pitch = angle0.pitch + 90

  if ghostent0:IsValid() == true then
    ghostent0:SetPos(trace0.HitPos - trace0.HitNormal * min.z)
    ghostent0:SetAngles(angle0)
    ghostent0:SetNoDraw(false)
  end

  if trace0.Entity:GetClass() == "optics_concavelens" then
    ghostent0:SetNoDraw(true)
  end

end

function TOOL:Holster()
  self:ReleaseGhostEntity()
end

function TOOL:LeftClick(trace)

  local user0 = self:GetOwner()
  local model0 = GetConVar("Optics_SelectedConcaveLensModel"):GetString()
  local pos0 = trace.HitPos
  local concavelens = MakeConcaveLens(user0, pos0, model0, trace.Entity, trace.PhysicsBone)

  undo.Create( "Concave Lens" )
    undo.AddEntity( concavelens )
    undo.AddEntity( concavelens_constrt )
    undo.SetPlayer( user0 )
    user0:AddCleanup( "Concave Lens", concavelens )
  undo.Finish()

  return true

end

function TOOL:RightClick(trace)

  if IsValid(trace.Entity) == true and trace.Entity:GetClass() == "optics_concavelens" then
    local concavelens = trace.Entity

    local convar0 = GetConVar("Optics_ConcaveLensFocalLength")
    local convar1 = GetConVar("Optics_Boolean_NoCollideConcaveLens_CLIENT")

    concavelens:SetNWInt("FocalLength", convar0:GetInt())
    concavelens:SetNWBool("NoCollide", convar1:GetBool())

    if concavelens:GetNWBool("NoCollide") == true then
      concavelens:SetCollisionGroup(COLLISION_GROUP_WORLD)
    else
      concavelens:SetCollisionGroup(COLLISION_GROUP_NONE)
    end

    return true
  end

end