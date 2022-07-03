AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local color0 = Color(214 ,214 ,214)
if CLIENT then
    MsgC(color0,"┏━━━━━━━━━━━━━━━━━━━CLIENT━━━━━━━━━━━━━━━━━━━┓\n")
    MsgC(color0,"┃[ OPTICS ] Debug Info: ConvexLens Entity OK!┃\n")
    MsgC(color0,"┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n")
else
    MsgC(color0,"[ OPTICS ] Debug Info: ConvexLens Entity OK!\n")
end