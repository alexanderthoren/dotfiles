def upgrade [] {
	choco upgrade all -y
}

def install [] {
	choco install llvm -y
	choco install starship -y
	choco install fzf -y
	choco install tree-sitter -y
	choco install nodejs -y
	choco install cmake -y
	choco install visualstudio2019buildtools -y
}

echo '-> Choco installation'
upgrade
install
echo '<- Choco installation completed!'
