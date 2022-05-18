if CLIENT then

   MsgC(Color(152 ,251 ,152), "[ OPTICS ] Lens Imaging Function CLIENTSIDE Defined!\n")

   function ConcaveLensImaging(lens)

      local lensindex = lens:EntIndex()
      local angles = lens:GetAngles()
      local pos_direct = lens:GetPos()
      local tar = (ConcaveLensTraces_Front_Table[lensindex]).Entity
      local w, h = 1024, 1024
      local imagingrt1 = GetRenderTarget( "optics_rt_id1", w, h, true )

      if tar:IsValid() == true then

         local filename0 = string.gsub("ConcaveLens[#INDEX#]_imaging_result_front_obj.png","#INDEX#",tostring(lensindex))
         //local filename1 = string.gsub("ConcaveLens[#INDEX#]_imaging_result_front_ply.png","#INDEX#",tostring(lensindex))

        cam.Start3D(pos_direct,angles:Right():Angle(),90)
          render.PushRenderTarget( imagingrt1 )
          render.Clear( 255, 255, 255, 0, true )

          if tar:GetClass() == "prop_physics" then
             local rendermode_old = tar:GetRenderMode()
             tar:SetRenderMode(RENDERMODE_NONE)

             tar:DrawModel()
             local data1 = render.Capture({ format = "png", quality = 70, x = 0, y = 0, w = w, h = h, alpha = true })
             local file1 = file.Open( filename0, "wb", "DATA" )
             file1:Write( data1 )
             file1:Close()
             tar:SetRenderMode(rendermode_old)
          end

          --[[if tar:GetClass() == "player" then
            local rendermode_old = tar:GetRenderMode()
            tar:SetRenderMode(RENDERMODE_NONE)

            tar:DrawModel()
            local data2 = render.Capture({ format = "png", quality = 70, x = 0, y = 0, w = w, h = h, alpha = true })
            local file2 = file.Open( filename1, "wb", "DATA" )
            file2:Write( data2 )
            file2:Close()
            tar:SetRenderMode(rendermode_old)
          end--]]

          render.PopRenderTarget()
        cam.End3D()
      end


   end

   function ConvexLensImaging(lens)

   end

end