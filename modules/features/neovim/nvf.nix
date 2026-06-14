{ inputs, ... }:
{
  flake.nixosModules.nvf =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {

      imports = [ inputs.nvf.nixosModules.default ];

      # Ensure neovim extra dependencies are installed
      environment.systemPackages = with pkgs; [
        fzf
        ripgrep
        nil
        nixd
        nodejs
        gcc
      ];

      programs.nvf = {
        enable = true;
        settings = {
          vim = {
            globals.mapLocalLeader = " ";
            vimAlias = true;
            viAlias = true;
            syntaxHighlighting = true;

            opts = {
              expandtab = true;
              tabstop = 2;
              shiftwidth = 2;
              softtabstop = 2;
            };

            keymaps = [
              {
                key = "<C-s>";
                mode = "n";
                action = ":w<CR>";
              }
              {
                key = "<Esc>";
                mode = "n";
                action = ":nohlsearch<CR>";
              }
              {
                key = "<C-h>";
                mode = "n";
                action = "<C-w><C-h>";
                desc = "Move focus to left window";
              }

              {
                key = "<C-j>";
                mode = "n";
                action = "<C-w><C-j>";
                desc = "Move focus to left window";
              }
              {
                key = "<C-l>";
                mode = "n";
                action = "<C-w><C-l>";
                desc = "Move focus to left window";
              }
              {
                key = "<C-k>";
                mode = "n";
                action = "<C-w><C-k>";
                desc = "Move focus to left window";
              }
              {
                key = "-";
                mode = "n";
                action = ":Oil --float<CR>";
                desc = "Launch file explorer in floating window";
              }
              {
                key = "<leader>/";
                mode = [
                  "n"
                  "v"
                ];
                action = "gc";
                desc = "Toggle comment";
              }
            ];

            lsp = {
              enable = true;
              formatOnSave = true;
              inlayHints.enable = true;
            };

            languages = {
              enableTreesitter = true;
              nix.enable = true;
              bash.enable = true;
              fish.enable = true;
              lua.enable = true;
            };

            # nvf built-in plugins

            binds.whichKey = {
              enable = true;
            };

            diagnostics = {
              enable = true;
              nvim-lint.enable = true;
            };

            debugger.nvim-dap.enable = true;

            autopairs.nvim-autopairs.enable = true;

            ui = {
              borders = {
                enable = true;
                plugins = {
                  which-key.enable = true;
                  nvim-cmp.enable = true;
                };
              };

            };

            visuals = {
              indent-blankline.enable = true;
              cellular-automaton = {
                enable = true;
                mappings.makeItRain = "<leader>fml";
              };
            };

            comments.comment-nvim = {
              enable = true;
              mappings = {
                toggleOpLeaderLine = "<leader>/";
              };

            };

            autocomplete.blink-cmp = {
              enable = true;
              friendly-snippets.enable = true;
              mappings = {
                complete = "<C-Space>";
                confirm = "<CR>";
                next = "<Tab>";
                previous = "<Tab>";
              };
            };

            telescope = {
              enable = true;
              setupOpts = {
                defaults = {
                  border = true;
                  layout_strategy = "horizontal";
                  # layout_config = {
                  #   prompt_position = "bottom";
                  # };
                  sorting_strategy = "descending";
                };
              };
              mappings = {
                findFiles = "<leader>sf";
                liveGrep = "<leader>sg";
                resume = "<leader>sr";
              };
            };

            tabline.nvimBufferline = {
              enable = true;
              setupOpts.options = {
                always_show_bufferline = false;
                buffer_close_icon = "󰅖";
                modified_icon = "●";
                separator_style = "slope";
              };
              mappings = {
                closeCurrent = "<leader>x";
                cycleNext = "<Tab>";
                cyclePrevious = "<S-Tab>";
              };
            };
            statusline.lualine = {
              enable = true;
            };

            # mini plugins (provided by nvf)
            mini = {
              bufremove.enable = true;
            };

            git = {
              gitsigns = {
                enable = true;
              };
            };

            utility = {
              oil-nvim = {
                enable = true;
                gitStatus.enable = true;
                setupOpts = {
                  default_file_explorer = true;
                  use_default_keymaps = true;
                  skip_confirm_for_simple_edits = true;
                  view_options = {
                    show_hidden = true;
                  };
                };
              };
              grug-far-nvim = {
                enable = true;
              };
            };

            # Extra plugins not available in nvf by default
            lazy.plugins = {
              "godotdev.nvim" = {
                package = pkgs.vimUtils.buildVimPlugin {
                  pname = "godotdev.nvim";
                  version = "0.8.1";

                  src = pkgs.fetchFromGitHub {
                    owner = "Mathijs-Bakker";
                    repo = "godotdev.nvim";
                    tag = "0.8.1";
                    hash = "sha256-JqrXrko/sXjJHCcvROJO62zlVHzNHb07NeQQ0HfhwI8=";
                  };
                };

                # 3. Setup the plugin via nvf's structured API
                setupModule = "godotdev";
                setupOpts = {
                  # Put whatever options the plugin documentation suggests here.
                  # For example, if it has a setting to tweak the godot path or port:
                  # godot_path = "godot";
                };
              };

            };

          };

        };

      };
    };

}
