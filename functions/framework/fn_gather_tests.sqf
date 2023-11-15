params['_config', '_depth'];

private _tests = [];

for "_i" from 2 to 3 do {
	_test_configs = [_config, _i, false] call BIS_fnc_returnChildren;

	{
		_children = [_x, 0, false] call BIS_fnc_returnChildren;

		if (count _children == 0) then
		{
			_tests pushBack _x;
		}
	} forEach _test_configs
};

_tests;