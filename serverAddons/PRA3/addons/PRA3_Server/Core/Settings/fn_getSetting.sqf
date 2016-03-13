#include "macros.hpp"
/*
    Project Reality ArmA 3

    Author: NetFusion

    Description:
    Get a settings value

    Parameter(s):
    None

    Returns:
    None
*/
params ["_name", "_default"];

[GVAR(settingsNamespace), _name, _default] call CFUNC(getVariableLoc)