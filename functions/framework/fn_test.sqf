private _test_configs = [missionConfigFile >> "Tests", 3] call H2_fnc_gather_tests;
private _test_files = [_test_configs] call H2_fnc_compile_tests;

private _successfull_test = 0;

{
	

	_tests = call _x;

	{
		call _x;

		_successfull_test = _successfull_test + 1;
	}forEach _tests;

}forEach _test_files;

_successfull_test;