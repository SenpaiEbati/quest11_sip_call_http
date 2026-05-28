%%%-------------------------------------------------------------------
%% @doc sip_call_http public API
%% @end
%%%-------------------------------------------------------------------

-module(sip_call_http_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    ets:new(sip_uri_cache, [named_table, public]),
    io:format("==== Compile Cowboy ====~n"),
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/api/call/:id", usercall_handler, []},
            {"/", cowboy_static, {priv_file, rest_server, "static/index.html"}}
        ]}
    ]),
    io:format("==== Start Cowboy ====~n"),
    {ok, _} = cowboy:start_clear(
        my_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    io:format("==== Start SIP ====~n"),
    Res = sip_call_http_sup:start_link(),
    sip_call_http_sup:dump(),
    Res.


stop(_State) ->
    ok.

%% internal functions
