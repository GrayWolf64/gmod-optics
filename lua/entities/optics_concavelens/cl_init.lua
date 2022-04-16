include("shared.lua")

if CLIENT then
 function ENT:Draw()
   self:DrawModel()
  
   local thisobjectpos = self:GetPos()
   local thisobjectangles = self:GetAngles()

   local detectiontrace_front = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + (thisobjectangles):Forward() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt() ,

     filter = function( ent ) return ( ent:GetClass() == "prop_physics"  ) end
   })
   local detectiontrace_back = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + (thisobjectangles):Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt() ,

     filter = function( ent ) return ( ent:GetClass() == "prop_physics"  ) end
   })
   print( detectiontrace_front.HitPos, detectiontrace_front.Entity, detectiontrace_back.HitPos, detectiontrace_back.Entity )

 local color_red = Color(255, 0, 0)

 hook.Add( "PostDrawTranslucentRenderables", "baseline0", function()
     render.DrawLine( thisobjectpos, thisobjectpos + thisobjectangles:Forward() * 128, color_red )
     render.DrawLine( thisobjectpos, thisobjectpos + thisobjectangles:Right() * 128, color_black )
     render.DrawLine( thisobjectpos, thisobjectpos - thisobjectangles:Right() * 128, color_black )
 end )   

 end
end
