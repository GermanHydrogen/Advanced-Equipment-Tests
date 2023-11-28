[
	{
		_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];

		_network = createHashMapObject [AE3_power_network];

		_network call ["add_member", _consumer];
		_network call ["add_member", _battery];

		_result = [_network] call AE3_power_fnc_simulateNetwork;

		assert (!(isNil "_result"));

		assert _result;
	},
	{
		_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];

		_consumer call ["turnOn"];

		_network = createHashMapObject [AE3_power_network];

		_network call ["add_member", _consumer];
		_network call ["add_member", _battery];

		_result = [_network] call AE3_power_fnc_simulateNetwork;

		assert (!(isNil "_result"));

		assert !_result;
	},
	{
		_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 0, 10]];

		_consumer call ["turnOn"];
		_battery call ["turnOn"];

		_consumer call ["update_power"];


		_network = createHashMapObject [AE3_power_network];

		_network call ["add_member", _consumer];
		_network call ["add_member", _battery];

		_result = [_network] call AE3_power_fnc_simulateNetwork;

		assert (!(isNil "_result"));

		assert !_result;
	},
	{
		_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];

		_consumer call ["turnOn"];
		_battery call ["turnOn"];

		_consumer call ["update_power"];

		_network = createHashMapObject [AE3_power_network];

		_network call ["add_member", _consumer];
		_network call ["add_member", _battery];

		_result = [_network] call AE3_power_fnc_simulateNetwork;

		assert (!(isNil "_result"));

		assert _result;
	}
];
