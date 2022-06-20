include("shared.lua")

if CLIENT then
   function ENT:Draw()
     self:DrawModel()
   end
end

if CLIENT then

  function ENT:Think()
    local index = self:EntIndex()

    local thisobjectpos = self:GetPos()
    local thisobjectangles = self:GetAngles()

    if GetConVar("Optics_Bool_TurnOnLaser_Front_CLIENT"):GetBool() == true then
        Optics_LaserTraces_Front_Table[index] = util.TraceLine({
           start = thisobjectpos,
           endpos = thisobjectpos + thisobjectangles:Right() * GetConVar("Optics_Int_LaserMaxDetectionDistanceFront_CLIENT"):GetInt() ,
           filter = function( ent ) return  ent:GetClass() == "optics_concavelens" or ent:GetClass() == "optics_convexlens" end
        })

        cam.Start3D()
          render.DrawBeam(thisobjectpos, Optics_LaserTraces_Front_Table[index].HitPos, GetConVar("Optics_Int_LaserWidth_CLIENT"):GetInt(), 0, 1, Color(255,0,0))
        cam.End3D()

    end

    if GetConVar("Optics_Bool_TurnOnLaser_Back_CLIENT"):GetBool() == true then
        Optics_LaserTraces_Front_Table[index] = util.TraceLine({
           start = thisobjectpos,
           endpos = thisobjectpos - thisobjectangles:Right() * GetConVar("Optics_Int_LaserMaxDetectionDistanceBack_CLIENT"):GetInt() ,
           filter = function( ent ) return  ent:GetClass() == "optics_concavelens" or ent:GetClass() == "optics_convexlens" end
        })

        cam.Start3D()
          render.DrawBeam(thisobjectpos, Optics_LaserTraces_Back_Table[index].HitPos, GetConVar("Optics_Int_LaserWidth_CLIENT"):GetInt(), 0, 1, Color(255,0,0))
        cam.End3D()

    end

  end
end