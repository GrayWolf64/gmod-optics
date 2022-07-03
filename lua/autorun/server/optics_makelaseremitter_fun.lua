if SERVER then

    local color0 = Color(214 ,214 ,214)
    MsgC(color0,"[ OPTICS ] Debug Info: MakeLaserEmitter Function SERVERSIDE OK!\n")

    function Optics_MakeLaserEmitter(user, pos, model, trace_ent, trace_physbone)
      local trace = user:GetEyeTrace()

      local thingangle = trace.HitNormal:Angle()
      thingangle.pitch = thingangle.pitch + 90

      local laseremitter = ents.Create( "optics_laseremitter" )
      laseremitter:SetPos(pos)
      laseremitter:SetModel(model); local modelmin = laseremitter:OBBMins()
      laseremitter:Spawn()
      laseremitter:SetPos(trace.HitPos - trace.HitNormal * modelmin.z)
      laseremitter:SetAngles(thingangle)

      if laseremitter:GetNWBool("NoCollide") == true then
        laseremitter:SetCollisionGroup(COLLISION_GROUP_WORLD)
      else
        laseremitter:SetCollisionGroup(COLLISION_GROUP_NONE)
      end

      if laseremitter:GetNWBool("IsWelded") == true then
        laseremitter:GetPhysicsObject():EnableMotion(false)
        if trace_ent:IsValid() == true and laseremitter:IsValid() == true then
           laseremitter_constrt = constraint.Weld(laseremitter, trace_ent, 0, trace_physbone, 0, true, true)
        end
      end

      if user:IsValid() == true then
       user:AddCount( "Laser Emitter", laseremitter )
      end

      return laseremitter, laseremitter_constrt

    end

end