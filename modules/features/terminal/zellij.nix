{ self, inputs, ... }:
{
  flake.nixosModules.terminal =
    { pkgs, config, lib, ... }:
    {

      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.jonathan = { config, ... }: {

        programs.zellij = {
          enable = true;
          enableFishIntegration = true;
          settings.default_mode = "locked";
          settings.copy_command = "wl-copy";
          settings.show_startup_tips = false;
          settings.plugins = {
          compact-bar._args = [ "location=\"zellij:compact-bar\"" ];
          configuration._args = [ "location=\"zellij:configuration\"" ];

          filepicker = {
            _args = [ "location=\"zellij:strider\"" ];
            _children = [
              { cwd = [ "/" ]; }
            ];
          };

          plugin-manager._args = [ "location=\"zellij:plugin-manager\"" ];
          session-manager._args = [ "location=\"zellij:session-manager\"" ];
          status-bar._args = [ "location=\"zellij:status-bar\"" ];
          strider._args = [ "location=\"zellij:strider\"" ];
          tab-bar._args = [ "location=\"zellij:tab-bar\"" ];

          welcome-screen = {
            _args = [ "location=\"zellij:session-manager\"" ];
            _children = [
              { welcome_screen = [ "true" ]; }
            ];
          };
        };

          settings.keybinds = {
            _args = [ "clear-defaults=true" ];

            locked._children = [
              {
                bind = {
                  _args = [ "Ctrl g" ];
                  SwitchToMode = [ "normal" ];
                };
              }
            ];

            pane._children = [
              { bind = { _args = [ "left" ]; MoveFocus = [ "left" ]; }; }
              { bind = { _args = [ "down" ]; MoveFocus = [ "down" ]; }; }
              { bind = { _args = [ "up" ]; MoveFocus = [ "up" ]; }; }
              { bind = { _args = [ "right" ]; MoveFocus = [ "right" ]; }; }
              {
                bind = {
                  _args = [ "c" ];
                  _children = [
                    { SwitchToMode._args = [ "renamepane" ]; }
                    { PaneNameInput._args = [ 0 ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "d" ];
                  _children = [
                    { NewPane._args = [ "down" ]; }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "e" ];
                  _children = [
                    { TogglePaneEmbedOrFloating = {}; }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "f" ];
                  _children = [
                    { ToggleFocusFullscreen = {}; }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              { bind = { _args = [ "h" ]; MoveFocus = [ "left" ]; }; }
              { bind = { _args = [ "j" ]; MoveFocus = [ "down" ]; }; }
              { bind = { _args = [ "k" ]; MoveFocus = [ "up" ]; }; }
              { bind = { _args = [ "l" ]; MoveFocus = [ "right" ]; }; }
              {
                bind = {
                  _args = [ "n" ];
                  _children = [
                    { NewPane = {}; }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              { bind = { _args = [ "p" ]; SwitchToMode = [ "normal" ]; }; }
              {
                bind = {
                  _args = [ "r" ];
                  _children = [
                    { NewPane._args = [ "right" ]; }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "w" ];
                  _children = [
                    { ToggleFloatingPanes = {}; }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "x" ];
                  _children = [
                    { CloseFocus = {}; }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "z" ];
                  _children = [
                    { TogglePaneFrames = {}; }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              { bind = { _args = [ "tab" ]; SwitchFocus = {}; }; }
            ];

            tab._children = [
              { bind = { _args = [ "left" ]; GoToPreviousTab = {}; }; }
              { bind = { _args = [ "down" ]; GoToNextTab = {}; }; }
              { bind = { _args = [ "up" ]; GoToPreviousTab = {}; }; }
              { bind = { _args = [ "right" ]; GoToNextTab = {}; }; }
              { bind = { _args = [ "1" ]; _children = [ { GoToTab._args = [ 1 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "2" ]; _children = [ { GoToTab._args = [ 2 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "3" ]; _children = [ { GoToTab._args = [ 3 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "4" ]; _children = [ { GoToTab._args = [ 4 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "5" ]; _children = [ { GoToTab._args = [ 5 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "6" ]; _children = [ { GoToTab._args = [ 6 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "7" ]; _children = [ { GoToTab._args = [ 7 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "8" ]; _children = [ { GoToTab._args = [ 8 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "9" ]; _children = [ { GoToTab._args = [ 9 ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "[" ]; _children = [ { BreakPaneLeft = {}; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "]" ]; _children = [ { BreakPaneRight = {}; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "b" ]; _children = [ { BreakPane = {}; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "h" ]; GoToPreviousTab = {}; }; }
              { bind = { _args = [ "j" ]; GoToNextTab = {}; }; }
              { bind = { _args = [ "k" ]; GoToPreviousTab = {}; }; }
              { bind = { _args = [ "l" ]; GoToNextTab = {}; }; }
              { bind = { _args = [ "n" ]; _children = [ { NewTab = {}; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              {
                bind = {
                  _args = [ "r" ];
                  _children = [
                    { SwitchToMode._args = [ "renametab" ]; }
                    { TabNameInput._args = [ 0 ]; }
                  ];
                };
              }
              { bind = { _args = [ "s" ]; _children = [ { ToggleActiveSyncTab = {}; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "t" ]; SwitchToMode = [ "normal" ]; }; }
              { bind = { _args = [ "x" ]; _children = [ { CloseTab = {}; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "tab" ]; ToggleTab = {}; }; }
            ];

            resize._children = [
              { bind = { _args = [ "left" ]; Resize = [ "Increase left" ]; }; }
              { bind = { _args = [ "down" ]; Resize = [ "Increase down" ]; }; }
              { bind = { _args = [ "up" ]; Resize = [ "Increase up" ]; }; }
              { bind = { _args = [ "right" ]; Resize = [ "Increase right" ]; }; }
              { bind = { _args = [ "+" ]; Resize = [ "Increase" ]; }; }
              { bind = { _args = [ "-" ]; Resize = [ "Decrease" ]; }; }
              { bind = { _args = [ "=" ]; Resize = [ "Increase" ]; }; }
              { bind = { _args = [ "H" ]; Resize = [ "Decrease left" ]; }; }
              { bind = { _args = [ "J" ]; Resize = [ "Decrease down" ]; }; }
              { bind = { _args = [ "K" ]; Resize = [ "Decrease up" ]; }; }
              { bind = { _args = [ "L" ]; Resize = [ "Decrease right" ]; }; }
              { bind = { _args = [ "h" ]; Resize = [ "Increase left" ]; }; }
              { bind = { _args = [ "j" ]; Resize = [ "Increase down" ]; }; }
              { bind = { _args = [ "k" ]; Resize = [ "Increase up" ]; }; }
              { bind = { _args = [ "l" ]; Resize = [ "Increase right" ]; }; }
              { bind = { _args = [ "r" ]; SwitchToMode = [ "normal" ]; }; }
            ];

            move._children = [
              { bind = { _args = [ "left" ]; MovePane = [ "left" ]; }; }
              { bind = { _args = [ "down" ]; MovePane = [ "down" ]; }; }
              { bind = { _args = [ "up" ]; MovePane = [ "up" ]; }; }
              { bind = { _args = [ "right" ]; MovePane = [ "right" ]; }; }
              { bind = { _args = [ "h" ]; MovePane = [ "left" ]; }; }
              { bind = { _args = [ "j" ]; MovePane = [ "down" ]; }; }
              { bind = { _args = [ "k" ]; MovePane = [ "up" ]; }; }
              { bind = { _args = [ "l" ]; MovePane = [ "right" ]; }; }
              { bind = { _args = [ "m" ]; SwitchToMode = [ "normal" ]; }; }
              { bind = { _args = [ "n" ]; MovePane = {}; }; }
              { bind = { _args = [ "p" ]; MovePaneBackwards = {}; }; }
              { bind = { _args = [ "tab" ]; MovePane = {}; }; }
            ];

            scroll._children = [
              { bind = { _args = [ "Alt left" ]; _children = [ { MoveFocusOrTab._args = [ "left" ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "Alt down" ]; _children = [ { MoveFocus._args = [ "down" ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "Alt up" ]; _children = [ { MoveFocus._args = [ "up" ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "Alt right" ]; _children = [ { MoveFocusOrTab._args = [ "right" ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "e" ]; _children = [ { EditScrollback = {}; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              {
                bind = {
                  _args = [ "f" ];
                  _children = [
                    { SwitchToMode._args = [ "entersearch" ]; }
                    { SearchInput._args = [ 0 ]; }
                  ];
                };
              }
              { bind = { _args = [ "Alt h" ]; _children = [ { MoveFocusOrTab._args = [ "left" ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "Alt j" ]; _children = [ { MoveFocus._args = [ "down" ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "Alt k" ]; _children = [ { MoveFocus._args = [ "up" ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "Alt l" ]; _children = [ { MoveFocusOrTab._args = [ "right" ]; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "s" ]; SwitchToMode = [ "normal" ]; }; }
            ];

            search._children = [
              { bind = { _args = [ "c" ]; SearchToggleOption = [ "CaseSensitivity" ]; }; }
              { bind = { _args = [ "n" ]; Search = [ "down" ]; }; }
              { bind = { _args = [ "o" ]; SearchToggleOption = [ "WholeWord" ]; }; }
              { bind = { _args = [ "p" ]; Search = [ "up" ]; }; }
              { bind = { _args = [ "w" ]; SearchToggleOption = [ "Wrap" ]; }; }
            ];

            session._children = [
              {
                bind = {
                  _args = [ "c" ];
                  _children = [
                    {
                      LaunchOrFocusPlugin._args = [ "configuration" ];
                      LaunchOrFocusPlugin._children = [
                        { floating = [ "true" ]; }
                        { move_to_focused_tab = [ "true" ]; }
                      ];
                    }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              { bind = { _args = [ "d" ]; Detach = {}; }; }
              { bind = { _args = [ "o" ]; SwitchToMode = [ "normal" ]; }; }
              {
                bind = {
                  _args = [ "p" ];
                  _children = [
                    {
                      LaunchOrFocusPlugin._args = [ "plugin-manager" ];
                      LaunchOrFocusPlugin._children = [
                        { floating = [ "true" ]; }
                        { move_to_focused_tab = [ "true" ]; }
                      ];
                    }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "w" ];
                  _children = [
                    {
                      LaunchOrFocusPlugin._args = [ "session-manager" ];
                      LaunchOrFocusPlugin._children = [
                        { floating = [ "true" ]; }
                        { move_to_focused_tab = [ "true" ]; }
                      ];
                    }
                    { SwitchToMode._args = [ "locked" ]; }
                  ];
                };
              }
            ];

            entersearch._children = [
              { bind = { _args = [ "Ctrl c" ]; SwitchToMode = [ "scroll" ]; }; }
              { bind = { _args = [ "esc" ]; SwitchToMode = [ "scroll" ]; }; }
              { bind = { _args = [ "enter" ]; SwitchToMode = [ "search" ]; }; }
            ];

            renametab._children = [
              { bind = { _args = [ "esc" ]; _children = [ { UndoRenameTab = {}; } { SwitchToMode._args = [ "tab" ]; } ]; }; }
            ];

            renamepane._children = [
              { bind = { _args = [ "esc" ]; _children = [ { UndoRenamePane = {}; } { SwitchToMode._args = [ "pane" ]; } ]; }; }
            ];

            "shared_among \"normal\" \"locked\""._children = [
              { bind = { _args = [ "Alt left" ]; MoveFocusOrTab = [ "left" ]; }; }
              { bind = { _args = [ "Alt down" ]; MoveFocus = [ "down" ]; }; }
              { bind = { _args = [ "Alt up" ]; MoveFocus = [ "up" ]; }; }
              { bind = { _args = [ "Alt right" ]; MoveFocusOrTab = [ "right" ]; }; }
              { bind = { _args = [ "Alt +" ]; Resize = [ "Increase" ]; }; }
              { bind = { _args = [ "Alt -" ]; Resize = [ "Decrease" ]; }; }
              { bind = { _args = [ "Alt =" ]; Resize = [ "Increase" ]; }; }
              { bind = { _args = [ "Alt [" ]; PreviousSwapLayout = {}; }; }
              { bind = { _args = [ "Alt ]" ]; NextSwapLayout = {}; }; }
              { bind = { _args = [ "Alt f" ]; ToggleFloatingPanes = {}; }; }
              { bind = { _args = [ "Alt h" ]; MoveFocus = [ "left" ]; }; }
              { bind = { _args = [ "Alt j" ]; MoveFocus = [ "down" ]; }; }
              { bind = { _args = [ "Alt k" ]; MoveFocus = [ "up" ]; }; }
              { bind = { _args = [ "Alt l" ]; MoveFocus = [ "right" ]; }; }
              { bind = { _args = [ "Alt n" ]; NewPane = {}; }; }
              { bind = { _args = [ "Alt t" ]; NewTab = {}; }; }
              { bind = { _args = [ "Alt q" ]; CloseFocus = {}; }; }
              { bind = { _args = [ "Alt ." ]; GoToNextTab = {}; }; }
              { bind = { _args = [ "Alt ," ]; GoToPreviousTab = {}; }; }
            ];

            "shared_among \"scroll\" \"search\""._children = [
              { bind = { _args = [ "PageDown" ]; PageScrollDown = {}; }; }
              { bind = { _args = [ "PageUp" ]; PageScrollUp = {}; }; }
              { bind = { _args = [ "left" ]; PageScrollUp = {}; }; }
              { bind = { _args = [ "down" ]; ScrollDown = {}; }; }
              { bind = { _args = [ "up" ]; ScrollUp = {}; }; }
              { bind = { _args = [ "right" ]; PageScrollDown = {}; }; }
              { bind = { _args = [ "Ctrl b" ]; PageScrollUp = {}; }; }
              { bind = { _args = [ "Ctrl c" ]; _children = [ { ScrollToBottom = {}; } { SwitchToMode._args = [ "locked" ]; } ]; }; }
              { bind = { _args = [ "d" ]; HalfPageScrollDown = {}; }; }
              { bind = { _args = [ "Ctrl f" ]; PageScrollDown = {}; }; }
              { bind = { _args = [ "h" ]; PageScrollUp = {}; }; }
              { bind = { _args = [ "j" ]; ScrollDown = {}; }; }
              { bind = { _args = [ "k" ]; ScrollUp = {}; }; }
              { bind = { _args = [ "l" ]; PageScrollDown = {}; }; }
              { bind = { _args = [ "u" ]; HalfPageScrollUp = {}; }; }
            ];

            "shared_among \"normal\" \"resize\" \"tab\" \"scroll\" \"prompt\" \"tmux\""._children = [
              { bind = { _args = [ "p" ]; SwitchToMode = [ "pane" ]; }; }
            ];

            "shared_among \"renametab\" \"renamepane\""._children = [
              { bind = { _args = [ "Ctrl c" ]; SwitchToMode = [ "locked" ]; }; }
            ];

            "shared_except \"locked\" \"renametab\" \"renamepane\""._children = [
              { bind = { _args = [ "Ctrl g" ]; SwitchToMode = [ "locked" ]; }; }
              { bind = { _args = [ "Ctrl q" ]; Quit = {}; }; }
            ];

            "shared_except \"locked\" \"entersearch\""._children = [
              { bind = { _args = [ "enter" ]; SwitchToMode = [ "locked" ]; }; }
            ];

            "shared_except \"locked\" \"entersearch\" \"renametab\" \"renamepane\""._children = [
              { bind = { _args = [ "esc" ]; SwitchToMode = [ "locked" ]; }; }
            ];

            "shared_except \"locked\" \"entersearch\" \"renametab\" \"renamepane\" \"move\""._children = [
              { bind = { _args = [ "m" ]; SwitchToMode = [ "move" ]; }; }
            ];

            "shared_except \"locked\" \"entersearch\" \"search\" \"renametab\" \"renamepane\" \"session\""._children = [
              { bind = { _args = [ "o" ]; SwitchToMode = [ "session" ]; }; }
            ];

            "shared_except \"locked\" \"tab\" \"entersearch\" \"renametab\" \"renamepane\""._children = [
              { bind = { _args = [ "t" ]; SwitchToMode = [ "tab" ]; }; }
            ];

            "shared_except \"locked\" \"tab\" \"scroll\" \"entersearch\" \"renametab\" \"renamepane\""._children = [
              { bind = { _args = [ "s" ]; SwitchToMode = [ "scroll" ]; }; }
            ];

            "shared_except \"locked\" \"resize\" \"pane\" \"tab\" \"entersearch\" \"renametab\" \"renamepane\""._children = [
              { bind = { _args = [ "r" ]; SwitchToMode = [ "resize" ]; }; }
            ];

          };
        };
      };
    };
}
