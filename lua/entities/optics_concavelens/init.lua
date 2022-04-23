AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

MsgC(Color(152 ,251 ,152), "[ OPTICS ] Concave lens Entity script loaded!\n")

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

function ENT:SetupDataTables()

  self:NetworkVar( "Int", 0, "FocalLength" )
  self:NetworkVar( "Bool", 0, "IsWelded" )

  if SERVER then
    convar0 = GetConVar("Optics_ConcaveLensFocalLength")
    self:SetFocalLength(convar0:GetInt())
    convar1 = GetConVar("Optics_Boolean_DoWeldConcaveLens_CLIENT")
    self:SetIsWelded(convar1:GetBool())
  end
end
