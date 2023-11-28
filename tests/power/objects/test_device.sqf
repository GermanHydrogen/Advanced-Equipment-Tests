[
	{
		_id_counter = AE3_power_base_device select 1;
		_id_counter set [1, 0];

		_first_device = createHashMapObject [AE3_power_base_device];
		_second_device = createHashMapObject [AE3_power_base_device];

		assert (_first_device call ["get_id"] == 0);
		assert (_second_device call ["get_id"] == 1);
	}
];