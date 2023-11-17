
[
	// Test members
	{
		_network = createHashMapObject [AE3_power_network];
		
		assert (count (_network get "members") == 0);
	},
	// Test add memeber
	{
		_network = createHashMapObject [AE3_power_network];
		_consumers = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		
		_network call ["add_member", _consumers];

		assert (_network get "members" select 0 isEqualRef _consumers);
	}
];