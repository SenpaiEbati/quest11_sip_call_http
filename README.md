sip_call_http
=====

===> Verifying dependencies...
===> Analyzing applications...
===> Compiling sip_call_http
Erlang/OTP 21 [erts-10.3.5.19] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [hipe]

Eshell V10.3.5.19  (abort with ^G)
1> 13:50:10.818 [notice] Skipping STUN stun.ideasip.com
13:50:10.820 [notice] STUN could not find external IP!!
13:50:10.899 [info] Checking STUN stun.voip.eutelia.it
13:50:13.369 [warning] Current NAT is changing ports!
13:50:13.374 [info] NkPACKET vdevelop has started.
13:50:13.374 [info] Main IP is 127.0.0.1 (::1). External IP is 176.12.77.13
13:50:13.378 [info] NkSERVER vdevelop has started.
13:50:13.387 [info] NkSIP v0.6.0 has started
==== Compile Cowboy ====
==== Start Cowboy ====
==== Start SIP ====
sip_call_http_sup: ChildSpecs [#{id => {nkserver,sip_server},
                                 restart => permanent,shutdown => 15000,
                                 start =>
                                  {nkserver,start_link,
                                   [<<"Sip">>,sip_server,
                                    #{plugins => [nksip,nksip_registrar],
                                      sip_listen => "sip:all:5060",
                                      sip_local_host => "localhost"}]},
                                 type => supervisor},
                               #{id => {nkserver,sip_client},
                                 restart => permanent,shutdown => 15000,
                                 start =>
                                  {nkserver,start_link,
                                   [<<"Sip">>,sip_client,
                                    #{plugins => [nksip,nksip_uac_auto_auth],
                                      sip_from => "sip:sip_client@127.0.0.1",
                                      sip_listen => "sip:127.0.0.1:5075",
                                      sip_local_host => "localhost"}]},
                                 type => supervisor}]
13:50:13.442 [info] NkSERVER srv 'sip_server' (Sip) dispatcher compilation completed
13:50:13.457 [notice] NkSERVER srv 'sip_server' (Sip) service server started (<0.570.0>, <0.571.0>)
13:50:13.463 [info] NkSERVER srv 'sip_server' (Sip) listeners started
13:50:13.463 [notice] NkSERVER srv 'sip_server' (Sip) service status updated 'init' -> 'running'
13:50:13.476 [info] NkSERVER srv 'sip_client' (Sip) dispatcher compilation completed
++++ Supervisor tree: sip_call_http_sup <0.567.0>
13:50:13.484 [notice] NkSERVER srv 'sip_client' (Sip) service server started (<0.681.0>, <0.682.0>)
+-- <0.567.0> sip_call_http_sup <supervisor> {registered_name,
                                              sip_call_http_sup}
|    +-- <0.680.0> {nkserver,sip_client} <supervisor> []
|    |    +-- <0.682.0> server (worker, modules: [nkserver_srv]) {registered_name,
                                                        sip_client}
|    |    +-- <0.681.0> supervisor <supervisor> []
|    |    |    +-- <0.684.0> {{<<"Sip">>,sip_client},<<"udp:127.0.0.1:5075">>} (worker, modules: [nkpacket_transport_udp]) []
|    +-- <0.569.0> {nkserver,sip_server} <supervisor> []
|    |    +-- <0.571.0> server (worker, modules: [nkserver_srv]) {registered_name,
                                                        sip_server}
|    |    +-- <0.570.0> supervisor <supervisor> []
|    |    |    +-- <0.575.0> {{<<"Sip">>,sip_server},<<"udp:0.0.0.0:5060">>} (worker, modules: [nkpacket_transport_udp]) []
13:50:13.484 [info] NkSERVER srv 'sip_client' (Sip) listeners started
13:50:13.484 [notice] NkSERVER srv 'sip_client' (Sip) service status updated 'init' -> 'running'

+++ {state,sip_client,<<"Sip">>,
        #{class => <<"Sip">>,
          config => 
              #{sip_from =>
                    {uri,sip,<<"sip_client">>,<<>>,<<"127.0.0.1">>,0,<<>>,[],
                        [],[],[],<<>>},
                sip_listen => <<"sip:127.0.0.1:5075">>,
                sip_local_host => <<"localhost">>},
          config_cache =>
              #{nksip =>
                    #{all_config =>
                          {config,
                              [<<"INVITE">>,<<"ACK">>,<<"CANCEL">>,<<"BYE">>,
                               <<"OPTIONS">>,<<"INFO">>,<<"UPDATE">>,
                               <<"SUBSCRIBE">>,<<"NOTIFY">>,<<"REFER">>,
                               <<"MESSAGE">>],
                              [<<"path">>],
                              60,5,30,
                              {uri,sip,<<"sip_client">>,<<>>,<<"127.0.0.1">>,
                                  0,<<>>,[],[],[],[],<<>>},
                              undefined,[],[],false,100000,<<"localhost">>,
                              auto,[],
                              {call_times,500,4000,5000,180,900,1800},
                              1300}},
                nksip_uac_auto_auth => #{max_tries => 5,passwords => []}},
          expanded_plugins => [nkserver,nksip,nksip_uac_auto_auth,sip_client],
          hash => 127028962,id => sip_client,
          plugins => [nksip,nksip_uac_auto_auth],
          timestamp => 1781160613462,
          uuid => <<"cb5df1cc-53f4-c5a7-3fe6-a8a159e6084a">>},
        #{last_status_time => 1781160613484,status => running},
        <0.681.0>,#{}}

