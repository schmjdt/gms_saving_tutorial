/// @desc lerp_clamped
/// @arg val1
/// @arg val2
/// @arg amount

//performs a lerp but locks the returned value between val 1 and 2.
var _min = min(argument[0], argument[1]);
var _max = max(argument[0], argument[1]);

return (clamp(lerp(argument[0], argument[1], argument[2]), _min,_max));
