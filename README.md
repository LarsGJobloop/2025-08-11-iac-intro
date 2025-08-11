## Setup

1. Install Docker (or another container runtime)
2. Clone repository
3. Open in devcontainer `Ctrl + Shift + P` > `open in container`
4. Load workbench `nix develop`

## SSH

```sh
ssh-keygen -t ed25519 -C "" -P "" -f ssh-id
```

## Basic SSH usage

- Log in:
    ```sh
    ssh -i <path-to-identity-file> <username>@<server-address>
    ```
  Example:
    ```sh
    ssh -i ssh-id root@65.108.219.65
    ```
- End session
    ```sh
    exit
    ````

> [!NOTE]
> You have to trust the server on first connection (Trust on First Use/TOFU) which binds the server identity to the IP address.
> This is a remnant of when servers where (or you can garuantee are) static. This is not the case in our ephemeral reproducible first setup.
> Which means the server IP or Identity will change between create/destroy, and you will get a warning about Man in the Middle (MITM).
> Edit the referenced file and delete the ip-hash reference there to connect (needs to be done each time either changes).

## Refeences

- [Terraform Registry](https://registry.terraform.io/)
