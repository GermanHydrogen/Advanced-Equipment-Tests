[
	// Test power off
	{
		_generator = createHashMapObject [AE3_power_outlet, [objNull, 10]];
		_rate = _generator call ["_calcPower"];

		assert (_rate == 0);
	},
	// Test power on
	{
		_generator = createHashMapObject [AE3_power_outlet, [objNull, 10]];
		_generator call ["turnOn"];
		_rate = _generator call ["_calcPower"];

		assert (_rate == 10);
	}
];