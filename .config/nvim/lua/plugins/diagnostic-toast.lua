return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    local stages_util = require("notify.stages.util")

    local function get_buffer_right_col()
      local win = vim.api.nvim_get_current_win()
      local win_width = vim.api.nvim_win_get_width(win)
      local win_pos = vim.api.nvim_win_get_position(win)
      return win_pos[2] + win_width
    end

    local custom_stages = {

      function(state)
        local next_height = state.message.height + 2
        local next_row = stages_util.available_slot(state.open_windows, next_height, "top_down")
        if not next_row then
          return nil
        end
        return {
          relative = "editor",
          anchor = "NE",
          width = state.message.width,
          height = state.message.height,
          col = get_buffer_right_col(),
          row = next_row,
          border = "rounded",
          style = "minimal",
          opacity = 0,
        }
      end,
      function(state, win)
        return {
          opacity = { 100 },
          row = {
            stages_util.slot_after_previous(win, state.open_windows, "top_down"),
            frequency = 3,
            complete = function()
              return true
            end,
          },
        }
      end,
      function(state, win)
        return {
          time = true,
          row = {
            stages_util.slot_after_previous(win, state.open_windows, "top_down"),
            frequency = 3,
            complete = function()
              return true
            end,
          },
        }
      end,
      function(state, win)
        return {
          width = {
            1,
            frequency = 2.5,
            damping = 0.9,
            complete = function(cur_width)
              return cur_width < 3
            end,
          },
          opacity = {
            0,
            frequency = 2,
            complete = function(cur_opacity)
              return cur_opacity <= 4
            end,
          },
          row = {
            stages_util.slot_after_previous(win, state.open_windows, "top_down"),
            frequency = 3,
            complete = function()
              return true
            end,
          },
        }
      end,
    }

    notify.setup({
      stages = custom_stages,
      render = "wrapped-default"
    })


    local function diagnostic_notify()
      local line = vim.fn.line(".")
      local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })

      -- Sort diagnostics by severity (errors first)
      table.sort(diagnostics, function(a, b)
        return a.severity < b.severity
      end)

      -- Show notification for each diagnostic
      for _, diagnostic in ipairs(diagnostics) do
        local message = diagnostic.message
        local level = diagnostic.severity
        local levels = {
          [1] = "error",
          [2] = "warn",
          [3] = "info",
          [4] = "hint",
        }
        local filepath = vim.fn.expand("%:.")
        local title = string.format(" │ %s:%d:%d", filepath, line, vim.fn.col("."))

        notify(message, levels[level], {
          title = title,
          timeout = 5000
        })
      end
    end


    local last_line = nil
    vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufReadPost", "CursorMoved" }, {
      callback = function()
        local current_line = vim.fn.line(".")
        if current_line ~= last_line then
          diagnostic_notify()
          last_line = current_line
        end
      end
    })
  end
}
