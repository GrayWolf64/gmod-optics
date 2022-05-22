if CLIENT then

   MsgC(Color(152 ,251 ,152), "[ OPTICS ] Lens Imaging Function CLIENTSIDE Defined!\n")

   function ConcaveLensImaging(lens)

      local lensindex = lens:EntIndex()
      local angles = lens:GetAngles()
      local pos_direct = lens:GetPos()

      local tar_front = (Optics_ConcaveLensTraces_Front_Table[lensindex]).Entity
      local w, h = ScrW(), ScrH()

      if tar_front:IsValid() == true then

         local filename0 = string.gsub("concavelens[INDEX]_imaging_result_front_obj.png","INDEX",tostring(lensindex))
         local filename1 = string.gsub("concavelens[INDEX]_imaging_result_front_ply_other.png","INDEX",tostring(lensindex))
         local filename2 = string.gsub("concavelens[INDEX]_imaging_result_front_ply_local.png","INDEX",tostring(lensindex))
        cam.Start3D(pos_direct,angles:Right():Angle(),100)
          render.Clear( 255, 255, 255, 0, true )

          local rendermode_old = tar_front:GetRenderMode()

          if tar_front:GetClass() == "prop_physics" then  --[[try not to create any new entities--]]
             tar_front:SetRenderMode(RENDERMODE_NONE)
             tar_front:DrawModel()
             local data0 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
             local file0 = file.Open( filename0, "wb", "DATA" )
             file0:Write( data0 )
             file0:Close()
             tar_front:SetRenderMode(rendermode_old)
          end

          if tar_front:IsPlayer() == true and tar_front ~= LocalPlayer() then  --[[this can't take photos of the player in singleplayer--]]
             tar_front:SetRenderMode(RENDERMODE_NONE)
             tar_front:DrawModel()
             local data1 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
             local file1 = file.Open( filename1, "wb", "DATA" )
             file1:Write( data1 )
             file1:Close()
             tar_front:SetRenderMode(rendermode_old)
          end

          if tar_front == LocalPlayer() then  --[[this may take photos of the player in singleplayer--]]
             local plymodel = ClientsideModel(tar_front:GetModel(),RENDERGROUP_BOTH)
             plymodel:SetNoDraw(true)
             plymodel:SetPos(Vector(0,0,0))
             local modelradius = plymodel:GetModelRadius()
             plymodel:SetAngles(Angle(0, tar_front:EyeAngles().yaw, tar_front:EyeAngles().roll))
             plymodel:SetSequence(tar_front:GetSequence())
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

        cam.End3D()
      else
         local imagestable = file.Find("*.png","DATA")
         for k, v in pairs (imagestable) do
            if string.find(v,"concavelens") ~= nil then
               file.Delete(v)  --[[delete ing the unnecessary files--]]
            end
         end
      end

   end

   function ConvexLensImaging(lens)

   end

end