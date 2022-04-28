if SERVER then
  function MakeConcaveLens(user, pos0, model0)

    local concavelens = ents.Create( "optics_concavelens" )
    concavelens:SetPos(Vector(pos0.x, pos0.y, pos0.z + 12))
    concavelens:SetModel(model0)
    concavelens:Spawn()
    concavelens:SetPos(Vector(pos0.x, pos0.y, pos0.z + concavelens:GetModelRadius()))

    if user:IsValid() == true then
     user:AddCount( "Concave Lens", concavelens )
     user:AddCleanup( "Concave Lens", concavelens )
    end

    return concavelens

  end
end