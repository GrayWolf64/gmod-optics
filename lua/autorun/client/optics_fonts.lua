if CLIENT then

    MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info: ")
    MsgC(Color(152 ,251 ,152), "Fonts CLIENTSIDE OK!\n")

    surface.CreateFont( "opticsdefaultfont", {
        font = "IBM Plex Mono",
        extended = false,
        size = 80,
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = false,
        italic = false,
        strikeout = false,
        shadow = true,
        outline = false,
       } )
        surface.CreateFont( "opticsdefaultfontbd", {
        font = "IBM Plex Mono Bold",
        extended = false,
        size = 35,
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        italic = false,
        strikeout = false,
        shadow = true,
        outline = false,
       } )
       surface.CreateFont( "opticsdefaultfontita", {
        font = "IBM Plex Mono Italic",
        extended = false,
        size = 20,
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        italic = false,
        strikeout = false,
        shadow = true,
        outline = false,
       } )
       surface.CreateFont( "opticsdefaultfontbdita", {
        font = "IBM Plex Mono Bold Italic",
        extended = false,
        size = 30,
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        italic = false,
        strikeout = false,
        shadow = true,
        outline = false,
       } )  --[[IBM Plex Fonts--]]
end