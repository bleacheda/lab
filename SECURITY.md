# Security Policy

## Sanitization Notice

This repository is a public version of a personal homelab setup. All sensitive information such as:

- Usernames and passwords
- SSH keys
- API tokens
- Real internal IP addresses

...have been removed, encrypted, or moved to environment variables or Ansible Vaults.

## Tools Used

- [gitleaks](https://github.com/gitleaks/gitleaks) to scan for secrets
- `.gitignore` to prevent accidental commits of keys or secrets
- `ansible-vault` to encrypt sensitive variables

## Contributing Safely

If you fork this repo, make sure you:

- Don’t commit your own secrets
- Use `.env` files and `.gitignore` them
- Sanitize any custom inventory files

## Reporting Issues

This project is for educational purposes. If you notice anything sensitive that was accidentally left in, please open an issue or email me directly.
