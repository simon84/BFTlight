disableSerialization;
params ['_ctrl', '_btn', '_xPos', '_yPos'];
private ['_r','_temp','_group','_pos','_idd'];

if (0<count BG_BFT_groups) then {
  _r = 1000;
  {
    _pos = _ctrl ctrlMapWorldToScreen visiblePosition leader _x;
    _temp = sqrt ((_xPos-(_pos select 0))^2+(_yPos-(_pos select 1))^2);
    if (_temp < _r) then {
      _r = _temp;
      _group = _x;
    };
  } forEach BG_BFT_groups;

  hintSilent ("x: " + str _xPos + " y: " + str _yPos + " r: " + str _r  + " group: " + groupId _group );

  if (_r < 0.02) then {
    _group setVariable ['BG_BFT_selected', true];

  } else {
    _group setVariable ['BG_BFT_selected', false];
  };
  _temp = BG_BFT_groups - [_group];

  {
      _x setVariable ['BG_BFT_selected', false];
  } forEach _temp;


};
