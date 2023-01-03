TOOL.Tab = "Optics"
TOOL.Category = "Lens"
TOOL.Name = "Concave Lens"
TOOL.Command = nil
TOOL.ConfigName = ""

if CLIENT then
    local toolfontcolor1 = Color(255, 20, 20)
    local toolfontcolor2 = Color(105, 105, 105)
    local textcolor1 = Color(190, 190, 190)
    local alphablack0 = Color(0, 0, 0, 255)

    TOOL.Information = {"left", "right"}

    language.Add("tool.optics_concavelens_tool.name", "Concave Lens Tool")
    language.Add("tool.optics_concavelens_tool.desc", "Create or modify a Concave Lens.")
    language.Add("tool.optics_concavelens_tool.left", "Create a Concave Lens.")
    language.Add("tool.optics_concavelens_tool.right", "Apply changes to a Concave Lens.")

    function TOOL:DrawToolScreen(width, height)
        local concavelens_material = Material("vgui/concavelens_double")
        concavelens_material:SetInt("$flags", bit.bor(concavelens_material:GetInt("$flags"), 32768))
        surface.SetDrawColor(toolfontcolor2)
        surface.DrawRect(0, 0, width, height)
        draw.SimpleText("Optics", "opticsdefaultfont", width / 2, height / 7, toolfontcolor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("--Concave Lens", "opticsdefaultfontbdita", width / 2, height / 2.8, toolfontcolor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(toolfontcolor1)
        surface.SetMaterial(concavelens_material)
        surface.DrawTexturedRect(width / 5, height / 2.2, concavelens_material:Width() / 4, concavelens_material:Height() / 4)
    end

    function TOOL.BuildCPanel(basepanel0)
        local label0 = vgui.Create("DLabel", basepanel0)
        label0:Dock(TOP)
        label0:DockMargin(5, 5, 5, 2.5)
        label0:SetText("This tool helps you with concave lens, and more.")
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
        collapsible00:SetLabel("Lens Models")
        collapsible00:SetAnimTime(0.5)
        collapsible00:SetExpanded(false)
        local basepanel1 = vgui.Create("DPanel", collapsible00)
        basepanel1:DockMargin(0, 5, 2.5, 5)
        basepanel1:Dock(TOP)
        local listlayout00 = vgui.Create("DListLayout", basepanel1)
        collapsible00:SetContents(listlayout00)
        local desc0 = vgui.Create("DLabel", basepanel1)
        desc0:SetColor(textcolor1)
        desc0:SetText("Model Selection, click one to choose it.")
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
        modellist0:AddLine("Double Concave Lens", "Default Concave Lens Model")
        local collapsible0 = vgui.Create("DCollapsibleCategory", basepanel0)
        basepanel0:AddItem(collapsible0)
        collapsible0:SetPos(10, 450)
        collapsible0:SetLabel("Lens Configuration")
        collapsible0:SetExpanded(false)
        collapsible0:SetSize(400, 200)
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
        checkbox0:SetTextColor(alphablack0)
        checkbox0:SizeToContents()
        checkbox0:Dock(TOP)
        checkbox0:DockMargin(2.5, 2.5, 2.5, 5)
        checkbox0:SetConVar("Optics_Bool_NoCollideConcaveLens_CLIENT")
        checkbox0:SetChecked(false)
        local checkbox1 = vgui.Create("DCheckBoxLabel", basepanel2)
        checkbox1:SetText("Do Weld")
        checkbox1:SetTextColor(alphablack0)
        checkbox1:SizeToContents()
        checkbox1:Dock(TOP)
        checkbox1:DockMargin(2.5, 5, 2.5, 5)
        checkbox1:SetConVar("Optics_Bool_IsDoWeldConcaveLens_CLIENT")
        checkbox1:SetChecked(false)
        local desc1 = vgui.Create("DLabel", basepanel2)
        desc1:SetColor(textcolor1)
        desc1:SetText("Configure the Concave Lens.")
        desc1:SizeToContents()
        desc1:Dock(BOTTOM)
        desc1:DockMargin(5, 10, 5, 5)
        local slider1 = vgui.Create("DNumSlider", basepanel2)
        slider1:Dock(TOP)
        slider1:SetText("Focal length")
        slider1:SetDark(true)
        slider1:SetMin(-1000)
        slider1:SetMax(0)
        slider1:SetDecimals(0)
        slider1:SetConVar("Optics_Int_ConcaveLensFocalLength")

        function modellist0:Think()
            local convar01 = GetConVar("Optics_String_SelectedConcaveLensModel_CLIENT")

            modellist0.OnRowSelected = function(row)
                for k, v in pairs(Optics_ConcaveLensModels_Table) do
                    if row == k then
                        convar01:SetString(v)
                    end
                end
            end
        end
    end
end

cleanup.Register("Concave Lens")

function TOOL:Think()
    if SERVER then
        local convar0 = GetConVar("Optics_String_SelectedConcaveLensModel_CLIENT")
        local user0 = self:GetOwner()
        self:MakeGhostEntity(convar0:GetString(), user0:GetPos(), user0:GetAngles())
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
end

function TOOL:Holster()
    if SERVER then
        self:ReleaseGhostEntity()
    end
end

function TOOL:LeftClick(trace)
    local user0 = self:GetOwner()
    local model0 = GetConVar("Optics_String_SelectedConcaveLensModel_CLIENT"):GetString()
    local pos0 = trace.HitPos
    local concavelens = Optics_MakeConcaveLens(user0, pos0, model0, trace.Entity, trace.PhysicsBone)
    undo.Create("Concave Lens")
    undo.AddEntity(concavelens)
    undo.AddEntity(concavelens_constrt)
    undo.SetPlayer(user0)
    user0:AddCleanup("Concave Lens", concavelens)
    user0:AddCleanup("Concave Lens", concavelens_constrt)
    undo.Finish()

    return true
end

function TOOL:RightClick(trace)
    if IsValid(trace.Entity) == true and trace.Entity:GetClass() == "optics_concavelens" then
        local concavelens = trace.Entity
        local convar0 = GetConVar("Optics_Int_ConcaveLensFocalLength")
        local convar1 = GetConVar("Optics_Bool_NoCollideConcaveLens_CLIENT")
        concavelens:SetNWInt("FocalLength", convar0:GetInt())
        concavelens:SetNWBool("NoCollide", convar1:GetBool())

        if concavelens:GetNWBool("NoCollide") == true then
            concavelens:SetCollisionGroup(COLLISION_GROUP_WORLD)
        else
            concavelens:SetCollisionGroup(COLLISION_GROUP_NONE)
        end

        local convar2 = GetConVar("Optics_Bool_IsDoWeldConcaveLens_CLIENT")
        concavelens:SetNWBool("IsWelded", convar2:GetBool())

        if concavelens:GetNWBool("IsWelded") == true then
            concavelens:GetPhysicsObject():EnableMotion(false)
        else
            concavelens:GetPhysicsObject():EnableMotion(true)
        end

        return true
    end
end