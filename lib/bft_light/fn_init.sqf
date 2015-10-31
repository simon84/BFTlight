if (!hasInterface) exitWith {};

diag_log "BG_BFT_INIT started";

BG_BFT_Icons = [];
BG_BFT_drawEventId = -1;
BG_BFT_onlyPlayer = false;

BG_BFT_iconTypes=[];

private ["_keys","_values","_classes","_side"];
_keys = [];
_values = [];

_classes = "getText (_x >> 'markerClass') == 'NATO_BLUFOR' ||   getText (_x >> 'markerClass') == 'NATO_OPFOR' ||   getText (_x >> 'markerClass') == 'NATO_Independent'" configClasses (configfile >> "CfgMarkers");
{
    _keys pushBack configName _x;
    _values pushBack [
    getText (_x >> "icon"),
    (_x >> "color") call BIS_fnc_colorConfigToRGBA,
    getNumber (_x >> "size"),
    getText (_x >> "name"),
    switch (getText (_x >> "markerClass")) do {
        case ("NATO_BLUFOR"): {
            west
        };
        case ("NATO_OPFOR"): {
            east
        };
        case ("NATO_Independent"): {
            independent
        };
    }];
} forEach _classes;

BG_BFT_iconTypes = [_keys,_values];


[] call BG_fnc_bftdialog;
((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",BG_fnc_drawEvent];
[{
    [] call BG_fnc_iconUpdateLoop;
}, 10, []] call CBA_fnc_addPerFrameHandler;
[] call BG_fnc_iconUpdateLoop;

diag_log "BG_BFT_INIT stopped";
