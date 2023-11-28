[
	{
		AE3_power_connection_list set [1, ["_connections", createHashMap]];

		_connection_list = createHashMapObject [AE3_power_connection_list];
		_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];

		_connection_list call ["connect", [_consumer, _battery]];

		_battery_id = _battery call ["get_id"];
		_consumer_id = _consumer call ["get_id"];

		_connections = _connection_list get "_connections";

		assert (_battery_id in _connections);
		assert (_consumer in (_connections get _battery_id));

		assert (_consumer_id in (_connection_list get "_connections"));
		assert (_battery in (_connections get _consumer_id));
	},
	{
		AE3_power_connection_list set [1, ["_connections", createHashMap]];

		_connection_list = createHashMapObject [AE3_power_connection_list];
		_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];

		_battery_id = _battery call ["get_id"];
		_consumer_id = _consumer call ["get_id"];

		_connections = _connection_list get "_connections";
		_connections set [_battery_id, [_consumer]];
		_connections set [_consumer_id, [_battery]];

		_connection_list call ["disconnect", [_battery, _consumer]];

		assert (_battery_id in _connections);
		assert (!(_consumer in (_connections get _battery_id)));

		assert (_consumer_id in (_connection_list get "_connections"));
		assert (!(_battery in (_connections get _consumer_id)));
	},
	{
		AE3_power_connection_list set [1, ["_connections", createHashMap]];

		_connection_list = createHashMapObject [AE3_power_connection_list];
		_first_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];
		_second_consumer = createHashMapObject [AE3_power_base_consumer, [objNull, 10, 0.5]];

		_battery = createHashMapObject [AE3_power_battery, [objNull, 200, 20, 10]];

		_battery_id = _battery call ["get_id"];
		_consumer_id = _first_consumer call ["get_id"];

		_connections = _connection_list get "_connections";
		_connections set [_battery_id, [_first_consumer]];
		_connections set [_consumer_id, [_battery]];

		_connection_list call ["connect", [_first_consumer, _battery]];
		_connection_list call ["connect", [_first_consumer, _second_consumer]];

		assert (_battery_id in _connections);
		assert (!(_first_consumer in (_connections get _battery_id)));

		assert (_consumer_id in (_connection_list get "_connections"));
		assert (_second_consumer in (_connections get _consumer_id));
	}
]