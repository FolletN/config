
# oh-my-zsh as zsh extension manager
export ZSH="$HOME/.oh-my-zsh"

# default theme
ZSH_THEME="robbyrussell"

# enabled zsh plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# enhanced search tool (CTRL + R)
source <(fzf --zsh)

# enhanced prompt with oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
   export OH_MY_POSH_CONFIG="${HOME}/.config/oh-my-posh"
   eval "$(oh-my-posh completion zsh)"
   eval "$(oh-my-posh init zsh --config ${OH_MY_POSH_CONFIG}/custom.yaml)"
fi

# replace cd by zoxide "z" command
eval "$(zoxide init zsh)"
eval "$(zoxide init zsh --cmd cd)"

for file in $HOME/.scripts/*.sh; do
    source $file
done

for file in $HOME/.aliases/*.sh; do
    source $file
done

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

