AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

MsgC(Color(152 ,251 ,152), "[ OPTICS ] Concave Lens Entity Script Loaded!\n")

function ENT:Initialize()
  self:SetModel("models/optics/lens/concavelens.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)

  local theobject = self:GetPhysicsObject()

   if theobject:IsValid() == true then
    theobject:Wake()
   end

end

function ENT:SetupDataTables()

  if SERVER then

    convar0 = GetConVar("Optics_ConcaveLensFocalLength")
    convar1 = GetConVar("Optics_Boolean_DoWeldConcaveLens_CLIENT")
    convar2 = GetConVar("Optics_Boolean_NoCollideConcaveLens_CLIENT")

    self:SetNWInt("FocalLength", convar0:GetInt())
    self:SetNWBool("IsWelded", convar1:GetBool())
    self:SetNWBool("NoCollide",convar2:GetBool())
    print(self:GetNWBool("NoCollide"))

  end

end
