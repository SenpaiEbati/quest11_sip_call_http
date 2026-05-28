-module(usercall_handler).
-behaviour(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    Method = cowboy_req:method(Req0),
    Id = cowboy_req:binding(id, Req0),
    handle_request(Method, Id, Req0, State).

%% /api/user/3003
handle_request(<<"GET">>, Id, Req0, State) ->
    io:format("GET /api/call/~p~n", [Id]),
    case ets:lookup(sip_uri_cache, Id) of
        [{Id, Uri}] ->
            %% Совершаем обратный звонок
            case sip_client:call(Uri) of
                ok ->
                    Req = cowboy_req:reply(200,
                        #{<<"content-type">> => <<"application/json">>},
                        jsx:encode(#{<<"status">> => <<"calling">>, <<"user">> => Id}),
                        Req0
                    );
                {error, Reason} ->
                    Req = cowboy_req:reply(500,
                        #{<<"content-type">> => <<"application/json">>},
                        jsx:encode(#{<<"error">> => <<"Call failed">>, <<"reason">> => Reason}),
                        Req0
                    )
            end;
        [] ->
            Req = cowboy_req:reply(404,
                #{<<"content-type">> => <<"application/json">>},
                jsx:encode(#{<<"error">> => <<"User not found">>}),
                Req0
            )
    end,
    {ok, Req, State};


handle_request(_, _, Req0, State) ->
    Req = cowboy_req:reply(405,
        #{<<"content-type">> => <<"application/json">>},
        jsx:encode(#{<<"error">> => <<"Method not allowed">>}),
        Req0
    ),
    {ok, Req, State}.

