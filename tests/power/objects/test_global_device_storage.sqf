[
	// Test
	{
		AE3_power_global_device_storage set [1, ["_devices", []]]; // Reset _devices

		_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];
		_generator = createHashMapObject [AE3_power_outlet, [objNull, 10]];
		
		
		_storage = createHashMapObject [AE3_power_global_device_storage];
		_devices = _storage call ["get_devices"];

		assert (count _devices == 3);
		assert (_devices select 0 isEqualRef _consumer);
		assert (_devices select 1 isEqualRef _battery);
		assert (_devices select 2 isEqualRef _generator);

		AE3_power_global_device_storage set [1, ["_devices", []]];
	}
];