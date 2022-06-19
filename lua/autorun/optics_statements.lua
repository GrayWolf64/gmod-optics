if CLIENT then

  Optics_Root = {}
  Optics_Root["Version"] = "Not completed."

  MsgC(Color(240 ,88 ,0), "[ OPTICS ] Debug Info!")
  MsgC(Color(152 ,251 ,152), "[ OPTICS ] Vars Declared!\n")
  print("Optics_Root");PrintTable(Optics_Root)

  Optics_ConcaveLensModels_Table = {
    [1] = "models/optics/lens/concavelens_d_20x20.mdl"
  }

  CreateClientConVar("Optics_String_SelectedConcaveLensModel_CLIENT","models/optics/lens/concavelens_d_20x20.mdl",false,true,"The selected concave lens model.")

  CreateClientConVar("Optics_LensMaxDetectionDistanceFront",128,false,true,"Maximum Distance in front of the lens for detecting objects.")
  CreateClientConVar("Optics_LensMaxDetectionDistanceBack",128,false,true,"Maximum Distance behind the lens for detecting objects.")

  CreateClientConVar("Optics_ConcaveLensFocalLength",32,false,true,"The Focal Length of the Concave Lens.")
  CreateClientConVar("Optics_ConvexLensFocalLength",32,false,true,"The Focal Length of the Convex Lens.")

  CreateClientConVar("Optics_Boolean_IsPointingConcaveLens_CLIENT","0",false,false,"Boolean for ensuring that you are pointing at a Concave Lens.")
  CreateClientConVar("Optics_Boolean_IsDoWeldConcaveLens_CLIENT","0",false,false,"Boolean for ensuring that you want to weld the Concave Lens to the surface.")
  CreateClientConVar("Optics_Boolean_IsDoWeld_PointedConcaveLens_CLIENT","0",false,false,"Boolean for ensuring that the pointed concave lens is dowelded.")
  CreateClientConVar("Optics_Boolean_IsImaging_PointedConcaveLens_CLIENT","0",false,false,"Boolean for ensuring that the pointed concave lens is imaging.")
  CreateClientConVar("Optics_Boolean_IsNoCollide_PointedConcaveLens_CLIENT","0",false,false,"Boolean for ensuring that the pointed concave lens is no-collide.")
  CreateClientConVar("Optics_Boolean_FocalLength_PointedConcaveLens_CLIENT",0,false,false,"Boolean for ensuring that the pointed concave's focal length.")
  CreateClientConVar("Optics_String_PointedConcaveLensIndex_CLIENT","N/A",false,false,"String for showing the index of the pointed Concave Lens.")
  CreateClientConVar("Optics_Boolean_NoCollideConcaveLens_CLIENT","0",false,false,"Boolean for ensuring that you want to make the Concave Lens No-collide.")

  CreateClientConVar("Optics_Boolean_GeneralSettingsToolDrawDebugLines_CLIENT","0",false,false,"Boolean for ensuring that the debug lines will be drawn.")

  CreateClientConVar("Optics_Int_LensImagingQuality_CLIENT",75,false,false,"Int for the quality of Lens imaging.")

  file.CreateDir("optics_imaging")  --[[folder for imaging files--]]

  Optics_ConcaveLensTraces_Front_Table = {}  --[[table of traces of concave lens--]]
  Optics_ConcaveLensTraces_Back_Table = {}

  Optics_ConcaveLensImagingResult_Material_Front_Table = {}  --[[table of imaging results of concave lens--]]
  Optics_ConcaveLensImagingResult_Material_Back_Table = {}

end