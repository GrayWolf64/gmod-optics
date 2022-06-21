TOOL.Tab = "Optics"
TOOL.Category  = "Light Sources"
TOOL.Name  = "Laser Emitter"
TOOL.Command  = nil
TOOL.ConfigName  = ""

if CLIENT then

 local textcolor0 = Color(152 ,251 ,152)
 local textcolor1 = Color(190, 190, 190)
 local alphablack0 = Color(0 ,0 ,0 ,255)

 MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info: ")
 MsgC(textcolor0, "Laser Emitter Tool OK!\n")

 TOOL.Information = { "left", "right" }
 language.Add("tool.optics_laseremitter_tool.name", "Laser Tool")
 language.Add("tool.optics_laseremitter_tool.desc", "Create or modify a Laser Emitter.")
 language.Add("tool.optics_laseremitter_tool.left", "Create a Laser Emitter.")
 language.Add("tool.optics_laseremitter_tool.right", "Apply changes to a Laser Emitter.")

  function TOOL.BuildCPanel(basepanel0)

    local label0 = vgui.Create("DLabel", basepanel0)
    label0:Dock(TOP)
    label0:DockMargin(5, 5, 5, 2.5)
    label0:SetText("This tool helps you with laser emitter, and more.")
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
    collapsible00:SetLabel("Laser Emitter Models")
    collapsible00:SetAnimTime(0.5)
    collapsible00:SetExpanded(false)

    local basepanel1 = vgui.Create("DPanel", collapsible00)
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
    local count = table.Count(modellist0:GetLines())
    basepanel1:SetSize(200, 100 + count * 20)
    modellist0:SetTall(basepanel1:GetTall() - 20)
    modellist0:SetMultiSelect(false)

    modellist0:AddLine("Cylinder Shaped","Default Laser Emitter Model")

    function modellist0:Think()
      local convar01 = GetConVar("Optics_String_SelectedLaserEmitterModel_CLIENT")
      modellist0.OnRowSelected = function(row)
        for k, v in pairs (Optics_LaserEmitterModels_Table) do
           if row == k then
              convar01:SetString(v)
            end
        end
      end
    end

    local collapsible0 = vgui.Create("DCollapsibleCategory", basepanel0)
    basepanel0:AddItem(collapsible0)
    collapsible0:SetPos(10,450)
    collapsible0:SetLabel("Laser Emitter Configuration")
    collapsible0:SetExpanded(false)
    collapsible0:SetSize(400,200)
    collapsible0:SetAnimTime(0.5)

    local basepanel2 = vgui.Create("DPanel", collapsible0)
    basepanel2:SetSize(400, 160)
    basepanel2:Dock(TOP)
    basepanel2:DockPadding(5, 2.5, 5, 2.5)

    local panellist0 = vgui.Create("DPanelList", basepanel2)
    panellist0:SetSpacing(2.5)
    panellist0:EnableHorizontal(false)
    panellist0:EnableVerticalScrollbar(true)
    collapsible0:SetContents(panellist0)

    local checkbox0 = vgui.Create("DCheckBoxLabel", basepanel2)
    checkbox0:SetText("Make No-collide")
    checkbox0:SetTextColor( alphablack0 )
    checkbox0:SizeToContents()
    checkbox0:Dock(TOP)
    checkbox0:DockMargin(2.5, 2.5, 2.5, 5)
    checkbox0:SetConVar("Optics_Bool_NoCollideLaserEmitter_CLIENT")
    checkbox0:SetChecked(false)

    local checkbox1 = vgui.Create("DCheckBoxLabel", basepanel2)
    checkbox1:SetText("Do Weld")
    checkbox1:SetTextColor( alphablack0 )
    checkbox1:SizeToContents()
    checkbox1:Dock(TOP)
    checkbox1:DockMargin(2.5, 5, 2.5, 5)
    checkbox1:SetConVar("Optics_Bool_IsDoWeldLaserEmitter_CLIENT")
    checkbox1:SetChecked(false)

    local checkbox2 = vgui.Create("DCheckBoxLabel", basepanel2)
    checkbox2:SetText("Turn On Laser ( Front )")
    checkbox2:SetTextColor( alphablack0 )
    checkbox2:SizeToContents()
    checkbox2:Dock(TOP)
    checkbox2:DockMargin(2.5, 5, 2.5, 5)
    checkbox2:SetConVar("Optics_Bool_TurnOnLaserEmitter_Front_CLIENT")
    checkbox2:SetChecked(true)

    local checkbox3 = vgui.Create("DCheckBoxLabel", basepanel2)
    checkbox3:SetText("Turn On Laser ( Back )")
    checkbox3:SetTextColor( alphablack0 )
    checkbox3:SizeToContents()
    checkbox3:Dock(TOP)
    checkbox3:DockMargin(2.5, 5, 2.5, 5)
    checkbox3:SetConVar("Optics_Bool_TurnOnLaserEmitter_Back_CLIENT")
    checkbox3:SetChecked(false)

    local desc1 = vgui.Create("DLabel", basepanel2)
    desc1:SetColor(textcolor1)
    desc1:SetText( "Configure the Laser Emitter." )
    desc1:SizeToContents()
    desc1:Dock(BOTTOM)
    desc1:DockMargin(5, 10, 5, 5)

    local slider01 = vgui.Create("DNumSlider", basepanel2)
    slider01:SetText("Laser Width")
    slider01:SetMin(0.1)
    slider01:SetMax(10)
    slider01:SetDecimals(1)
    slider01:Dock(TOP)
    slider01:DockMargin(2.5, 5, 2.5, 5)
    slider01:SetConVar("Optics_Int_LaserWidth_CLIENT")
    slider01:SetDark(true)

  end

