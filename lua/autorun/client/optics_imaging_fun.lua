if CLIENT then

   MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info!")
   MsgC(Color(152 ,251 ,152), "[ OPTICS ] Lens Imaging Function CLIENTSIDE Defined!\n")

   function ConcaveLensImaging(lens)  --[[this certainly needs to be optimized--]]

      local lensindex = lens:EntIndex()
      local angles = lens:GetAngles()
      local pos_direct = lens:GetPos()
      local w, h = ScrW(), ScrH()

      local tar_front = (Optics_ConcaveLensTraces_Front_Table[lensindex]).Entity
      local tar_back = (Optics_ConcaveLensTraces_Back_Table[lensindex]).Entity

      local imagestable = file.Find("optics_imaging/*.png","DATA")

      if tar_front:IsValid() == true then

        local imaging_result_front = string.gsub("optics_imaging/concavelens[INDEX]_imaging_result_front.png","INDEX",tostring(lensindex))

        cam.Start3D(pos_direct,angles:Right():Angle(),100)
          render.Clear( 255, 255, 255, 0, true )
          if tar_front:GetClass() == "prop_physics" then  --[[try not to create any new entities--]]
             local rendermode_old_prop0 = tar_front:GetRenderMode()
             tar_front:SetRenderMode(RENDERMODE_NONE)
             tar_front:DrawModel()
             local data0 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
             local file0 = file.Open( imaging_result_front, "wb", "DATA" )
             file0:Write( data0 )
             file0:Close()
             tar_front:SetRenderMode(rendermode_old_prop0)
          end

          if tar_front:IsPlayer() == true and tar_front ~= LocalPlayer() then  --[[this can't take photos of the player in singleplayer--]]
             local rendermode_old_player0 = tar_front:GetRenderMode()
             tar_front:SetRenderMode(RENDERMODE_NONE)
             tar_front:DrawModel()
             local data1 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
             local file1 = file.Open( imaging_result_front, "wb", "DATA" )
             file1:Write( data1 )
             file1:Close()
             tar_front:SetRenderMode(rendermode_old_player0)
          end

          if tar_front == LocalPlayer() then  --[[this may take photos of the player in singleplayer--]]
             local plymodel0 = ClientsideModel(tar_front:GetModel(),RENDERGROUP_BOTH)
             plymodel0:SetNoDraw(true)
             plymodel0:SetPos(Vector(0,0,0))
             local modelradius = plymodel0:GetModelRadius()
             plymodel0:SetAngles(Angle(0, tar_front:EyeAngles().yaw, tar_front:EyeAngles().roll))
             plymodel0:SetSequence(tar_front:GetSequence())
             cam.Start3D(Vector(0, 0 + modelradius, 0 + modelradius / 2), Angle(0, -90, 0), 90, w == w, h == w)
                plymodel0:DrawModel()
                local data2 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
                local file2 = file.Open( imaging_result_front, "wb", "DATA" )
             cam.End3D()
             file2:Write( data2 )
             file2:Close()
             timer.Simple(10, function() plymodel0:SetNoDraw(true); plymodel0:Remove() end)  --[[delete ing the unnecessary model--]]
          end
        cam.End3D()

        for k, v in pairs (imagestable) do
           if string.find(v,"front") ~= nil then
            local imaging_result_front_path = "../data/" .. imaging_result_front
            Optics_ConcaveLensImagingResult_Material_Front_Table[lensindex] = Material(imaging_result_front_path)
            Optics_ConcaveLensImagingResult_Material_Front_Table[lensindex]:SetInt("$translucent", 1)
           end
        end

      elseif tar_back:IsValid() == true then

         local imaging_result_back = string.gsub("optics_imaging/concavelens[INDEX]_imaging_result_back.png","INDEX",tostring(lensindex))

         cam.Start3D(pos_direct,angles:Right():Angle():Right():Angle():Right():Angle(),100)
          render.Clear( 255, 255, 255, 0, true )

          if tar_back:GetClass() == "prop_physics" then
             local rendermode_old_prop1 = tar_back:GetRenderMode()
             tar_back:SetRenderMode(RENDERMODE_NONE)
             tar_back:DrawModel()
             local data3 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
             local file3 = file.Open( imaging_result_back, "wb", "DATA" )
             file3:Write( data3 )
             file3:Close()
             tar_back:SetRenderMode(rendermode_old_prop1)
          end

          if tar_back:IsPlayer() == true and tar_back ~= LocalPlayer() then
             local rendermode_old_player1 = tar_back:GetRenderMode()
             tar_back:SetRenderMode(RENDERMODE_NONE)
             tar_back:DrawModel()
             local data4 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
             local file4 = file.Open( imaging_result_back, "wb", "DATA" )
             file4:Write( data4 )
             file4:Close()
             tar_back:SetRenderMode(rendermode_old_player1)
          end

          if tar_back == LocalPlayer() then
             local plymodel1 = ClientsideModel(tar_back:GetModel(),RENDERGROUP_BOTH)
             plymodel1:SetNoDraw(true)
             plymodel1:SetPos(Vector(0,0,0))
             local modelradius = plymodel1:GetModelRadius()
             plymodel1:SetAngles(Angle(0, tar_back:EyeAngles().yaw, tar_back:EyeAngles().roll))
             plymodel1:SetSequence(tar_back:GetSequence())
             cam.Start3D(Vector(0, 0 + modelradius, 0 + modelradius / 2), Angle(0, -90, 0), 90, w == w, h == w)
                plymodel1:DrawModel()
                local data5 = render.Capture({ format = "png", quality = 75, x = 0, y = 0, w = w, h = h, alpha = true })
                local file5 = file.Open( imaging_result_back, "wb", "DATA" )
             cam.End3D()
             file5:Write( data5 )
             file5:Close()
             timer.Simple(10, function() plymodel1:SetNoDraw(true); plymodel1:Remove() end)
          end
         cam.End3D()

         for k, v in pairs (imagestable) do
           if string.find(v,"back") ~= nil then
            local imaging_result_back_path = "../data/" .. imaging_result_back
            Optics_ConcaveLensImagingResult_Material_Back_Table[lensindex] = Material(imaging_result_back_path)
            Optics_ConcaveLensImagingResult_Material_Back_Table[lensindex]:SetInt("$translucent", 1)
           end
         end

      end

      lens:CallOnRemove("Optics_DeleteImagingFilesOnLensRemove",function()  --[[delete ing the unnecessary files on lens remove--]]
         for k, v in pairs (imagestable) do
           if string.find(v,"concavelens") ~= nil then
            file.Delete("optics_imaging/" .. v)
           end
         end
      end)

   end

   function ConvexLensImaging(lens)

   end

end