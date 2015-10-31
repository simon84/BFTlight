private ['_map','_icon','_pos','_defaultSize','_size','_angle','_text','_shadow','_textSize','_font','_align'];
disableSerialization;

_map = ((findDisplay 12) displayCtrl 51);
{
  _map drawIcon _x;
} forEach BG_BFT_Icons;
