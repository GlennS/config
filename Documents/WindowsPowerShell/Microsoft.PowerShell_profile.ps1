# Follow the instructions in https://github.com/PowerShell/Win32-OpenSSH/issues/1263#issuecomment-499542944

echo "Loading Glenn's Powershell profile."

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
SET HOME="C:\Users\Glenn"

if (-not (Test-Path "$HOME\scoop")) {
	Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

scoop install git # Needs to happen first so we can add extras
git config --global core.sshCommand C:/OpenSSH-Win32/ssh.exe
scoop bucket add extras
scoop install ag emacs cmake firefox coreutils zip upx

$SSH_AGENT_IDENTIES = ssh-add -l 2>&1

if ($SSH_AGENT_IDENTIES -eq "The agent has no identities.") {
	echo "Setting up SSH agent identity."
	ssh-add "$HOME/.ssh/versioncontrol.private.openssh"
} else {
	echo "SSH agent identity already set up."

}

function Config {
	git --git-dir=$HOME/config.git/ --work-tree=$HOME $args
}

function PullAll {
	ForEach ($repo in ".ssh","cammy","notes") {
		git -C "$repo" pull
	}
	config pull
}

echo "Successfully loaded Glenn's Powershell profile."