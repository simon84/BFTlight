disableSerialization;
params ['_ctrl', '_xPos', '_yPos'];
private ['_r','_temp','_group','_pos'];
if (0<count BG_BFT_groups) then {
  _r = 1000;
  {
    _pos = _ctrl ctrlMapWorldToScreen visiblePosition leader _x;
    _temp = sqrt ((_xPos-(_pos select 0))^2+(_yPos-(_pos select 1))^2);
    if (_temp < _r) then {
      _r = _temp;
      _group = _x;
    } else {
      _x setVariable ['BG_BFT_hovered', false];
    };
  } forEach BG_BFT_groups;

  if (_r < 0.02) then {
    _group setVariable ['BG_BFT_hovered', true];
  } else {
    _group setVariable ['BG_BFT_hovered', false];
  };
};
