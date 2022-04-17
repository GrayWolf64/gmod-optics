if CLIENT then
    surface.CreateFont( "opticsdefaultfont", {
        font = "Times New Roman",
        extended = false,
        size = 80,
        weight = 500,
        blursize = 0,
        scanlines = 4,
        antialias = false,
        italic = false,
        strikeout = false,
        shadow = true,
        outline = false,
       } )
        surface.CreateFont( "opticsdefaultfontbd", {
        font = "Times New Roman Bold",
        extended = false,
        size = 40,
        weight = 500,
        blursize = 0,
        scanlines = 4,
        antialias = true,
        italic = false,
        strikeout = false,
        shadow = true,
        outline = false,
       } )
end