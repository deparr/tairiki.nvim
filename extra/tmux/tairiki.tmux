# TAIRIKI THEME BEGIN
tairiki_fg="#c5c8c6"
tairiki_bg="#151515"
tairiki_gray0="#1D2021"
tairiki_gray1="#696969"
tairiki_gray2="#A89984"
tairiki_gray3="#cccccc"

set-option -g clock-mode-style              24
set-option -g clock-mode-colour             "$tairiki_gray2"

set-option -g status-fg                     "$tairiki_fg"
set-option -g status-bg                     "$tairiki_bg"
set-option -g copy-mode-current-match-style "fg=$tairiki_gray0,bg=$tairiki_gray3"
set-option -g copy-mode-match-style         "fg=$tairiki_gray0,bg=$tairiki_gray3"
set-option -g menu-selected-style           "fg=$tairiki_gray0,bg=$tairiki_fg"
set-option -g menu-style                    "fg=$tairiki_fg,bg=$tairiki_gray0"
set-option -g message-style                 "bg=$tairiki_gray2,fg=$tairiki_gray0"
set-option -g message-command-style         "bg=$tairiki_gray2,fg=$tairiki_gray0"
set-option -g mode-style                    "bg=$tairiki_gray3,fg=$tairiki_gray0"
set-option -g pane-active-border-style      "fg=$tairiki_gray0"
set-option -g pane-border-lines             "heavy"
set-option -g pane-border-style             "fg=$tairiki_gray0"
set-option -g pane-border-style             "fg=$tairiki_gray1"
set-option -g popup-border-lines            "rounded"
set-option -g status-right-style            "fg=$tairiki_gray2"
set-option -g window-status-current-style   "fg=$tairiki_gray3"
set-option -g window-status-style           "fg=$tairiki_gray2"
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

set-option -g window-status-format         '#{?#{==:#W,},#I,#I:#W}'
set-option -g window-status-current-format '#{?#{==:#W,},#I,#I:#W}'

set-option -g status-right                 ' #{?#{>:#{server_sessions},1},(#{session_name}),} %d/%m #(date +"%H:%M") '
set-option -g status-left                  ' '
# TAIRIKI THEME END
