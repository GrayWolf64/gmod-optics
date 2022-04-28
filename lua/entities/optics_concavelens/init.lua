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
  convar0 = GetConVar("Optics_ConcaveLensFocalLength")

  self:SetNWInt( "FocalLength" , convar0:GetInt() )
  self:SetNWBool( "IsWelded" ,false )
  self:SetNWBool( "NoCollide" ,false)
  self:SetNWBool( "IsImaging" ,false)

  if SERVER then
    convar0 = GetConVar("Optics_ConcaveLensFocalLength")
    self:SetNWInt("FocalLength", convar0:GetInt())
    convar1 = GetConVar("Optics_Boolean_DoWeldConcaveLens_CLIENT")
    self:SetNWBool("IsWelded", convar1:GetBool())
    convar2 = GetConVar("Optics_Boolean_NoCollideConcaveLens_CLIENT")
    self:SetNWBool("NoCollide",convar2:GetBool())

  end
end
