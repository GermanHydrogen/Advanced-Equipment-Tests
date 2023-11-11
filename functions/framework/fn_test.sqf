private _test_configs = [missionConfigFile >> "Tests", 3, false] call BIS_fnc_returnChildren;
private _successfull_test = 0;

{
	_test_config = _x;
	_config_path = _test_config call BIS_fnc_configPath;
	_truncated_path = _config_path select [2, count _config_path];

	_path = _truncated_path joinString "\";
	_relative_path = format ["tests\%1.sqf", _path];

	_test_fnc = compileScript [_relative_path];

	_tests = call _test_fnc;

	{
		call _x;

		_successfull_test = _successfull_test + 1;
	}forEach _tests;

}forEach _test_configs;

_successfull_test