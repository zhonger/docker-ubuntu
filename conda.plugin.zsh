function conda_prompt_info() {
	if [ -n "$CONDA_DEFAULT_ENV" ]; then
		echo -n "%{$terminfo[bold]$fg[yellow]%}($CONDA_DEFAULT_ENV) %{$reset_color%}"
	else
		echo -n ''
	fi
}

export CONDA_CHANGEPS1=false