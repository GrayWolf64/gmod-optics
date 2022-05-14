include("shared.lua")

if CLIENT then
  function ENT:Draw()

   self:DrawModel()

  end

end

if CLIENT then  //i don't know if it matches the name of this file

  function ENT:Think()
   local index = self:EntIndex()

   local thisobjectpos = self:GetPos()
   local thisobjectangles = self:GetAngles()

   ConcaveLensTraces_Front_Table[index] = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + thisobjectangles:Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt() ,
     filter = function( ent ) return  ent:GetClass() == "prop_physics" or ent:GetClass() == "player"  end
   })

   ConcaveLensTraces_Back_Table[index] = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos - thisobjectangles:Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt() ,
     filter = function( ent ) return  ent:GetClass() == "prop_physics" or ent:GetClass() == "player"  end
   })

    //print(detectiontrace_front.Entity, detectiontrace_back.Entity)

    local convar0 = GetConVar("Optics_Boolean_IsImaging_PointedConcaveLens_CLIENT")

    if IsValid((ConcaveLensTraces_Front_Table[index]).Entity) == true or IsValid((ConcaveLensTraces_Back_Table[index]).Entity) == true then
      self:SetNWBool("IsImaging", true)
      convar0:SetBool(self:GetNWBool("IsImaging"))
    else
      convar0:SetBool(false)
    end
  end
 end
