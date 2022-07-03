if CLIENT then

    local color0 = Color(214 ,214 ,214)
    MsgC(color0,"[ OPTICS ] Debug Info: Fonts CLIENTSIDE OK!\n")

    surface.CreateFont( "opticsdefaultfont", {
        font = "IBM Plex Mono",
        extended = false,
        size = 80,
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = true,
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