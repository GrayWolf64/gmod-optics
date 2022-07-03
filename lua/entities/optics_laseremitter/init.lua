AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

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

  local convar1 = GetConVar("Optics_Bool_IsDoWeldLaserEmitter_CLIENT")
  local convar2 = GetConVar("Optics_Bool_NoCollideLaserEmitter_CLIENT")

if SERVER or CLIENT then

  self:SetNWBool("IsWelded", convar1:GetBool())
  self:SetNWBool("NoCollide",convar2:GetBool())

end


end