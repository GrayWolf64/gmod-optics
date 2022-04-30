AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

MsgC(Color(152 ,251 ,152), "[ OPTICS ] Concave Lens Entity Script Loaded!\n")

function ENT:Initialize()
  self:SetModel("models/optics/lens/concavelens_dfalt.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)

  local theobject = self:GetPhysicsObject()

   if theobject:IsValid() == true then
    theobject:Wake()
   end

end

function ENT:SetupDataTables()

    local convar0 = GetConVar("Optics_ConcaveLensFocalLength")
    local convar1 = GetConVar("Optics_Boolean_DoWeldConcaveLens_CLIENT")
    local convar2 = GetConVar("Optics_Boolean_NoCollideConcaveLens_CLIENT")

  if SERVER then

    self:SetNWInt("FocalLength", convar0:GetInt())
    self:SetNWBool("IsWelded", convar1:GetBool())
    self:SetNWBool("NoCollide",convar2:GetBool())

  end

end
