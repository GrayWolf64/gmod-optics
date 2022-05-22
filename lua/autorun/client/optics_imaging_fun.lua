if CLIENT then

   MsgC(Color(152 ,251 ,152), "[ OPTICS ] Lens Imaging Function CLIENTSIDE Defined!\n")

   function ConcaveLensImaging(lens)

      local lensindex = lens:EntIndex()
      local angles = lens:GetAngles()
      local pos_direct = lens:GetPos()

      local tar = (Optics_ConcaveLensTraces_Front_Table[lensindex]).Entity
      local w, h = ScrW(), ScrH()
      //local imagingrt1 = GetRenderTarget( "optics_rt_concavelens_imaging", w, h, true )

      if tar:IsValid() == true then

         local filename0 = string.gsub("concavelens[INDEX]_imaging_result_front_obj.png","INDEX",tostring(lensindex))
         local filename1 = string.gsub("concavelens[INDEX]_imaging_result_front_ply_other.png","INDEX",tostring(lensindex))
         local filename2 = string.gsub("concavelens[INDEX]_imaging_result_front_ply_local.png","INDEX",tostring(lensindex))
        cam.Start3D(pos_direct,angles:Right():Angle(),100)
          //render.PushRenderTarget( imagingrt1 )
          render.Clear( 255, 255, 255, 0, true )

          local rendermode_old = tar:GetRenderMode()

          if tar:GetClass() == "prop_physics" then  //try not to create any new entities
             tar:SetRenderMode(RENDERMODE_NONE)
             tar:DrawModel()
             local data0 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
             local file0 = file.Open( filename0, "wb", "DATA" )
             file0:Write( data0 )
             file0:Close()
             tar:SetRenderMode(rendermode_old)
          end

          if tar:IsPlayer() == true and tar ~= LocalPlayer() then  // this can't take photos of the player in singleplayer
             tar:SetRenderMode(RENDERMODE_NONE)
             tar:DrawModel()
             local data1 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
             local file1 = file.Open( filename1, "wb", "DATA" )
             file1:Write( data1 )
             file1:Close()
             tar:SetRenderMode(rendermode_old)
          end

          if tar == LocalPlayer() then  // this may take photos of the player in singleplayer
             local plymodel = ClientsideModel(tar:GetModel(),RENDERGROUP_BOTH)
             plymodel:SetNoDraw(true)
             plymodel:SetPos(Vector(0,0,0))
             local modelradius = plymodel:GetModelRadius()
             plymodel:SetAngles(Angle(0, tar:EyeAngles().yaw, tar:EyeAngles().roll))
             plymodel:SetSequence(tar:GetSequence())
             cam.Start3D(Vector(0, 0 + modelradius, 0 + modelradius / 2), Angle(0, -90, 0), 90, w == w, h == w)
              plymodel:DrawModel()
              local data2 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
              local file2 = file.Open( filename2, "wb", "DATA" )
             cam.End3D()
             file2:Write( data2 )
             file2:Close()
          else
             if plymodel:IsValid() == true then
                plymodel:Remove()
             end
          end

          //render.PopRenderTarget()
        cam.End3D()
      else
         local imagestable = file.Find("*.png","DATA")
         for k, v in pairs (imagestable) do
            if string.find(v,"concavelens") ~= nil then
               file.Delete(v)
            end
         end
      end

   end

   function ConvexLensImaging(lens)

   end

end