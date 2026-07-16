return {
    runners = {
        {
            kind = "EXE",
            label = "C: compile and execute",
            order = 1,
            command = [[:AsyncRun -mode=term -pos=floaterm -cwd=$(VIM_FILEDIR) gcc $(VIM_FILEPATH) -o $(VIM_FILEDIR)/$(VIM_FILENOEXT) && $(VIM_FILEDIR)/$(VIM_FILENOEXT)]],
        },
        {
            kind = "CMP",
            label = "C: compile",
            order = 9,
            command = [[:AsyncRun -mode=term -pos=floaterm -cwd=$(VIM_FILEDIR) gcc $(VIM_FILEPATH) -o $(VIM_FILEDIR)/$(VIM_FILENOEXT)]],
        },
    },
}
