let home = $env.HOME

def sshkeygen [email: string] {
	ssh-keygen -t ed25519 -C $email
}

def createConfigFile [] {
	echo "Host *
  IgnoreUnknown AddKeysToAgent,UseKeychain
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
	" | save $'($home)/.ssh/config'
}

def sshagent [] {
	ssh-agent -c | lines | first 2 | parse "setenv {name} {value};" | transpose -i -r -d | load-env
}

def copyToClipboard [] {
	let osName = (sys | get host | get name)
	if $osName == 'Darwin' {
		ssh-add -K ~/.ssh/id_ed25519
		cat ~/.ssh/id_ed25519.pub | pbcopy
	} else if $osName == 'Windows' {
		ssh-add ~/.ssh/id_ed25519
		clip < ~/.ssh/id_ed25519.pub
	} else {
		print $'Error: current os name is ($osName)'
	}
}

def main [email: string] {
	sshkeygen $email
	createConfigFile
	sshagent
	copyToClipboard
}
