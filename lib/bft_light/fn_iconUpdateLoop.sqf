private ["_players","_icons","_groups","_defaultIcon","_icon","_text","_textSize","_font","_align","_iconType"];

_icons = [];
_groups = [];
_textSize = 0.06;
_font = "PuristaSemiBold";
_align = "right";
_defaultIcon = switch (side player) do {
    case (west): {
      "b_unknown"
    };
    case (east): {
      "o_unknown"
    };
    case (independent) :{
      "n_unknown"
    };
};

if (BG_BFT_onlyPlayer) then {
    {
        if (!((group _x) in _groups) && side _x == side player) then {
            _groups pushBack group _x;
            _icon = group _x getVariable ["BG_BFT_icon", _defaultIcon];
            _text = group _x getVariable ["BG_BFT_groupId", groupId _x];
            _iconType = (BG_BFT_iconTypes select 0) find _icon;
            if (_iconType>=0) then {
                _iconType = (BG_BFT_iconTypes select 1) select _iconType;
                _icons pushBack [
                  _iconType select 0,
                  _iconType select 1,
                  leader group _x,
                  _iconType select 2,
                  _iconType select 2,
                  0,
                  _text,
                  0,
                  _textSize,
                  _font,
                  _align
                ];
            };
        };
        true;
    } count allPlayers;
} else {
    {
        if (side _x == side player) then {
            _icon = _x getVariable ["BG_BFT_icon", _defaultIcon];
            _text = _x getVariable ["BG_BFT_groupId", groupId _x];
            _iconType = (BG_BFT_iconTypes select 0) find _icon;
            if (_iconType>=0) then {
                _iconType = (BG_BFT_iconTypes select 1) select _iconType;
                _icons pushBack [
                _iconType select 0,
                _iconType select 1,
                leader _x,
                _iconType select 2,
                _iconType select 2,
                0,
                _text,
                0,
                _textSize,
                _font,
                _align
                ];
            };
        };
        true;
    } count allGroups;
};

BG_BFT_Icons = _icons;
