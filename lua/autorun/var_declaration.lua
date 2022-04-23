if CLIENT then

  monitor_ratiow = ScrW() / 1280
  monitor_ratioh = ScrH() / 1024
  //1280x1024 is my screen's res
  CreateClientConVar("Optics_LensMaxDetectionDistanceFront",128,false,true,"Maximum Distance in front of the lens for detecting objects.")
  CreateClientConVar("Optics_LensMaxDetectionDistanceBack",128,false,true,"Maximum Distance behind the lens for detecting objects.")
  CreateClientConVar("Optics_ConcaveLensFocalLength",32,false,true,"The Focal Length of the Concave Lens.")
  CreateClientConVar("Optics_ConvexLensFocalLength",32,false,true,"The Focal Length of the Convex Lens.")
  CreateClientConVar("Optics_Boolean_PointingAtConcaveLens_CLIENT","0",false,false,"Don't Touch This.")
  CreateClientConVar("Optics_Boolean_DoWeldConcaveLens_CLIENT","0",false,false,"Don't Touch This.")
  CreateClientConVar("Optics_String_Index_PointingAtConcaveLens_CLIENT","N/A",false,false,"Don't Touch This.")
end