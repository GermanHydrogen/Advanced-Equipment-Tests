[
	// Test get effective max recharge rate (off)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];
		_rate = _battery call ["get_effective_max_recharge_rate"];

		assert (_rate == 0);
	},
	// Test get effective max recharge rate (effective)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 195, 10]];

		_rate = _battery call ["get_effective_max_discharge_rate"];

		assert (_rate == 0);
	},
	// Test get effective max recharge rate (normal)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];
		_battery call ["turnOn"];

		_rate = _battery call ["get_effective_max_recharge_rate"];

		assert (_rate == 10);
	},
	// Test get effective max recharge rate (effective)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 195, 10]];
		_battery call ["turnOn"];

		_rate = _battery call ["get_effective_max_recharge_rate"];

		assert (_rate == 5);
	},
	// Test get effective max discharge rate (normal)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];
		_battery call ["turnOn"];

		_rate = _battery call ["get_effective_max_discharge_rate"];

		assert (_rate == 10);
	},
	// Test get effective max discharge rate (effective)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 5, 10]];
		_battery call ["turnOn"];

		_rate = _battery call ["get_effective_max_discharge_rate"];

		assert (_rate == 5);
	},
	// Test calc power (charge)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 10, 10]];
		_battery call ["turnOn"];

		_power = _battery call ["_calc_power", [20]];
		_charge = (_battery get "_battery_state") get "charge";

		assert (_power == 10);
		assert (_charge == 20);
	},
	// Test calc power (over charge)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 195, 10]];
		_battery call ["turnOn"];

		_power = _battery call ["_calc_power", [20]];
		_charge = (_battery get "_battery_state") get "charge";

		assert (_power == 5);
		assert (_charge == 200);
	},
	// Test calc power (discharge)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 10, 10]];
		_battery call ["turnOn"];

		_power = _battery call ["_calc_power", [-20]];
		_charge = (_battery get "_battery_state") get "charge";

		assert (_power == -10);
		assert (_charge == 0);
	},
	// Test calc power (over discharge)
	{
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 5, 10]];
		_battery call ["turnOn"];

		_power = _battery call ["_calc_power", [-20]];
		_charge = (_battery get "_battery_state") get "charge";

		assert (_power == -5);
		assert (_charge == 0);
	}
]