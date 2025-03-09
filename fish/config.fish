set -gx DOT_FILE_DIR "$HOME/dotfiles"
fish_vi_key_bindings

zoxide init fish | source
starship init fish | source
uv generate-shell-completion fish | source
micromamba shell hook --shell fish | source

function fish_greeting
    fastfetch --logo none
end

if status is-interactive
 #    set -g fish_greeting "
 #                   _oo0oo_
 #                  o8888888o
 #                  88\" . \"88
 #                  (| -_- |)
 #                  0\\  =  /0
 #                ___/`---'\\___
 #              .' \\\\|     |# '.
 #             / \\\\|||  :  |||# \\
 #            / _||||| -:- |||||- \\
 #           |   | \\\\\\  -  #/ |   |
 #           | \\_|  ''\\---/''  |_/ |
 #           \\  .-\\__  '-'  ___/-. /
 #         ___'. .'  /--.--\\  `. .'___
 #      .\"\" '<  `.___\\_<|>_/___.' >' \"\".
 #     | | :  `- \\`.;`\\ _ /`;.`/ - ` : | |
 #     \\  \\ `_.   \\_ __\\ /__ _/   .-` /  /
 # =====`-.____`.___ \\_____/___.-`___.-'=====
 #                   `=---='
 #
 #
 # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 #
 #           佛祖保佑         永无BUG"
end

