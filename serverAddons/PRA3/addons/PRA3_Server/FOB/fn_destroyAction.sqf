#include "macros.hpp"
/*
    Project Reality ArmA 3

    Author: BadGuy

    Description:
    Destroy a FOB

    Parameter(s):
    None

    Returns:
    None
*/
private _title = "Destroy FOB";
private _iconIdle = "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_forceRespawn_ca.paa";
private _iconProgress = "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_forceRespawn_ca.paa";
private _showCondition = {
    call {
        _target = CLib_Player;
        scopeName "ActionCondition";
        private _cond = false;
        {
            private _pointDetails = EGVAR(Common,DeploymentPointStorage) getVariable _x;
            if (!(isNil "_pointDetails")) then {
                _pointDetails params ["_name", "_type", "_position", "_availableFor", "_spawnTickets", "_icon", ["_mapIcon", ""], ["_pointObjects", []], ["_customData", []]];

                _customData params [["_counterActive", 0]];

                if (_type == "FOB" && {CLib_Player distance _position <= 5 && _counterActive == 0 && _availableFor != side group CLib_Player}) then {
                    GVAR(currentFob) = format ["%1_%2", _name, _position];;
                    _cond = true;
                    breakTo "ActionCondition";
                };
            };
        } count ([EGVAR(Common,DeploymentPointStorage), QEGVAR(Common,DeploymentPointStorage)] call CFUNC(allVariables));
        _cond;
    };
};

GVAR(destroyFOBStartTime) = -1;
GVAR(currentFob) = [];
private _onStart = {
    params ["_target", "_caller"];

    GVAR(destroyFOBStartTime) = time;
};

private _onProgress = {
    (time - GVAR(destroyFOBStartTime))/5;
};

private _onComplete = {
    params ["_target", "_caller"];

    GVAR(destroyFOBStartTime) = -1;
    [QGVAR(startDestroyTimer), [GVAR(currentFob)]] call CFUNC(serverEvent);
};

private _onInterruption = {
    params ["_target", "_caller"];

    GVAR(destroyFOBStartTime) = -1;
};


[CLib_Player, _title, _iconIdle, _iconProgress, _showCondition, _showCondition, _onStart, _onProgress,_onComplete,_onInterruption, [], 5000, true, true] call CFUNC(addHoldAction);
