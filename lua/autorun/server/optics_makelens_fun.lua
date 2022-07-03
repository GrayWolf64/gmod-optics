if SERVER then

  local color0 = Color(214 ,214 ,214)
  MsgC(color0,"[ OPTICS ] Debug Info: MakeLens Function SERVERSIDE OK!\n")

  function Optics_MakeConcaveLens(user, pos, model, trace_ent, trace_physbone)
    local trace = user:GetEyeTrace()

    local thingangle = trace.HitNormal:Angle()
    thingangle.pitch = thingangle.pitch + 90

    local concavelens = ents.Create( "optics_concavelens" )
    concavelens:SetPos(pos)
    concavelens:SetModel(model); local modelmin = concavelens:OBBMins()
    concavelens:Spawn()
    concavelens:SetPos(trace.HitPos - trace.HitNormal * modelmin.z)
    concavelens:SetAngles(thingangle)

    if concavelens:GetNWBool("NoCollide") == true then
      concavelens:SetCollisionGroup(COLLISION_GROUP_WORLD)
    else
      concavelens:SetCollisionGroup(COLLISION_GROUP_NONE)
    end

    if concavelens:GetNWBool("IsWelded") == true then
      concavelens:GetPhysicsObject():EnableMotion(false)
      if trace_ent:IsValid() == true and concavelens:IsValid() == true then
         concavelens_constrt = constraint.Weld(concavelens, trace_ent, 0, trace_physbone, 0, true, true)
      end
    end

    if user:IsValid() == true then
     user:AddCount( "Concave Lens", concavelens )
    end

    return concavelens, concavelens_constrt

  end
end