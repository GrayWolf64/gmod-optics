if CLIENT then

  local color0 = Color(214 ,214 ,214)
  MsgC(color0,"[ OPTICS ] Debug Info: Menus CLIENTSIDE OK!\n")

 hook.Add( "AddToolMenuTabs", "opticstab", function()
    spawnmenu.AddToolTab( "Optics", "Optics", "icon16/color_wheel.png" )
 end )

 local function CreateOpticsCategories()
   spawnmenu.AddToolCategory( "Optics", "Lens", "Lens" )
   spawnmenu.AddToolCategory( "Optics", "Reflectors", "Reflectors" )
   spawnmenu.AddToolCategory( "Optics", "Prisms", "Prisms" )
   spawnmenu.AddToolCategory( "Optics", "Light Sources", "Light Sources" )
   spawnmenu.AddToolCategory( "Optics", "Maths", "Maths" )
   spawnmenu.AddToolCategory( "Optics", "Settings", "Settings" )
 end
 hook.Add( "AddToolMenuCategories", "CreateOpticsCategories", CreateOpticsCategories )
end