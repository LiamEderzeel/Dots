local gl = require('galaxyline')
-- get my theme in galaxyline repo
-- local colors = require('galaxyline.theme').default

-- let s:bg = { 'gui': '#0f111a', 'cterm': 'none' }
-- let s:fg = { 'gui': '#8f93a2', 'cterm': 103 }
-- let s:invisibles = { 'gui': '#80869e', 'cterm': 103 }
-- let s:comments = { 'gui': '#464b5d', 'cterm': 60 }
-- let s:selection = { 'gui': '#1f2233', 'cterm': 60 }
-- let s:guides = { 'gui': '#3b3f51', 'cterm': 17 }
-- let s:line_numbers = { 'gui': '#3b3f51', 'cterm': 60 }
-- let s:line_highlight = { 'gui': '#0a0c12', 'cterm': 0 }k
-- let s:bg = { 'gui': '#263238', 'cterm': 'none' }

-- let s:fg = { 'gui': '#eeffff', 'cterm': 231 }
-- let s:invisibles = { 'gui': '#65738e', 'cterm': 66 }
-- let s:comments = { 'gui': '#546e7a', 'cterm': 145 }
-- let s:caret = { 'gui': '#ffcc00', 'cterm': 220 }
-- let s:selection = { 'gui': '#2c3b41', 'cterm': 239 }
-- let s:guides = { 'gui': '#37474f', 'cterm': 17 }
-- let s:line_numbers = { 'gui': '#37474f', 'cterm': 145 }
-- let s:line_highlight = { 'gui': '#1a2327', 'cterm': 235 }
-- let s:white = { 'gui': '#ffffff', 'cterm': 231 }
-- let s:black = { 'gui': '#000000', 'cterm': 232 }
-- let s:red = { 'gui': '#ff5370', 'cterm': 203 }
-- let s:orange = { 'gui': '#f78c6c', 'cterm': 209 }
-- let s:yellow = { 'gui': '#ffcb6b', 'cterm': 11 }
-- let s:green = { 'gui': '#c3e88d', 'cterm': 2 } " 186 –– almost perfect match
-- let s:cyan = { 'gui': '#89ddff', 'cterm': 117 }
-- let s:blue = { 'gui': '#82aaff', 'cterm': 111 }
-- let s:paleblue = { 'gui': '#b2ccd6', 'cterm': 152 }
-- let s:purple = { 'gui': '#c792ea', 'cterm': 176 }
-- let s:brown = { 'gui': '#c17e70', 'cterm': 137 }
-- let s:pink = { 'gui': '#f07178', 'cterm': 204 }
-- let s:violet = { 'gui': '#bb80b3', 'cterm': 139 }

local colors = {
  bg = '#0F111A',
  yellow = '#ffcb6b',
	dark_yellow = '#D7BA7D',
  cyan = '#4EC9B0',
  green = '#c3e88d',
  light_green = '#B5CEA8',
  string_orange = '#CE9178',
  orange = '#f78c6c',
  purple = '#c792ea',
  magenta = '#D16D9E',
  grey = '#858585',
  blue = '#517BCE',
  vivid_blue = '#517BCE',
	light_blue = '#9CDCFE',
  red = '#ff5370',
	error_red = '#F44747',
    white='#ffffff'
}
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.blue,
                i = colors.green,
                v = colors.red,
                [''] = colors.purple,
                V = colors.red,
                c = colors.magenta,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.blue,
                t = colors.blue
            }
            -- vim.api.nvim_command('hi GalaxyViMode guifg=' .. colors.white)
            -- vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color[vim.fn.mode()])
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '▊ '
        end,

        highlight = {colors.red, colors.bg},
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
    },
}
print(vim.fn.getbufvar(0,'ts'))
vim.fn.getbufvar(0,'ts')

gls.left[2] = {
    GitIcon = {
        provider = function()
            return ''
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[3] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.left[4] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green, colors.bg}
    }
}
gls.left[5] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[6] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[1] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.error_red, colors.bg}
    }
}
-- gls.right[2] = {
--     DiagnosticWarn = {
--         provider = 'DiagnosticWarn',
--         icon = '  ',
--         highlight = {colors.orange, colors.bg}
--     }
-- }

-- gls.right[3] = {
--     DiagnosticHint = {
--         provider = 'DiagnosticHint',
--         icon = '  ',
--         highlight = {colors.blue, colors.bg}
--     }
-- }

-- gls.right[4] = {
--     DiagnosticInfo = {
--         provider = 'DiagnosticInfo',
--         icon = '  ',
--         highlight = {colors.blue, colors.bg}
--     }
-- }

-- gls.right[5] = {
--     ShowLspClient = {
--         provider = 'GetLspClient',
--         condition = function()
--             local tbl = {['dashboard'] = true, [' '] = true}
--             if tbl[vim.bo.filetype] then return false end
--             return true
--         end,
--         icon = ' ',
--         highlight = {colors.grey, colors.bg}
--     }
-- }

gls.right[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[8] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[9] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.grey, colors.bg}
  }
}

gls.right[10] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[11] = {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}


gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {provider = 'BufferIcon', highlight = {colors.grey, colors.bg}}
}