+++ {status,<0.682.0>,
     {module,gen_server},
     [[{'$initial_call',{nkserver_srv,init,1}},
       {'$ancestors',[<0.680.0>,sip_call_http_sup,<0.553.0>]}],
      running,<0.680.0>,[],
      [{header,"Status for generic server sip_client"},
       {data,[{"Status",running},{"Parent",<0.680.0>},{"Logged events",[]}]},
       {data,
        [{"State",
          {state,sip_client,<<"Sip">>,
           #{class => <<"Sip">>,
             config =>
              #{sip_from =>
                 {uri,sip,<<"sip_client">>,<<>>,<<"127.0.0.1">>,0,<<>>,[],[],
                  [],[],<<>>},
                sip_listen => <<"sip:127.0.0.1:5075">>,
                sip_local_host => <<"localhost">>},
             config_cache =>
              #{nksip =>
                 #{all_config =>
                    {config,
                     [<<"INVITE">>,<<"ACK">>,<<"CANCEL">>,<<"BYE">>,
                      <<"OPTIONS">>,<<"INFO">>,<<"UPDATE">>,<<"SUBSCRIBE">>,
                      <<"NOTIFY">>,<<"REFER">>,<<"MESSAGE">>],
                     [<<"path">>],
                     60,5,30,
                     {uri,sip,<<"sip_client">>,<<>>,<<"127.0.0.1">>,0,<<>>,
                      [],[],[],[],<<>>},
                     undefined,[],[],false,100000,<<"localhost">>,auto,[],
                     {call_times,500,4000,5000,180,900,1800},
                     1300}},
                nksip_uac_auto_auth => #{max_tries => 5,passwords => []}},
             expanded_plugins =>
              [nkserver,nksip,nksip_uac_auto_auth,sip_client],
             hash => 127028962,id => sip_client,
             plugins => [nksip,nksip_uac_auto_auth],
             timestamp => 1781160613462,
             uuid => <<"cb5df1cc-53f4-c5a7-3fe6-a8a159e6084a">>},
           #{last_status_time => 1781160613484,status => running},
           <0.681.0>,#{}}}]}]]}
===> Booted ranch
===> Booted cowlib
===> Booted cowboy
===> Booted syntax_tools
===> Booted compiler
===> Booted goldrush
===> Booted lager
===> Booted enotify
===> Booted jsone
===> Booted yamerl
===> Booted mnesia
===> Booted runtime_tools
===> Booted eper
===> Booted recon
===> Booted mimerl
===> Booted rfc3339
===> Booted parsexml
===> Booted nklib
===> Booted ssh
===> Booted gun
===> Booted nkpacket
===> Booted nkserver
===> Booted nksip
===> Booted sip_call_http
sip_server: sip_authorize()
sip_server: trying to auth user []
sip_server: sip_authorize()
sip_server: trying to auth user []
sip_server: sip_authorize()
sip_server: trying to auth user []
sip_server: sip_get_user_pass(<<"3003">>)
sip_server: sip_authorize()
sip_server: trying to auth user []
sip_server: sip_route(User = <<>>)
sip_server: sip_register(From <<"3003">>)
REGISTER OK: {<<"3003">>,<<"localhost">>}
sip_server: sip_authorize()
sip_server: trying to auth user []
sip_server: sip_authorize()
sip_server: trying to auth user []
sip_server: sip_route(User = <<"3003">>)
sip_server: sip_authorize()
sip_server: trying to auth user []
sip_server: sip_route(User = <<"1001">>)
sip_server: sip_invite(From <<"3003">>, User <<"1001">>)
Saved mapping: <<"3003">> -> {uri,sip,<<"3003">>,<<>>,<<"127.0.0.1">>,5061,
                                  <<>>,[],[],[],[],<<>>}
GET /api/call/<<"3003">>
sip_client: calling back to client {uri,sip,<<"3003">>,<<>>,<<"127.0.0.1">>,
                                       5061,<<>>,[],[],[],[],<<>>}
GET /api/call/<<"3004">>

curl
=====
❯ curl http://localhost:8080/api/call/3003
{"status":"calling","user":"3003"}%                                             
❯ curl http://localhost:8080/api/call/3004
{"error":"User not found"}%                                                     


Build
-----

    $ rebar3 compile
