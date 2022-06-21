AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info!")
MsgC(Color(152 ,251 ,152), "Concave Lens Entity OK!\n")

function ENT:Initialize()
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)

  local theobject = self:GetPhysicsObject()

   if theobject:IsValid() == true then
    theobject:Wake()
   end

end

function ENT:SetupDataTables()

    local convar0 = GetConVar("Optics_Int_ConcaveLensFocalLength")
    local convar1 = GetConVar("Optics_Bool_IsDoWeldConcaveLens_CLIENT")
    local convar2 = GetConVar("Optics_Bool_NoCollideConcaveLens_CLIENT")

  if SERVER or CLIENT then

    self:SetNWInt("FocalLength", convar0:GetInt())
    self:SetNWBool("IsWelded", convar1:GetBool())
    self:SetNWBool("NoCollide",convar2:GetBool())
    --[[IsImaging is in cl_init--]]

  end


end