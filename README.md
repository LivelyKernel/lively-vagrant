## Vagrant files for setting up a [Lively Web](http://lively-web.org) inside a VirtualBox VM ##

### Prerequisites:

1. Install [virtualbox](https://www.virtualbox.org/wiki/Downloads)

2. Install [vagrant](http://www.vagrantup.com/downloads.html)

### Usage

To use the lively box:

```sh
mkdir -p ~/LivelyBox && cd ~/LivelyBox
vagrant init rksm/lively
vagrant up
```

Once the vagrant setup is done your can visit a Lively world at [http://localhost:9011/welcome.html]() (on the host machine).

For more information please refer to the [vagrant documentation](https://docs.vagrantup.com/v2/getting-started/index.html).

---

## Rebuilding

This is *not* necessary for just running the Lively image. However, for
reference and if you want to rebuild this vagrant image you can run these
commands:

```sh
git clone https://github.com/LivelyKernel/lively-vagrant .
cd lively-vagrant
vagrant up
```

Once the vagrant setup is done Lively is available at [http://localhost:9101/]() (on
the host machine) and at [http://localhost:9001/]() (on the VM).

To also package:

```sh
vagrant package --output lively.box
rsync -zve 'ssh' --progress lively.box lively@lively-web.org:web/
```
