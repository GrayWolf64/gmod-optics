include("shared.lua")

if CLIENT then
 function ENT:Draw()
   self:DrawModel()
  
   local thisobjectpos = self:GetPos()
   local thisobjectangles = self:GetAngles()

   local detectiontrace_front = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos + (thisobjectangles):Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt() ,

     filter = function( ent ) return ( ent:GetClass() == "prop_physics"  ) end
   })
   local detectiontrace_back = util.TraceLine({
     start = thisobjectpos,
     endpos = thisobjectpos - (thisobjectangles):Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt() ,

     filter = function( ent ) return ( ent:GetClass() == "prop_physics"  ) end
   })
   print( detectiontrace_front.HitPos, detectiontrace_front.Entity, detectiontrace_back.HitPos, detectiontrace_back.Entity )

    local linecolor0 = Color(0, 0, 0)
    hook.Add( "PostDrawTranslucentRenderables", "baseline0", function()
        render.DrawLine( thisobjectpos, thisobjectpos + thisobjectangles:Right() * GetConVar("Optics_LensMaxDetectionDistanceFront"):GetInt(), linecolor0 )
        render.DrawLine( thisobjectpos, thisobjectpos - thisobjectangles:Right() * GetConVar("Optics_LensMaxDetectionDistanceBack"):GetInt(), linecolor0 )
    end )   

    local spritecolor0 = Color(255 ,0 , 0)
    hook.Add( "PostDrawTranslucentRenderables", "pointsprites0", function()
      render.DrawWireframeSphere( thisobjectpos, 2, 8, 8, spritecolor0 )
    end )
 end
end
