{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    clipboard.providers.wl-copy.enable = true;
    colorschemes.catppuccin.enable = true;
    opts = {
      tabstop = 2;
      shiftwidth = 2;
      shiftround = true;
      expandtab = true;
      pumheight = 10;
      laststatus = 3;
      clipboard = "unnamedplus";
      # fix weird indent on colons
      indentkeys = "0{,0},0#,!^F,o,O,e";
    };
    globals = {
      netrw_banner = 0;
      netrw_liststyle = 3;
      netrw_winsize = 15;
    };
    plugins = {
      lsp = {
        enable = true;
        servers = {
          clangd = {
            enable = true;
            cmd = ["clangd"];
          };
          nixd.enable = true;
        };
      };
      cmp = {
        enable = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {name = "buffer";}
            {name = "path";}
          ];
          completion = {
            completeopt = "menu,menuone,noinsert";
          };
          mapping = {
            __raw = ''
              cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<S-CR>"] = cmp.mapping.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
                }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-CR>"] = function(fallback)
                  cmp.abort()
                  fallback()
                end,
              })
            '';
          };
          formatting = {
            format = ''
              function(_, item)
                local max_width = 25
                local fixed_width = true
                local ellipsis_char = "..."

                item.menu = ""

                local label = item.abbr:gsub("%s+", "")
                if string.len(label) > max_width then
                  item.abbr = string.sub(label, 0, max_width - string.len(ellipsis_char)) .. ellipsis_char
                elseif string.len(label) < max_width and fixed_width then
                  item.abbr = label .. string.rep(" ", max_width - string.len(label))
                else
                  item.abbr = label
                end

                return item
              end
            '';
          };
          window = {
            completion = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel";
            };
            documentation = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel";
            };
          };
          experimental = {
            ghost_text = true;
          };
        };
      };
      luasnip = {
        enable = true;
        fromVscode = [
          {}
        ];
      };
      friendly-snippets.enable = true;
      cmp-cmdline.enable = true;
      cmp-buffer.enable = true;
      cmp_luasnip.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lsp.enable = true;
      treesitter = {
        enable = true;
        indent = true;
      };
      mini = {
        enable = true;
        modules = {
          basics = {};
          statusline = {};
          surround = {
            mappings = {
              add = "gsa";
              delete = "gsd";
              find = "gsf";
              find_left = "gsF";
              highlight = "gsh";
              replace = "gsr";
              update_n_lines = "gsn";
            };
          };
          notify = {};
          git = {};
          tabline = {};
          ai = {};
          files = {};
          pick = {};
        };
      };
      nvim-autopairs.enable = true;
      flash = {
        enable = true;
        highlight = {
          backdrop = false;
          groups.backdrop = "";
        };
      };
    };
    keymaps = [
      # diagnostics
      # note: <c-w>d and <c-w><c-d> will execute open_float
      {
        key = "<space>d";
        action = "vim.diagnostic.open_float";
        mode = ["n"];
      }
      # [d and ]d are mapped to this by default in nvim 0.10
      {
        key = "[d";
        action = "vim.diagnostic.goto_prev";
        mode = ["n"];
      }
      {
        key = "]d";
        action = "vim.diagnostic.goto_next";
        mode = ["n"];
      }
      {
        key = "<space>q";
        action = "vim.diagnostic.setloclist";
        mode = ["n"];
      }
      # buffers
      {
        key = "<S-h>";
        action = "<cmd>bprevious<cr>";
        mode = ["n"];
      }
      {
        key = "<S-l>";
        action = "<cmd>bnext<cr>";
        mode = ["n"];
      }
      {
        key = "[b";
        action = "<cmd>bprevious<cr>";
        mode = ["n"];
      }
      {
        key = "]b";
        action = "<cmd>bnext<cr>";
        mode = ["n"];
      }
      {
        key = "<leader>bd";
        action = "<cmd>bd<cr>";
        mode = ["n"];
      }
      # netrw
      {
        key = "<space>e";
        action = "<cmd>Lex<cr>";
        mode = ["n"];
      }
      # flash.nvim
      {
        key = "s";
        mode = ["n" "x" "o"];
        action = {
          __raw = "function() require('flash').jump() end";
        };
      }
      {
        key = "S";
        mode = ["n" "x" "o"];
        action = {
          __raw = "function() require('flash').treesitter() end";
        };
      }
      {
        key = "r";
        mode = ["o"];
        action = {
          __raw = "function() require('flash').remote() end";
        };
      }
      {
        key = "R";
        mode = ["o" "x"];
        action = {
          __raw = "function() require('flash').treesitter_search() end";
        };
      }
      {
        key = "<c-s>";
        action = {
          __raw = "function() require('flash').toggle() end";
        };
        mode = ["c"];
      }
      # mini.pick
      {
        key = "<leader><leader>";
        action = "<cmd>Pick files<cr>";
      }
      {
        key = "<leader>ff";
        action = "<cmd>Pick files<cr>";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Pick grep_live<cr>";
      }
      # mini.files
      {
        key = "<leader>fe";
        action = {
          __raw = "function() require('mini.files').open(vim.uv.cwd(), true) end";
        };
      }
    ];
    # currently, cmdline cmp nixvim is bugged, so we do this
    extraConfigLua = ''
      local cmp = require("cmp")

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- for shaders and justfile treesitter
      vim.filetype.add({
        extension = {
          vert = "glsl",
          tesc = "glsl",
          tese = "glsl",
          frag = "glsl",
          geom = "glsl",
          comp = "glsl",
          just = "just",
        },
        filename = {
          ["justfile"] = "just",
          [".justfile"] = "just",
        },
      })
    '';
  };
}
