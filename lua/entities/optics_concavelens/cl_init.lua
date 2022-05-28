include("shared.lua")

if CLIENT then
  function ENT:Draw()

   self:DrawModel()

  end
end

if CLIENT then  --[[i don't know if it matches the name of this file--]]

  function ENT:Think()
   local index = self:EntIndex()

   local thisobjectpos = self:GetPos()
   local thisobjectangles = self:GetAngles()
   --[[have no choice but to do this to specify the traces for each concave lens--]]
   Optics_ConcaveLensTraces_Front_Table[index] = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + thisobjectangles:Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt() ,
     filter = function( ent ) return  ent:GetClass() == "prop_physics" or ent:GetClass() == "player" or ent:GetClass() == "npc_*" end
   })

   Optics_ConcaveLensTraces_Back_Table[index] = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos - thisobjectangles:Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt() ,
     filter = function( ent ) return  ent:GetClass() == "prop_physics" or ent:GetClass() == "player" or ent:GetClass() == "npc_*" end
   })

    local convar0 = GetConVar("Optics_Boolean_IsImaging_PointedConcaveLens_CLIENT")
    if IsValid((Optics_ConcaveLensTraces_Front_Table[index]).Entity) == true or IsValid((Optics_ConcaveLensTraces_Back_Table[index]).Entity) == true then
      self:SetNWBool("IsImaging", true)
      convar0:SetBool(true)
    else
      self:SetNWBool("IsImaging", false)
      convar0:SetBool(false)
    end

    if IsValid((Optics_ConcaveLensTraces_Front_Table[index]).Entity) == true then
      self:SetNWBool("IsImagingFront", true)
    else
      self:SetNWBool("IsImagingFront", false)
    end

    if IsValid((Optics_ConcaveLensTraces_Back_Table[index]).Entity) == true then
      self:SetNWBool("IsImagingBack", true)
    else
      self:SetNWBool("IsImagingBack", false)
    end

    ConcaveLensImaging(self)
  end
end