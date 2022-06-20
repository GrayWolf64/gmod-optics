if CLIENT then
 MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info: ")
 MsgC(Color(152 ,251 ,152), "Optics Menus OK!\n")

 hook.Add( "AddToolMenuTabs", "opticstab", function()
    spawnmenu.AddToolTab( "Optics", "Optics", "icon16/color_wheel.png" )
 end )

 local function CreateOpticsCategories()
   spawnmenu.AddToolCategory( "Optics", "Lens", "Lens" )
   spawnmenu.AddToolCategory( "Optics", "Reflectors", "Reflectors" )
   spawnmenu.AddToolCategory( "Optics", "Prisms", "Prisms" )
   spawnmenu.AddToolCategory( "Optics", "Maths", "Maths" )
   spawnmenu.AddToolCategory( "Optics", "Settings", "Settings" )
 end
 hook.Add( "AddToolMenuCategories", "CreateOpticsCategories", CreateOpticsCategories )
end