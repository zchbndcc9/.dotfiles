source /opt/homebrew/share/antigen/antigen.zsh

antigen theme romkatv/powerlevel10k

antigen bundles <<EOBUNDLES
	kazhala/dotbare

	zsh-users/zsh-autosuggestions \
	zsh-users/zsh-completions \

	wfxr/forgit
	elstgav/branch-manager
	ytakahashi/igit
	cameronbroe/whobrokemycode

	# Colors
	chrissicool/zsh-256color
	z-shell/F-Sy-H
	 
	laggardkernel/zsh-thefuck
	Aloxaf/fzf-tab
	wting/autojump
	Cloudstek/zsh-plugin-appup
	zsh-users/zsh-completions
	zsh-users/zsh-autosuggestions
	softmoth/zsh-vim-mode
EOBUNDLES

antigen apply
