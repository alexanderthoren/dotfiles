# Nushell Environment Config File

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

def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
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
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

let osName = (sys | get host | get name)
if $osName == 'Darwin' {
	let-env PATH = ($env.PATH | append "/usr/local/bin/")
	let-env PATH = ($env.PATH | append "/opt/homebrew/bin/")
}

let-env MANPAGER = "sh -c 'col -bx | bat -l man -p'"

let-env PATH = ($env.PATH | prepend "~/.fnm")
load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column = | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })
let-env PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")

mkdir ~/.cache/starship
starship init nu | str replace --string "size -c" "size" | save -f ~/.cache/starship/init.nu
