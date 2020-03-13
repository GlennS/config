alias pullall='for repo in ".ssh" "octopus" "notes" ".password-store"; do git -C "${repo}" pull; done; config pull'
