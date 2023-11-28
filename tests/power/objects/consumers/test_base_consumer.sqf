[
	// Test power off
	{
		_consumers = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_rate = _consumers call ["_calc_power"];

		assert (_rate == 0);
	},
	// Test power on
	{
		_consumers = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_consumers call ["turnOn"];
		_rate = _consumers call ["_calc_power"];

		assert (_rate == -10);
	},
	// Test power standby
	{
		_consumers = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_consumers call ["standby"];
		_rate = _consumers call ["_calc_power"];

		assert (_rate == -5);
	}
];