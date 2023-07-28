# Nushell Environment Config File
#
# version = 0.78.1

def create_left_prompt [] {
    mut home = ""
    try {
        if $nu.os-info.name == "windows" {
            $home = $env.USERPROFILE
        } else {
            $home = $env.HOME
        }
    }

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace -s $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let path_segment = if (is-admin) {
        $"(ansi red_bold)($dir)"
    } else {
        $"(ansi green_bold)($dir)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | date format '%m/%d/%Y %r')
    ] | str join)

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

# rbenv
export-env { 
    load-env {
        PATH: ($env.PATH | split row (char esep) | prepend [$"($env.HOME)/.rbenv/bin" $"($env.HOME)/.rbenv/shims"])
        RBENV_VERSION: ""
        RBENV_VERSION_OLD: ""
        RBENV_SHELL: "nu"
    }
}

export def-env rbenv [
	command?: string@'nu-complete rbenv',
	...args
] {
    let new_env = if $command in ["rehash", "shell"] {
        # implement each on indiviudaly e.g.
        if $command == "shell" {
            { RBENV_VERSION_OLD: $env.RBENV_VERSION RBENV_VERSION: $args.0 }
        } else {
            error make { msg: $"`($command)` command is not supported yet" }
        }
    } else {
    	if ($command | is-empty) {
    		^rbenv
    	} else {
        	^rbenv $command $args
    	}
        {}
    }
    load-env $new_env
}

def 'nu-complete rbenv' [] {
    ^rbenv help
    | lines
    | where ($it | str starts-with "   ")
    | each {|entry| $entry | split row ' ' | get 0 }
}

let osName = (sys | get host | get name)
if $osName == 'Darwin' {
	$env.PATH = ($env.PATH | append "/usr/local/bin/")
	$env.PATH = ($env.PATH | append "/opt/homebrew/bin/")
	$env.PATH = ($env.PATH | prepend "~/.fnm")
	load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column = | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })
	$env.PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")
}

$env.MANPAGER = "sh -c 'col -bx | bat -l man -p'"

mkdir ~/.cache/starship
starship init nu | str replace --string "size -c" "size" | save -f ~/.cache/starship/init.nu
