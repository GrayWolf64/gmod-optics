AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

print("Concavelens lua executed!!!!!!!!!!!")

function ENT:Initialize()
  self:SetModel("models/optics/lens/concavelens.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)

 local theobject = self:GetPhysicsObject()

   if theobject:InValid() then
    theobject:Wake()
   end

end
