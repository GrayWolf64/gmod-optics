if CLIENT then

  monitor_ratiow = ScrW() / 1280
  monitor_ratioh = ScrH() / 1024
  //1280x1024 is my screen's res

  CreateClientConVar("Optics_SelectedConcaveLensModel","models/optics/lens/concavelens_d_20x20.mdl",false,true,"The selected concave lens model.")

  CreateClientConVar("Optics_LensMaxDetectionDistanceFront",128,false,true,"Maximum Distance in front of the lens for detecting objects.")
  CreateClientConVar("Optics_LensMaxDetectionDistanceBack",128,false,true,"Maximum Distance behind the lens for detecting objects.")

  CreateClientConVar("Optics_ConcaveLensFocalLength",32,false,true,"The Focal Length of the Concave Lens.")
  CreateClientConVar("Optics_ConvexLensFocalLength",32,false,true,"The Focal Length of the Convex Lens.")

  CreateClientConVar("Optics_Boolean_PointingAtConcaveLens_CLIENT","0",false,false,"Don't Touch This. Boolean for ensuring that tou are pointing at a Concave Lens.")
  CreateClientConVar("Optics_Boolean_DoWeldConcaveLens_CLIENT","0",false,false,"Don't Touch This. Boolean for ensuring that you want to weld the Concave Lens to the surface.")
  CreateClientConVar("Optics_Boolean_IsDoWeld_PointedConcaveLens_CLIENT","0",false,false,"Don't Touch This. Boolean for ensuring that the pointed concave lens is dowelded.")
  CreateClientConVar("Optics_Boolean_IsImaging_PointedConcaveLens_CLIENT","0",false,false,"Don't Touch This. Boolean for ensuring that the pointed concave lens is imaging.")
  CreateClientConVar("Optics_Boolean_IsNoCollide_PointedConcaveLens_CLIENT","0",false,false,"Don't Touch This. Boolean for ensuring that the pointed concave lens is nocollide.")
  CreateClientConVar("Optics_Boolean_FocalLength_PointedConcaveLens_CLIENT",0,false,false,"Don't Touch This. Boolean for ensuring that the pointed concave's focal length.")
  CreateClientConVar("Optics_String_Index_PointingAtConcaveLens_CLIENT","N/A",false,false,"Don't Touch This. String for showing the index of the pointed Concave Lens.")
  CreateClientConVar("Optics_Boolean_NoCollideConcaveLens_CLIENT","0",false,false,"Don't Touch This. Boolean for ensuring that you want to make the Concave Lens No-collide.")

end