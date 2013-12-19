## Vagrant files for setting up a VWF/Lively VM ##

### Prerequisites:

1. Install [virtualbox](https://www.virtualbox.org/wiki/Downloads)

2. Install [vagrant](http://www.vagrantup.com/downloads.html)

### Usage

Simply checkout this repository and run `vagrant up`. It will install and setup
a virtualbox VM that has both Lively Kernel and VWF installed.

Lively is installed into `/home/vagrant/LivelyKernel` and vwf into
`/home/vagrant/vwf`. Both directories are also accessible in the shared
`/vagrant/`directory.

A Lively server will auto-start on port 9001 and a vwf server on port 3000. Both
ports are forwarded to the host system on ports 9101 and 9300. This means that
when everything was installed and booted correctly you should be able to see vwf
on [http://localhost:9300/]().
