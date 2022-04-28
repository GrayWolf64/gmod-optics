include("shared.lua")

if CLIENT then
  function ENT:Draw()

   self:DrawModel()

   local thisobjectpos = self:GetPos()
   local thisobjectangles = self:GetAngles()

   detectiontrace_front = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + thisobjectangles:Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt() ,
     filter = function( ent ) return  ent:GetClass() == "prop_physics" or ent:GetClass() == "player"  end
   })

   detectiontrace_back = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos - thisobjectangles:Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt() ,
     filter = function( ent ) return  ent:GetClass() == "prop_physics" or ent:GetClass() == "player"  end
   })

    //print(detectiontrace_front.Entity, detectiontrace_back.Entity)
    local convar0 = GetConVar("Optics_Boolean_IsImaging_PointedConcaveLens_CLIENT")
    if IsValid(detectiontrace_front.Entity) == true or IsValid(detectiontrace_back.Entity) == true then
      self:SetNWBool("IsImaging", true)
      convar0:SetBool(self:GetNWBool("IsImaging"))
    else
      convar0:SetBool(false)
    end

  end
end