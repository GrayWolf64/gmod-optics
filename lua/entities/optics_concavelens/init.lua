AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

print("[Optics]Concave lens lua loaded!")

function ENT:Initialize()
  self:SetModel("models/optics/lens/concavelens.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)

 local theobject = self:GetPhysicsObject()

   if theobject:IsValid() then
    theobject:Wake()
   end

end
