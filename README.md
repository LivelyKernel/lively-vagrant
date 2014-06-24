## Vagrant files for automated set up of a [Lively Web](http://lively-web.org) server inside a VirtualBox VM ##

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

Once the vagrant setup is done you can visit a Lively world at [http://localhost:9011/welcome.html](http://localhost:9011/welcome.html) (on the host machine).

To stop it again:

```sh
vagrant halt
```

For more information please refer to the [vagrant documentation](https://docs.vagrantup.com/v2/getting-started/index.html).

Except for the Web ports 9011 and 9012 and the ssh port 2222 the Lively server is completely isolated. I.e. it is not possible for the server or another process running inside the VM to access host data or processes.

---

## Removal

TO remove thr VM and box run:

```sh
cd ~/LivelyBox && vagrant destroy
```

and

```sh
vagrant box remove rksm/lively
```

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

Once the vagrant setup is done Lively is available at [http://localhost:9011/](http://localhost:9011/) (on
the host machine) and at [http://localhost:9001/](http://localhost:9011/) (on the VM).

To also package:

```sh
box=$(date "+%Y-%m-%d")_lively.box
vagrant package --output $box --vagrantfile Vagrantfile.deploy
rsync -zve 'ssh' --progress $box lively@lively-web.org:web/vagrant/
```

<!-- vagrant box add -c -f --name rksm/lively $box -->
<!-- vagrant box add -c -f --name rksm/lively 2014-06-24_lively-debian7.box -->
