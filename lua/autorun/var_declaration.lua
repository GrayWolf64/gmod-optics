if CLIENT then
 monitor_ratiow = ScrW()/1280
 monitor_ratioh = ScrH()/1024
 CreateConVar("Optics_LensMaxDetectionDistanceFront",128,FCVAR_NONE,"Maximum Distance in front of the lens for detecting objects.")
 CreateConVar("Optics_LensMaxDetectionDistanceBack",128,FCVAR_NONE,"Maximum Distance behind the lens for detecting objects.")
end