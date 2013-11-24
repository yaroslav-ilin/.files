function fish_prompt --description "Write out the prompt"

	# Just calculate these once, to save a few cycles when displaying the
	# prompt
	if not set -q __fish_prompt_hostname
		set -l hn (hostname)
		if [ "$hn" != "chris.tld" ]
			set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
		else
			set -g __fish_prompt_hostname $hn
		end
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	if not set -q __fish_hist_current
		set -g __fish_hist_current (set_color $fish_color_history_current)
	end


	switch $USER

		case root

		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

		case '*'

		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end

	end

	printf '%s%s%s %s→%s ' "$__fish_hist_current" (prompt_pwd) "$__fish_prompt_normal" "$__fish_prompt_cwd" "$__fish_prompt_normal"

end

