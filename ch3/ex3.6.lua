-- calculate the volume of a right circular cone
-- given its height and the angle (in degrees) between
-- a generatrix and the axis (height)
function coneV(h, alpha)
  r = math.tan(math.rad(alpha))*h
  return math.pi*r^2*h/3.0
end

