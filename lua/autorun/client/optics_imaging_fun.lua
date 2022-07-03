if CLIENT then

   function ConvexLensImaging(lens)  --[[this certainly needs to be optimized--]]

      local lensindex = lens:EntIndex()
      local angles = lens:GetAngles()
      local pos_direct = lens:GetPos()
      local w, h = ScrW(), ScrH()

      local tar_front = (Optics_ConvexLensTraces_Front_Table[lensindex]).Entity
      local tar_back = (Optics_ConvexLensTraces_Back_Table[lensindex]).Entity

      local imagestable = file.Find("optics_imaging/*.png","DATA")

      local imagingquality = GetConVar("Optics_Int_LensImagingQuality_CLIENT"):GetInt()

      if tar_front:IsValid() == true then

        local imaging_result_front = string.gsub("optics_imaging/convexlens[INDEX]_imaging_result_front.png","INDEX",tostring(lensindex))

        cam.Start3D(pos_direct,angles:Right():Angle(),100)
          render.Clear( 255, 255, 255, 0, true )
          if tar_front:GetClass() == "prop_physics" then  --[[try not to create any new entities--]]
             local rendermode_old_prop0 = tar_front:GetRenderMode()
             tar_front:SetRenderMode(RENDERMODE_NONE)
             tar_front:DrawModel()
             local data0 = render.Capture({ format = "png", quality = imagingquality, x = 0, y = 0, w = w, h = h, alpha = true })
             local file0 = file.Open( imaging_result_front, "wb", "DATA" )
             file0:Write( data0 )
             file0:Close()
             tar_front:SetRenderMode(rendermode_old_prop0)
          end

          if tar_front:IsPlayer() == true and tar_front ~= LocalPlayer() then  --[[this can't take photos of the player in singleplayer--]]
             local rendermode_old_player0 = tar_front:GetRenderMode()
             tar_front:SetRenderMode(RENDERMODE_NONE)
             tar_front:DrawModel()
             local data1 = render.Capture({ format = "png", quality = imagingquality, x = 0, y = 0, w = w, h = h, alpha = true })
             local file1 = file.Open( imaging_result_front, "wb", "DATA" )
             file1:Write( data1 )
             file1:Close()
             tar_front:SetRenderMode(rendermode_old_player0)
          end

          if tar_front == LocalPlayer() then
             Optics_PopError(2)
          end
        cam.End3D()

        for k, v in pairs (imagestable) do
           if string.find(v,"front") ~= nil then
            local imaging_result_front_path = "../data/" .. imaging_result_front
            Optics_ConvexLensImagingResult_Material_Front_Table[lensindex] = Material(imaging_result_front_path)
            Optics_ConvexLensImagingResult_Material_Front_Table[lensindex]:SetInt("$translucent", 1)
           end
        end

      elseif tar_back:IsValid() == true then

         local imaging_result_back = string.gsub("optics_imaging/convexlens[INDEX]_imaging_result_back.png","INDEX",tostring(lensindex))

         cam.Start3D(pos_direct,angles:Right():Angle():Right():Angle():Right():Angle(),100)
          render.Clear( 255, 255, 255, 0, true )

          if tar_back:GetClass() == "prop_physics" then
             local rendermode_old_prop1 = tar_back:GetRenderMode()
             tar_back:SetRenderMode(RENDERMODE_NONE)
             tar_back:DrawModel()
             local data3 = render.Capture({ format = "png", quality = imagingquality, x = 0, y = 0, w = w, h = h, alpha = true })
             local file3 = file.Open( imaging_result_back, "wb", "DATA" )
             file3:Write( data3 )
             file3:Close()
             tar_back:SetRenderMode(rendermode_old_prop1)
          end

          if tar_back:IsPlayer() == true and tar_back ~= LocalPlayer() then
             local rendermode_old_player1 = tar_back:GetRenderMode()
             tar_back:SetRenderMode(RENDERMODE_NONE)
             tar_back:DrawModel()
             local data4 = render.Capture({ format = "png", quality = imagingquality, x = 0, y = 0, w = w, h = h, alpha = true })
             local file4 = file.Open( imaging_result_back, "wb", "DATA" )
             file4:Write( data4 )
             file4:Close()
             tar_back:SetRenderMode(rendermode_old_player1)
          end

          if tar_back == LocalPlayer() then
             Optics_PopError(2)
          end

         cam.End3D()

         for k, v in pairs (imagestable) do
           if string.find(v,"back") ~= nil then
            local imaging_result_back_path = "../data/" .. imaging_result_back
            Optics_ConvexLensImagingResult_Material_Back_Table[lensindex] = Material(imaging_result_back_path)
            Optics_ConvexLensImagingResult_Material_Back_Table[lensindex]:SetInt("$translucent", 1)
           end
         end

      end

      lens:CallOnRemove("Optics_DeleteImagingFilesOnLensRemove",function()  --[[delete ing the unnecessary files on lens remove--]]
         for k, v in pairs (imagestable) do
           if string.find(v,"convexlens") ~= nil then
            file.Delete("optics_imaging/" .. v)
           end
         end
      end)

   end

   function ConcaveLensImaging(lens)
     Optics_PopError(3)
   end

end