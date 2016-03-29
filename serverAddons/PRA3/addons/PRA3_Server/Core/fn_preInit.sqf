#include "macros.hpp"

/*
#ifndef isDev
    private _extRet = "PRA3_server" callExtension "version";
    GVAR(serverExtensionExist) = _extRet != "" && {getText(configFile >> "PRA3" >> "PRA3_Extension" >> "version") == _extRet};
#endif
*/

// Version Informations
private _missionVersionStr = "";
private _missionVersionAr = getArray(missionConfigFile >> "PRA3" >> "Version");

private _serverVersionStr = "";
private _serverVersionAr = getArray(configFile >> "CfgPatches" >> "PRA3_Server" >> "versionAr");

{
    _missionVersionStr = _missionVersionStr + str(_x) + ".";
    nil
} count _missionVersionAr;

{
    _serverVersionStr = _serverVersionStr + str(_x) + ".";
    nil
} count _serverVersionAr;

// @Todo Create Database for Compatible Versions
if !(_missionVersionAr isEqualTo _serverVersionAr && isClass (missionConfigFile >> "PRA3")) then {
    ["Lost"] call BIS_fnc_endMissionServer
};

_missionVersionStr = _missionVersionStr select [0, (count _missionVersionStr - 1)];
_serverVersionStr = _serverVersionStr select [0, (count _serverVersionStr - 1)];
GVAR(VersionInfo) = [[_missionVersionStr,_missionVersionAr], [_serverVersionStr, _serverVersionAr]];
publicVariable QGVAR(VersionInfo);

private _tempName = [];
private _tempRequires = [];
{
    _tempName pushBack (configName _x);
    _tempRequires pushBack (getArray (_x >> "require"));
    nil
} count ("true" configClasses (configFile >> "PRA3" >> "Dependencies"));
GVAR(Dependencies) = [_tempName,_tempRequires];

// The autoloader uses this array to get all function names.
GVAR(functionCache) = [];

// Autoload
EPREP(Autoload,autoloadEntryPoint)
EPREP(Autoload,callModules)
EPREP(Autoload,loadModules)
EPREP(Autoload,loadModulesServer)

// Per Frame Eventhandler
PREP(addPerFrameHandler)
PREP(removePerFrameHandler)
PREP(initPerFrameHandler)
PREP(execNextFrame)
PREP(wait)
PREP(waitUntil)

// Namespaces
PREP(createNamespace)
PREP(deleteNamespace)
PREP(getVariableLoc)

// Events
EPREP(Events,initEvents)
EPREP(Events,addEventhandler)

// Trigger Events
EPREP(Events,localEvent)
EPREP(Events,targetEvent)
EPREP(Events,globalEvent)
EPREP(Events,serverEvent)

// Base Eventhandler
EPREP(Events,clientInitEvents)
EPREP(Events,serverInitEvents)
EPREP(Events,hcInitEvents)

// Interaction
EPREP(Interaction,addAction)
EPREP(Interaction,clientInitInteraction)
EPREP(Interaction,loop)
EPREP(Interaction,inRange)

// Mutex
EPREP(Mutex,initClientMutex)
EPREP(Mutex,initServerMutex)
EPREP(Mutex,mutex)

// Notification System
EPREP(Notification,clientInitNotification)
EPREP(Notification,displayNotification)
EPREP(Notification,handleNotificationQueue)

// Settings
EPREP(Settings,initSettings)
EPREP(Settings,loadSettings)
EPREP(Settings,getSetting)

// lnbData
EPREP(lnbData,initlnbData)
EPREP(lnbData,lnbLoad)
EPREP(lnbData,lnbSave)

// Init
PREP(init)

// Other Functions
PREP(getLogicGroup)
PREP(isAlive)
PREP(cachedCall)
PREP(addPerformanceCounter)
PREP(blurScreen)
PREP(fixFloating)
PREP(name)
PREP(codeToString)
PREP(disableUserInput)
PREP(setVariablePublic)
PREP(createPPEffect)
PREP(getAllGear)
PREP(getNearestLocationName)
PREP(findSavePosition)
PREP(directCall)
PREP(getFOV)

// We call the autoloader here. This starts the mod work.
call FUNC(autoloadEntryPoint);
