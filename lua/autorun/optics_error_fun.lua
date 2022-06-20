MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info: ")
MsgC(Color(152 ,251 ,152), "PopError Function OK!\n")

function Optics_PopError(num)
    local errors_table = {
        [1] = "Error number does not exist.",
        [2] = "The Local Player tries to image himself.",
    }  --[[table of errors--]]

    local color0 = Color(240 ,88 ,0)
    local color1 = Color(0,140,255)

    if num > table.Count(errors_table) and SERVER then
     MsgC(color0, "[ OPTICS ] Error Message!")
     MsgC(color1, errors_table[1] .. "\n")
    end

    if num <= table.Count(errors_table) then
     MsgC(color0, "[ OPTICS ] Error Message!")
     MsgC(color1, errors_table[num] .. "\n")
     if CLIENT then
         notification.AddLegacy(errors_table[num], NOTIFY_ERROR, 2)
         surface.PlaySound( "buttons/button15.wav" )
     end
    end
end