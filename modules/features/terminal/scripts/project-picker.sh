#!/usr/bin/env bash

PROJECT=$(find ~ ~/development ~/development/godot ~/.config ~/Projects -mindepth 1 -maxdepth 1 -type d | \
  fzf --height=80% --border --preview-window=right:60% --preview '
        if git -C {} rev-parse --is-inside-work-tree >/dev/null 2>&1; then
          echo "$(basename {})"
          echo "***********************"
          echo ""
          git -C {} status -sb | head -20
          echo ""
          git -C {} log -1 --oneline
        else
          echo "$(basename {})"
          echo "***********************"
          echo ""
          ls {}
        fi'
      )

[ -z "$PROJECT" ] && exit

PROJECT_NAME=$(basename "$PROJECT")

zellij action new-tab \
  --layout ~/.config/zellij/layouts/code.kdl \
  --cwd "$PROJECT" \
  --name "$PROJECT_NAME"
