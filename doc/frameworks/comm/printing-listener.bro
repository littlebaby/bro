
const broker_port: port &redef;
redef exit_only_after_terminate = T;
redef Comm::endpoint_name = "listener";
global msg_count = 0;

event bro_init()
	{
	Comm::enable();
	Comm::subscribe_to_prints("bro/print/");
	Comm::listen(broker_port, "127.0.0.1");
	}

event Comm::incoming_connection_established(peer_name: string)
	{
	print "Comm::incoming_connection_established", peer_name;
	}

event Comm::print_handler(msg: string)
	{
	++msg_count;
	print "got print message", msg;

	if ( msg_count == 3 )
		terminate();
	}
