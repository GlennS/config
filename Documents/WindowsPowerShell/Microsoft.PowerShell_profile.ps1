# Follow the instructions in https://github.com/PowerShell/Win32-OpenSSH/issues/1263#issuecomment-499542944

echo "Loading Glenn's Powershell profile."

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
setx HOME "C:\Users\Glenn"

if (-not (Test-Path "$HOME\scoop")) {
	Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
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

function InstallPrograms {
	scoop install git # Needs to happen first so we can add extras
	scoop bucket add extras
	scoop install ag emacs firefox coreutils zip python

	if (pip freeze | findstr "jupyter==") {
		echo "Jupyter found"
	} else {
		pip install jupyter
	}
}

function UpdatePrograms {
	scoop update git ag emacs firefox coreutils zip python
	pip install jupyter
}

echo "Successfully loaded Glenn's Powershell profile."