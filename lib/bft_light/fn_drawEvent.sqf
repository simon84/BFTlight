private ["_map"];
disableSerialization;

_map = ((findDisplay 12) displayCtrl 51);
{
  _map drawIcon _x;
} forEach BG_BFT_Icons;
