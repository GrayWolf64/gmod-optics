if CLIENT then
   function LensImaging(model, angles, position, size, virtual_or_real)
    local image = ents.Create("prop_physics")
    image:SetModel(model)
    image:SetAngles(angles)
    image:SetPos(position)
    image:SetModelScale(size)
    
   end
end