include("shared.lua")

if CLIENT then
  function ENT:Draw()
   self:DrawModel()
  end
end

if CLIENT then

  function ENT:Think()
   local index = self:EntIndex()

   local thisobjectpos = self:GetPos()
   local thisobjectangles = self:GetAngles()
   --[[have no choice but to do this to specify the traces for each concave lens--]]
   Optics_ConcaveLensTraces_Front_Table[index] = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + thisobjectangles:Right() * GetConVar("Optics_Int_LensTraceMaxLengthFront_CLIENT"):GetInt() ,
     filter = function( ent ) return  ent:GetClass() == "prop_physics" or ent:GetClass() == "player" or ent:GetClass() == "npc_*" end
   })

   Optics_ConcaveLensTraces_Back_Table[index] = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos - thisobjectangles:Right() * GetConVar("Optics_Int_LensTraceMaxLengthBack_CLIENT"):GetInt() ,
     filter = function( ent ) return  ent:GetClass() == "prop_physics" or ent:GetClass() == "player" or ent:GetClass() == "npc_*" end
   })

    if IsValid((Optics_ConcaveLensTraces_Front_Table[index]).Entity) == true or IsValid((Optics_ConcaveLensTraces_Back_Table[index]).Entity) == true then
      self:SetNWBool("IsImaging", true)
    else
      self:SetNWBool("IsImaging", false)
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

  end

end