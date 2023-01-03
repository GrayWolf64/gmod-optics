function Optics_PopError(num)
    local errors_table = {
        [1] = "Error number does not exist.",
        [2] = "The Local Player tries to image himself.",
        [3] = "Concave Lens can't image real images that you can see.",
    }

    --[[table of errors--]]
    local color1 = Color(240, 88, 0)
    local color2 = Color(0, 140, 255)

    if num > table.Count(errors_table) and SERVER then
        MsgC(color1, "[ OPTICS ] Error Message: ")
        MsgC(color2, errors_table[1] .. "\n")
    end

    if num <= table.Count(errors_table) then
        MsgC(color1, "[ OPTICS ] Error Message: ")
        MsgC(color2, errors_table[num] .. "\n")
    end
end