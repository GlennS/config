# Make sure the S drive is symlinked.
ln -s -f -T "/run/user/1000/gvfs/smb-share:server=cse-bs3-file,share=data" ~/S;

# Mount the S drive
/usr/bin/gvfs-mount smb://CSE-BS3-FILE/Data;
