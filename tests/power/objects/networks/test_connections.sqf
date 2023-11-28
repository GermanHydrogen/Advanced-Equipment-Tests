
[
	/*
	{	// Test connect two nodes

		_node_1 = createHashMapObject [AE3_power_connection_node];
		_node_2 = createHashMapObject [AE3_power_connection_node];

		_node_1 call ["connect", [_node_2]];

		assert (_node_2 in (_node_1 call ["get_connections"]));
		assert (_node_1 in (_node_2 call ["get_connections"]));
	},

	{	// Test connect a node to leaf
		
		_node = createHashMapObject [AE3_power_connection_node];
		_leaf = createHashMapObject [AE3_power_connection_leaf];

		_node call ["connect", [_leaf]];

		assert (_leaf in (_node call ["get_connections"]));
		assert (_node in (_leaf call ["get_connections"]));
	},

	{	// Test connect a leaf to node
		
		_node = createHashMapObject [AE3_power_connection_node];
		_leaf = createHashMapObject [AE3_power_connection_leaf];

		_leaf call ["connect", [_node]];

		assert (_leaf in (_node call ["get_connections"]));
		assert (_node in (_leaf call ["get_connections"]));
	},

	{	// Test disconnect two nodes

		_node_1 = createHashMapObject [AE3_power_connection_node];
		_node_2 = createHashMapObject [AE3_power_connection_node];

		_node_1 set ["_connections", [_node_2]];
		_node_2 set ["_connections", [_node_1]];

		_node_1 call ["disconnect", [_node_2]];

		assert !(_node_2 in (_node_1 call ["get_connections"]));
		assert !(_node_1 in (_node_2 call ["get_connections"]));
	},

	{	// Test disconnect a node to leaf
		
		_node = createHashMapObject [AE3_power_connection_node];
		_leaf = createHashMapObject [AE3_power_connection_leaf];

		_node set ["_connections", [_leaf]];
		_leaf set ["_connection", _node];

		_node call ["disconnect", [_leaf]];

		assert !(_leaf in (_node call ["get_connections"]));
		assert !(_node in (_leaf call ["get_connections"]));
	},

	{	// Test disconnect a leaf to node
		
		_node = createHashMapObject [AE3_power_connection_node];
		_leaf = createHashMapObject [AE3_power_connection_leaf];

		_node set ["_connections", [_leaf]];
		_leaf set ["_connection", _node];

		_leaf call ["disconnect"];

		assert !(_leaf in (_node call ["get_connections"]));
		assert !(_node in (_leaf call ["get_connections"]));
	}
	*/
];