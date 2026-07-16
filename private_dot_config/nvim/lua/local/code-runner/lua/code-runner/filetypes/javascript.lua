return {
    runners = {
        {
            kind = "EXE",
            label = "Node: execute file",
            order = 1,
            command = [[:AsyncRun -mode=term -pos=floaterm node $(VIM_FILEPATH)]],
        },
        {
            kind = "REPL",
            label = "Node: open REPL with file",
            order = 9,
            command = [[:AsyncRun -mode=term -pos=floaterm node -i -e "$(< $(VIM_FILEPATH))"]],
        },
    },
}
