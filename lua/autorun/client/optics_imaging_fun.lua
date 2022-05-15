if CLIENT then

   MsgC(Color(152 ,251 ,152), "[ OPTICS ] Lens Imaging Function CLIENTSIDE Defined!\n")

   function ConcaveLensImaging(lens)

      local lensindex = lens:EntIndex()
      local angles = lens:GetAngles()
      //local pos_front_processed_world = lens:LocalToWorld(pos_front_processed)
      local angles_front_processed_world = lens:LocalToWorldAngles(angles)
      local pos_direct = lens:GetPos()
      local tar = (ConcaveLensTraces_Front_Table[lensindex]).Entity
      print((tar:GetAngles():Right() * -90).x,(tar:GetAngles():Right() * -90).y)
      local w, h = ScrW(), ScrH()

      local imagingrt1 = GetRenderTarget( "optics_rt_id1", w, h, true )

      cam.Start3D(pos_direct, Angle(-0, -90), fov == 90)
         render.PushRenderTarget( imagingrt1 )
         render.Clear( 0, 255, 64, 255, true )
         if tar:IsValid() == true and tar:GetClass() == "prop_physics" then
          tar:DrawModel()
          local data1 = render.Capture({ format = "jpeg", quality = 40, x = 0, y = 0, w = w, h = h })
          local file1 = file.Open( "cc_imaging_result_front_ent.jpg", "wb", "DATA" )
          file1:Write( data1 )
          file1:Close()
         end
         render.PopRenderTarget()
      cam.End3D()

   end

   function ConvexLensImaging(lens, dist_btwen)

   end

end

--[[local w, h = ScrW(), ScrH()
local customRt = GetRenderTarget( "some_unique_render_target_nameeeee", w, h, true )
cam.Start3D()
render.PushRenderTarget( customRt )

for key, prop in ipairs( ents.FindByClass( "prop_physics" ) ) do
   prop:DrawModel()
end

	local data = render.Capture( {
		format = "png",
		x = 0,
		y = 0,
		w = ScrW(),
		h = ScrH()
	} )

	file.Write( "image.png", data )
render.PopRenderTarget()
cam.End3D()--]]