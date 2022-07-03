AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local color0 = Color(214 ,214 ,214)
if CLIENT then
  MsgC(color0,"┏━━━━━━━━━━━━━━━━━━━━CLIENT━━━━━━━━━━━━━━━━━━━━┓\n")
  MsgC(color0,"┃[ OPTICS ] Debug Info: LaserEmitter Entity OK!┃\n")
  MsgC(color0,"┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n")
else
  MsgC(color0,"[ OPTICS ] Debug Info: LaserEmitter Entity OK!\n")
end

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