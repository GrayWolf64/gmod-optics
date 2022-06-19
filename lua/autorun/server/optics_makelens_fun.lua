if SERVER then

  MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info!")
  MsgC(Color(152 ,251 ,152), "MakeLens Function SERVERSIDE Defined!\n")

  function MakeConcaveLens(user, pos, model, trace_ent, trace_physbone)

    local concavelens = ents.Create( "optics_concavelens" )
    concavelens:SetPos(pos)
    concavelens:SetModel(model)
    concavelens:Spawn()
    concavelens:SetPos(Vector(pos.x, pos.y, pos.z + concavelens:GetModelRadius()))

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
     user:AddCleanup( "Concave Lens", concavelens )
    end

    return concavelens, concavelens_constrt

  end
end