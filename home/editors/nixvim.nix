{
  pkgs,
  inputs,
  ...
}: {
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
        };
      };
      cmp-cmdline.enable = true;
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
      lualine.enable = true;
      treesitter = {
        enable = true;
        indent = true;
      };
      mini = {
        enable = true;
        modules = {
          basics = {};
        };
      };
      nvim-autopairs.enable = true;
    };
  };
}
