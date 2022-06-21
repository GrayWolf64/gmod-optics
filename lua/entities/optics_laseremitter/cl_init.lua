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

    local lasermat = Material("cable/redlaser")  --[[a placeholder material--]]

    if GetConVar("Optics_Bool_TurnOnLaserEmitter_Front_CLIENT"):GetBool() == true then
        Optics_LaserEmitterTraces_Front_Table[index] = util.TraceLine({
           start = thisobjectpos,
           endpos = thisobjectpos + thisobjectangles:Right() * GetConVar("Optics_Int_LaserEmitterTraceMaxLengthFront_CLIENT"):GetInt() ,
           filter = function( ent ) return  ent:GetClass() == "optics_concavelens" or ent:GetClass() == "optics_convexlens" or ent:GetClass() == "player" end
        })

        hook.Add( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables01", function()
          render.SetMaterial(lasermat)
          render.DrawBeam(thisobjectpos, Optics_LaserEmitterTraces_Front_Table[index].HitPos, GetConVar("Optics_Int_LaserWidth_CLIENT"):GetInt(), 0, 1, Color(255,0,0))
        end)

    else

      hook.Add( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables01", function()
        render.ClearStencil()
      end)
      hook.Remove( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables01")

    end

    if GetConVar("Optics_Bool_TurnOnLaserEmitter_Back_CLIENT"):GetBool() == true then
        Optics_LaserEmitterTraces_Back_Table[index] = util.TraceLine({
           start = thisobjectpos,
           endpos = thisobjectpos - thisobjectangles:Right() * GetConVar("Optics_Int_LaserEmitterTraceMaxLengthBack_CLIENT"):GetInt() ,
           filter = function( ent ) return  ent:GetClass() == "optics_concavelens" or ent:GetClass() == "optics_convexlens" or ent:GetClass() == "player" end
        })

        hook.Add( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables02", function()
          render.SetMaterial(lasermat)
          render.DrawBeam(thisobjectpos, Optics_LaserEmitterTraces_Back_Table[index].HitPos, GetConVar("Optics_Int_LaserEmitterWidth_CLIENT"):GetInt(), 0, 1, Color(255,0,0))
        end)

    else

      hook.Add( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables02", function()
        render.ClearStencil()
      end)
      hook.Remove( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables02")

    end

    self:CallOnRemove("Optics_RemoveLaserEmitterBeamRenderablesOnLaserEmitterRemove",function()

      hook.Add( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables01", function()
        render.ClearStencil()
      end)
      hook.Remove( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables01")

      hook.Add( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables02", function()
        render.ClearStencil()
      end)
      hook.Remove( "PostDrawTranslucentRenderables", "Optics_LaserBeamRenderables02")

    end)

  end
end