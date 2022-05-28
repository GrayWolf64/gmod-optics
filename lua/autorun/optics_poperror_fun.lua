function Optics_PopError(num)
    local errors_table = {
        [1] = "Error number does not exist.",
        [2] = "The Local player tries to image himself.",
    }
    local color0 = Color(240 ,88 ,0)
    local color1 = Color(0,140,255)
    if num > table.Count(errors_table) and SERVER then
     MsgC(color0, "[ OPTICS ] Error Message!")
     MsgC(color1, "[ OPTICS ]" .. errors_table[1] .. "\n")
    end
    if num <= table.Count(errors_table) then
     MsgC(color0, "[ OPTICS ] Error Message!")
     MsgC(color1, "[ OPTICS ]" .. errors_table[num] .. "\n")
     if CLIENT then
      notification.AddLegacy(errors_table[num], NOTIFY_ERROR, 1)
     end
    end
end