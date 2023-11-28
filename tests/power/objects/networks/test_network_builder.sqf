
[
	
	// Test
	{
		AE3_power_global_device_storage set [1, ["_devices", []]]; // Reset _devices

		_connection_list = createHashMapObject [AE3_power_connection_list];
		_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];

		_connection_list call ["connect", [_consumer, _battery]];

		_devices = [_consumer, _battery];

		_network_builder = createHashMapObject [AE3_power_network_builder];
		_network_builder call ["build", [_devices]];

		_networks = _network_builder call ["get_networks"];

		assert (count _networks == 1);

		_network = _networks select 0;

		assert (_consumer in (_network get "devices"));
		assert (_battery in (_network get "batteries"));

		AE3_power_global_device_storage set [1, ["_devices", []]]; // Reset _devices
	}
	
];