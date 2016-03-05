class PRA3_UI_RespawnScreen {
    idd = -1;
    onLoad = "[_this select 0] call PRA3_mission_fnc_onLoadRespawnScreen;";
    onUnLoad = "[_this select 0] call PRA3_mission_fnc_onUnloadRespawnScreen;";

    class controlsBackground {
        #define GHEIGHT 82
        class MapBackground : RscPicture {
            idc = 600;
            text = "#(argb,8,8,3)color(0.2,0.2,0.2,0.8)";
            x = PX(72) + safeZoneX;
            y = PY(10) + safeZoneY;
            w = safeZoneW - PX(77);
            h = PY(GHEIGHT);
        };

        class Map : RscMapControl {
            idc = 700;
            x = PX(72.5) + safeZoneX;
            y = PY(10.5) + safeZoneY;
            w = safeZoneW - PX(78);
            h = PY(GHEIGHT-1);
        };
    };

    class Controls {
        #define GWIDTH 40
        #define GHEIGHT 3
        class TeamInfo : RscControlsGroupNoScollbars {
            idc = 100;
            x = PX(5) + safeZoneX;
            y = PY(10) + safeZoneY;
            w = PX(GWIDTH);
            h = PY(GHEIGHT);

            class Controls {
                class Background : RscPicture {
                    idc = 101;
                    text = "#(argb,8,8,3)color(0.2,0.2,0.2,0.8)";
                    x = PX(0);
                    y = PY(0);
                    w = PX(GWIDTH);
                    h = PY(GHEIGHT);
                };
                class TeamFlag : RscPicture {
                    idc = 102;
                    text = "#(argb,8,8,3)color(0.5,0.5,0.5,1)";
                    x = PX(0.5);
                    y = PY(0.5);
                    w = PX(3);
                    h = PY(2);
                };

                class TeamName : PRA3_H1Text {
                    idc = 103;
                    text = "US ARMY";
                    x = PX(4);
                    y = PY(0);
                    w = PX(GWIDTH-13);
                    h = PY(GHEIGHT);
                };

                class ChangeSideBtn : PRA3_RscButtonMenu {
                    idc = 104;
                    text = "CHANGE";
                    x = PX(GWIDTH-9);
                    y = PY(0);
                    w = PX(9);
                    h = PY(GHEIGHT)

                    onButtonClick = "[_this] call PRA3_mission_fnc_changeSide;";
                };
            };
        };

        #define GHEIGHT 44.5
        class SquadManagement : RscControlsGroupNoScollbars {
            idc = 200;
            x = PX(5) + safeZoneX;
            y = PY(14) + safeZoneY;
            w = PX(GWIDTH);
            h = PY(GHEIGHT);

            class Controls {
                class Background : RscPicture {
                    idc = 201;
                    text = "#(argb,8,8,3)color(0.2,0.2,0.2,0.8)";
                    x = PX(0);
                    y = PY(0);
                    w = PX(GWIDTH);
                    h = PY(GHEIGHT);
                };

                class Heading : PRA3_H2Text {
                    idc = 202;
                    text = "SQUAD";
                    x = PX(0.5);
                    y = PY(0.5);
                    w = PX(GWIDTH-1);
                    h = PY(3);
                };

                class NewSquadDesignator : PRA3_RscText {
                    idc = 203;
                    text = "D";
                    x = PX(0.5);
                    y = PY(4);
                    w = PX(2.5);
                    h = PY(3);
                };

                class NewSquadDescriptionInput : PRA3_RscEdit {
                    idc = 204;
                    x = PX(3.5);
                    y = PY(4);
                    w = PX(GWIDTH-13);
                    h = PY(3);
                };

                class CreateSquadBtn : PRA3_RscButtonMenu {
                    idc = 205;
                    text = "CREATE";
                    x = PX(GWIDTH-9);
                    y = PY(4);
                    w = PX(8);
                    h = PY(3);

                    onButtonClick = "[_this] call PRA3_mission_fnc_createSquadBtn;";
                };

                class SquadList : RscListNBox {
                    idc = 206;
                    x = PX(0);
                    y = PY(8);
                    w = PX(GWIDTH);
                    h = PY(14.5);

                    sizeEx = PY(2);
                    rowHeight = PY(3.5);
                    columns[] = {0,0.075,0.875};
                };



                class BackgroundSquadDetails : RscPicture {
                    idc = 207;
                    text = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
                    x = PX(0);
                    y = PY(GHEIGHT-22);
                    w = PX(GWIDTH);
                    h = PY(22);
                };

                class HeadingSquadDetails : PRA3_H2Text {
                    idc = 208;
                    text = "ALPHA";
                    x = PX(0.5);
                    y = PY(GHEIGHT-22);
                    w = PX(GWIDTH-22);
                    h = PY(3);
                };

                class SquadMemberList : RscListNBox { //@todo move down
                    idc = 209;
                    x = PX(0);
                    y = PY(GHEIGHT-18.3);
                    w = PX(GWIDTH);
                    h = PY(18.3);

                    sizeEx = PY(2);
                    rowHeight = PY(3);
                    columns[] = {0,0.075,0.875};
                };

                class JoinLeaveBtn : PRA3_RscButtonMenu {
                    idc = 210;
                    text = "JOIN";
                    x = PX(GWIDTH-6);
                    y = PY(GHEIGHT-22);
                    w = PX(6);
                    h = PY(3);

                    onButtonClick = "[_this] call PRA3_mission_fnc_joinLeaveBtn;";
                };

                class KickBtn : PRA3_RscButtonMenu {
                    idc = 211;
                    text = "KICK";
                    x = PX(GWIDTH-12.5);
                    y = PY(GHEIGHT-22);
                    w = PX(6);
                    h = PY(3);

                    onButtonClick = "[_this] call PRA3_mission_fnc_kickBtn;";
                };

                class PromoteBtn : PRA3_RscButtonMenu {
                    idc = 212;
                    text = "PROMOTE";
                    x = PX(GWIDTH-22);
                    y = PY(GHEIGHT-22);
                    w = PX(9);
                    h = PY(3);

                    onButtonClick = "[_this] call PRA3_mission_fnc_promoteBtn;";
                };
            };
        };

        #define GHEIGHT 38.5
        class RoleManagement : RscControlsGroupNoScollbars {
            idc = 300;
            x = PX(5) + safeZoneX;
            y = PY(59.5) + safeZoneY;
            w = PX(GWIDTH);
            h = PY(GHEIGHT);

            class Controls {
                class Background : RscPicture {
                    idc = 301;
                    text = "#(argb,8,8,3)color(0.2,0.2,0.2,0.8)";
                    x = PX(0);
                    y = PY(0);
                    w = PX(GWIDTH);
                    h = PY(GHEIGHT);
                };

                class Heading : PRA3_H2Text {
                    idc = 302;
                    text = "ROLE";
                    x = PX(0.5);
                    y = PY(0.5);
                    w = PX(GWIDTH-1);
                    h = PY(3);
                };

                class RolesList : RscListNBox {
                    idc = 303;
                    x = PX(0);
                    y = PY(4);
                    w = PX(GWIDTH);
                    h = PY(19);

                    rowHeight = PY(3.5);
                    columns[] = {0,0.075,0.875};
                };

                class WeaponsTabs : RscToolbox {
                    idc = 304;
                    x = PX(0);
                    y = PY(GHEIGHT-15.5);
                    w = PX(GWIDTH);
                    h = PY(2.5);

                    sizeEx = PY(2);
                    rows = 1;
                    columns = 3;
                    strings[] = {"Primary", "Secondary", "Special"};
                }
            }
        }

        #define GWIDTH 25
        #define GHEIGHT 26.5
        class DeploymentManagement : RscControlsGroupNoScollbars {
            idc = 400;
            x = PX(46) + safeZoneX;
            y = PY(10) + safeZoneY;
            w = PX(GWIDTH);
            h = PY(GHEIGHT);

            class Controls {
                class Background : RscPicture {
                    idc = 401;
                    text = "#(argb,8,8,3)color(0.2,0.2,0.2,0.8)";
                    x = PX(0);
                    y = PY(0);
                    w = PX(GWIDTH);
                    h = PY(GHEIGHT);
                };

                class Heading : PRA3_H2Text {
                    idc = 402;
                    text = "DEPLOYMENT";
                    x = PX(0.5);
                    y = PY(0.5);
                    w = PX(GWIDTH-1);
                    h = PY(3);
                };

                class RolesList : RscListNBox {
                    idc = 403;
                    x = PX(0);
                    y = PY(4);
                    w = PX(GWIDTH);
                    h = PY(22.5);

                    rowHeight = PY(3);
                    columns[] = {0,0.075,0.875};
                };
            };
        };

        #define GWIDTH 26
        #define GHEIGHT 5
        class DeployBtn : PRA3_RscButtonMenu {
            idc = 500;
            text = "DEPLOY";
            x = safeZoneW - PX(GWIDTH+5) + safeZoneX;
            y = PY(93) + safeZoneY;
            w = PX(GWIDTH);
            h = PY(GHEIGHT);
        }
    };
};