end

cleanup.Register("Laser Emitter")

function TOOL:Think()

  if SERVER then

    local convar0 = GetConVar("Optics_String_SelectedLaserEmitterModel_CLIENT")
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

    if trace0.Entity:GetClass() == "optics_laseremitter" then
      ghostent0:SetNoDraw(true)
    end

  end

end

function TOOL:Holster()
   if SERVER then
     self:ReleaseGhostEntity()
   end
end

function TOOL:LeftClick(trace)

   local user0 = self:GetOwner()
   local model0 = GetConVar("Optics_String_SelectedLaserEmitterModel_CLIENT"):GetString()
   local pos0 = trace.HitPos
   local laseremitter = Optics_MakeLaserEmitter(user0, pos0, model0, trace.Entity, trace.PhysicsBone)

   undo.Create( "Laser Emitter" )
     undo.AddEntity( laseremitter )
     undo.AddEntity( laseremitter_constrt )
     undo.SetPlayer( user0 )
     user0:AddCleanup( "Laser Emitter", laseremitter )
     user0:AddCleanup( "Laser Emitter", laseremitter_constrt )
   undo.Finish()

   return true

end

function TOOL:RightClick(trace)

   if IsValid(trace.Entity) == true and trace.Entity:GetClass() == "optics_laseremitter" then
     local laseremitter = trace.Entity

     local convar1 = GetConVar("Optics_Bool_NoCollideLaserEmitter_CLIENT")

     laseremitter:SetNWBool("NoCollide", convar1:GetBool())

     if laseremitter:GetNWBool("NoCollide") == true then
       laseremitter:SetCollisionGroup(COLLISION_GROUP_WORLD)
     else
       laseremitter:SetCollisionGroup(COLLISION_GROUP_NONE)
     end

     local convar2 = GetConVar("Optics_Bool_IsDoWeldLaserEmitter_CLIENT")

     laseremitter:SetNWBool("IsWelded", convar2:GetBool())

     if laseremitter:GetNWBool("IsWelded") == true then
       laseremitter:GetPhysicsObject():EnableMotion(false)
     else
       laseremitter:GetPhysicsObject():EnableMotion(true)
     end

     return true
   end

end