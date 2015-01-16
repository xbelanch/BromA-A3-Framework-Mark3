_path = _this select 0;

BRM_fnc_setup_zone = compile preprocessFileLineNumbers (_path+"fn_setupZone.sqf");
BRM_fnc_register_zone = compile preprocessFileLineNumbers (_path+"fn_registerZone.sqf");

if !(mission_game_mode == "coop") then {
    private["_markfix"];
    if (side player == resistance) then { _markfix = "resistance" } else { _markfix = side player };
    _resp1 = format ["respawn_%1", _markfix];
    _resp2 = format ["respawn_%1", _markfix];
    _resp3 = format ["respawn_%1", _markfix];

    zone1 = [_resp1, 50, mission_setup_time, side_a_side] spawn BRM_fnc_setup_zone;
    zone2 = [_resp2, 50, mission_setup_time, side_b_side] spawn BRM_fnc_setup_zone;
    
    if (mission_enable_side_c) then {
    zone3 = [_resp3, 50, mission_setup_time, side_c_side] spawn BRM_fnc_setup_zone;
    };
};