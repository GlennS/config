# Follow the instructions in https://github.com/PowerShell/Win32-OpenSSH/issues/1263#issuecomment-499542944

echo "Loading Glenn's Powershell profile."

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
setx HOME "C:\Users\Glenn"

if (-not (Test-Path "$HOME\scoop")) {
	Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

scoop install git # Needs to happen first so we can add extras
scoop bucket add extras
scoop install ag emacs firefox coreutils zip python

if (pip freeze | findstr "jupyter==") {
	echo "Jupyter found"
} else {
	pip install jupyter
}

$SSH_AGENT_IDENTITIES = ssh-add -l 2>&1

if ($SSH_AGENT_IDENTITIES -eq "The agent has no identities.") {
	echo "Setting up SSH agent identity."
	ssh-add "$HOME/.ssh/versioncontrol.private.openssh"
} else {
	echo "SSH agent identity already set up."

}

function Config {
	git --git-dir=$HOME/config.git/ --work-tree=$HOME $args
}

function PullAll {
	ForEach ($repo in ".ssh","octopus","notes",".password-store") {
		echo "Pulling $repo"
		git -C "$HOME/$repo" pull
	}
	config pull
}

echo "Successfully loaded Glenn's Powershell profile."