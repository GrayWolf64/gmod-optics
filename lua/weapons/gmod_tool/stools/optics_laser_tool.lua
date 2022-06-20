TOOL.Tab = "Optics"
TOOL.Category  = "Light Sources"
TOOL.Name  = "Laser"
TOOL.Command  = nil
TOOL.ConfigName  = ""

if CLIENT then
 local textcolor0 = Color(152 ,251 ,152)
 MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info: ")
 MsgC(textcolor0, "Laser Tool OK!\n")

 language.Add("tool.optics_laser_tool.name", "Laser Tool")
 language.Add("tool.optics_laser_tool.desc", "Create or modify a laser.")
 language.Add("tool.optics_laser_tool.left", "Create a laser.")
 language.Add("tool.optics_laser_tool.right", "Apply changes to a laser.")

end