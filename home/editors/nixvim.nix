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
    };
    plugins = {
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
      cmp-cmdline.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lsp.enable = true;
      lsp = {
        enable = true;
        servers = {
          clangd = {
            enable = true;
            cmd = ["clangd"];
          };
          nil_ls.enable = true;
        };
      };
      treesitter = {
        enable = true;
        indent = true;
      };
      mini = {
        enable = true;
        modules = {
          basics = {};
          statusline = {};
          surround = {};
          tabline = {};
          ai = {};
        };
      };
      nvim-autopairs.enable = true;
    };
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
    '';
  };
}
