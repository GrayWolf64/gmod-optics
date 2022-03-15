include("shared.lua")

if CLIENT then
 function ENT:Draw()
   self:DrawModel()
  
   local thisobjectpos = self:GetPos()
   local thisobjectangles = self:GetAngles()

   local detectiontrace_front = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + (thisobjectangles*90):Forward() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt() ,

     filter = function( ent ) return ( ent:GetClass() == "prop_physics"  ) end
   })
   local detectiontrace_back = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + (thisobjectangles*270):Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt() ,

     filter = function( ent ) return ( ent:GetClass() == "prop_physics"  ) end
   })
   print( detectiontrace_front.HitPos, detectiontrace_front.Entity, detectiontrace_back.HitPos, detectiontrace_back.Entity )

 end
end
