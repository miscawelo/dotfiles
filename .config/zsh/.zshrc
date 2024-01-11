if [ `tput colors` != "256" ]; then
    exec bash -l;
fi

# Environment variables
for file in $HOME/.config/environment.d/*; do
    source "$file"
done

# Config files
for file in $HOME/.config/zsh/zsh.d/*; do
    source "$file"
done

# Plugins
for file in /usr/share/zsh/plugins/*/*.zsh; do
    source "$file"
done

# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

