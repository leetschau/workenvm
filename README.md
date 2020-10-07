# Working Environment in Virtual Machine

## Build Image

1. Clone this repo

1. Modify vm parameters in the Vagrantfile:

    * Hostname: config.vm.hostname
    * IP address: config.vm.network
    * User name: SYS_USER
    * User password: SYS_PASS

1. Create the vm: `vagrant up`

1. Export box file for upload:

    ```
    vagrant package --output workenv.box
    sha256sum workenv.box
    ```

1. Create new version and upload to [Vagrant Cloud][1].

## Use Image

1. Install Linux Mint on bare metal with Live USB installer;

1. Install VirtualBox and Vagrant on the OS;

1. Startup VM:

    ```
    vagrant init yunshan/workenv
    vagrant up
    ```

    See instructions in [Vagrant Cloud][1] for details.

1. SSH to the VM with the user you created, update account password with `passwd`
   and lock the default user:

    ```
    sudo passwd -l vagrant
    ```

    BTW: You can unlock it with `passwd -u vagrant`.

[1]: https://app.vagrantup.com/yunshan/boxes/workenv
