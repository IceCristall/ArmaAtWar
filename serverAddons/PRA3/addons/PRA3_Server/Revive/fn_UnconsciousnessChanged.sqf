#include "macros.hpp"
/*
    Project Reality ArmA 3

    Author: joko // Jonas

    Description:
    handle UnconsciousnessChanged

    Parameter(s):
    UnconsciousnessChanged Paramter

    Returns:
    None
*/
(_this select 0) params ["_state", "_unit"];

_unit setVariable [QGVAR(isUnconscious), _state, true];

if (_state) then {
    if (_unit isEqualTo PRA3_Player) then {
        {
            _x ppEffectEnable true;
            nil
        } count GVAR(PPEffects);
        if (isNil QGVAR(ppEffectPFHID)) then {
            GVAR(ppEffectPFHID) = [{
                if (alive PRA3_Player) then {
                    private _bloodLevel = ((PRA3_Player getVariable [QGVAR(bloodLoss), 0]) min 3) max 0;
                    _bright = 0.2 + (0.1 * _bloodLevel);
                    _intense = 0.6 + (0.4 * _bloodLevel);
                    {
                        _effect = GVAR(PPEffects) select _forEachIndex;
                        _effect ppEffectAdjust _x;
                        _effect ppEffectCommit 1;
                    } forEach [
                        [1, 1, 0.15 * _bloodLevel, [0.3, 0.3, 0.3, 0], [_bright, _bright, _bright, _bright], [1, 1, 1, 1]],
                        [1, 1, 0, [0.15, 0, 0, 1], [1.0, 0.5, 0.5, 1], [0.587, 0.199, 0.114, 0], [_intense, _intense, 0, 0, 0, 0.2, 1]],
                        [0.7 + (1 - _bloodLevel)]
                    ];
                } else {
                    [GVAR(ppEffectPFHID)] call CFUNC(removePerFrameHandler);
                    GVAR(ppEffectPFHID) = nil;
                    {
                        _x ppEffectEnable false;
                        nil
                    } count GVAR(PPEffects);
                };
            }, 1] call CFUNC(addPerFrameHandler);
        };
    };
    if (alive _unit) then {
        ["switchMove", [_unit, "acts_InjuredLyingRifle02"]] call CFUNC(globalEvent);
        [true] call CFUNC(disableUserInput);
    };

} else {
    if (_unit isEqualTo PRA3_Player) then {
        {
            _x ppEffectEnable false;
            nil
        } count GVAR(PPEffects);
        [GVAR(ppEffectPFHID)] call CFUNC(removePerFrameHandler);
        GVAR(ppEffectPFHID) = nil;
    };
    if (alive _unit) then {
        ["switchMove", [_unit, "AmovPpneMstpSnonWnonDnon"]] call CFUNC(globalEvent);
        [false] call CFUNC(disableUserInput);
    };



};

/*
Animations:
    // GetDown Anims
    Incapacitated
    IncapacitatedPistol
    IncapacitatedRifle
    BasicDriverDying
    BasicDriverOutDying
    Unconscious

    // Translations Back to Front Rolling
    AinjPpneMstpSnonWnonDnon_rolltoback
    AinjPpneMstpSnonWnonDnon_rolltofront

    // Laydown Pose
    AinjPpneMstpSnonWnonDnon
    AinjPpneMstpSnonWnonDnon_injuredHealed
    Mk201_Dead
    Mk34_Dead
    Mortar_01_F_Dead
    Static_Dead
    Helper_InjuredRfl
*/