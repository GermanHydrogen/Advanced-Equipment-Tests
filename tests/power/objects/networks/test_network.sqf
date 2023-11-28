
[
	// Test init
	{
		_network = createHashMapObject [AE3_power_network];
		
		assert ("devices" in _network);
		assert ("batteries" in _network);
		assert (count (_network get "devices") == 0);
		assert (count (_network get "batteries") == 0);
	},
	// Test add device
	{
		_network = createHashMapObject [AE3_power_network];
		_consumers = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		
		_network call ["add_member", _consumers];

		assert (count (_network get "devices") == 1);
		assert (_network get "devices" select 0 isEqualRef _consumers);
		assert (count (_network get "batteries") == 0);
	},
	// Test add battery
	{
		_network = createHashMapObject [AE3_power_network];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];
		
		_network call ["add_member", _battery];

		assert (count (_network get "batteries") == 1);
		assert ((_network get "devices" select 0) isEqualRef _battery);
		assert (count (_network get "devices") == 0);
	}
];