# Follow the instructions in https://github.com/PowerShell/Win32-OpenSSH/issues/1263#issuecomment-499542944

echo "Loading Glenn's Powershell profile."

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
SET HOME="C:\Users\Glenn"

if (-not (Test-Path "$HOME\scoop")) {
	Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

scoop install ag emacs cmake git firefox

$SSH_AGENT_IDENTIES = ssh-add -l 2>&1

if ($SSH_AGENT_IDENTIES -eq "The agent has no identities.") {
	echo "Setting up SSH agent identity."
	ssh-add "$HOME/.ssh/versioncontrol.private.openssh"
} else {
	echo "SSH agent identity already set up."

}

Function ConfigF {
	git --git-dir=$HOME/config.git/ --work-tree=$HOME $args
}

Set-Alias -scope Global -Name config -Value ConfigF

Function PullAll {
	ForEach ($repo in ".ssh","cammy","notes") {
		git -C "$repo" pull
	}
	config pull
}

Set-Alias -scope Global -Name pullall -Value PullAll

echo "Successfully loaded Glenn's Powershell profile."