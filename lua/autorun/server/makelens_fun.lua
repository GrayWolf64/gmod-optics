if SERVER then
  function MakeConcaveLens(user, pos0, model0)

    local concavelens = ents.Create( "optics_concavelens" )
    concavelens:SetPos(pos0)
    concavelens:SetModel(model0)
    concavelens:Spawn()
    concavelens:SetPos(Vector(pos0.x, pos0.y, pos0.z + concavelens:GetModelRadius()))

    if concavelens:GetNWBool("NoCollide") == true then
      concavelens:SetCollisionGroup(COLLISION_GROUP_WORLD)
    else
      concavelens:SetCollisionGroup(COLLISION_GROUP_NONE)
    end

    if user:IsValid() == true then
     user:AddCount( "Concave Lens", concavelens )
     user:AddCleanup( "Concave Lens", concavelens )
    end

    return concavelens

  end
end