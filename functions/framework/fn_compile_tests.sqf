params['_test_configs'];

private _tests = [];

{
	_test_config = _x;
	_config_path = _test_config call BIS_fnc_configPath;
	_truncated_path = _config_path select [2, count _config_path];

	_path = _truncated_path joinString "\";
	_relative_path = format ["tests\%1.sqf", _path];

	_test_fnc = compileScript [_relative_path];

	_tests pushBack _test_fnc;

} forEach _test_configs;


_tests;