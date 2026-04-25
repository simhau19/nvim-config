return {
  'nvim-lualine/lualine.nvim', -- status line
  config = function()
    local lualine = require 'lualine'

    local buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand '%:t') ~= 1
    end

    local config = {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { {
          'mode',
          fmt = function(str)
            return str:sub(1, 1)
          end,
        } },
        lualine_c = {
          {
            'filename',
            cond = buffer_not_empty,
          },
        },
      },
    }

    local cmake = require 'cmake-tools'

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    ins_left {
      function()
        return ' '
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeGenerate'
        end
      end,
      padding = { left = 1, right = 0 },
    }

    ins_left {
      function()
        local preset = cmake.get_configure_preset()
        return '[' .. (preset and preset or 'X') .. ']'
      end,
      cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
      end,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeSelectConfigurePreset'
        end
      end,
      padding = { left = 0, right = 1 },
    }

    ins_left {
      function()
        local type = cmake.get_build_type()
        return '[' .. (type and type or '') .. ']'
      end,
      cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
      end,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeSelectBuildType'
        end
      end,
      padding = { left = 0, right = 1 },
    }

    -- not including cmake kits

    ins_left {
      function()
        return ' '
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeBuild'
        end
      end,
      padding = { left = 1, right = 0 },
    }

    ins_left {
      function()
        local b_preset = cmake.get_build_preset()
        return '[' .. (b_preset and b_preset or 'X') .. ']'
      end,
      cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
      end,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeSelectBuildPreset'
        end
      end,
      padding = { left = 0, right = 1 },
    }

    ins_left {
      function()
        local b_target = cmake.get_build_target()[1]
        return '[' .. (b_target and b_target or 'X') .. ']'
      end,
      cond = function()
        return cmake.is_cmake_project() and (not cmake.has_cmake_preset() or cmake.get_build_preset() == 'None')
      end,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeSelectBuildTarget'
        end
      end,
      padding = { left = 0, right = 1 },
    }

    ins_left {
      function()
        return ' '
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeDebug'
        end
      end,
      padding = { left = 1, right = 0 },
    }

    ins_left {
      function()
        return ''
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeRun'
        end
      end,
      padding = { left = 0, right = 0 },
    }

    ins_left {
      function()
        local l_target = cmake.get_launch_target()
        return '[' .. (l_target and l_target or 'X') .. ']'
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if n == 1 and mouse == 'l' then
          vim.cmd 'CMakeSelectLaunchTarget'
        end
      end,
      padding = { left = 0, right = 1 },
    }

    lualine.setup(config)
  end,
}
