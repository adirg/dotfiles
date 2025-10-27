function config()
    local dap = require('dap')

    dap.adapters.gdb = {
        type = 'executable',
        command = 'gdb',
        args = { '--interpreter=dap', '--eval-comman', 'set print pretty on' },
    }

    local common = {
        {
            name = 'Launch file',
            type = 'gdb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtBeginningOfMainSubprogram = true,
        },
        {
            name = 'Attach process',
            type = 'gdb',
            request = 'attach',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            pid = function()
                return tonumber(vim.fn.input("PID: "))
            end,
            cwd = '${workdpaceFolder}',
        },
        {
            name = 'Attach gdbserver',
            type = 'gdb',
            request = 'attach',
            target = function()
                return vim.fn.input('gdbserver host:port: ', 'localhost:12345')
            end,
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workdpaceFolder}',
        },
    }

    dap.configurations.cpp = common
    dap.configurations.c = common

    vim.keymap.set('n', '<F5>', dap.continue)
    vim.keymap.set('n', '<F6>', dap.step_over)
    vim.keymap.set('n', '<F7>', dap.step_into)
    vim.keymap.set('n', '<F8>', dap.step_out)
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
    vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
    vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<leader>dr', dap.repl.open)
    vim.keymap.set('n', '<leader>dl', dap.run_last)

    local dapui = require('dapui')

    dapui.setup()
    vim.keymap.set('n', '<F9>', dapui.toggle)
end

return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap'
    },
    config = config
}
