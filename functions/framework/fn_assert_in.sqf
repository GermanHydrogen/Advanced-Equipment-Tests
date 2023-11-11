params["_element", "_list"];

if (_element in _list) exitWith {};

["Element %1 is not int List %2!", _element, _list] call BIS_fnc_error;

assert False;