# puppet pi sensor

This puppet repo is to assist in getting growtent raspberry pis up and running.

## Getting started
1) Get archlinux arm installed on your pi 3 ( https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3 )
2) Change root, and alarm passwords
3) Configure network (wired, or wireless; make sure it autoconnects)
4) Update system ( pacman -Syu )
5) Add puppet, git ( pacman -S puppet git )
6) clone this repo ( git clone https://github.com/mcgrowerr/puppet-pi-sensor.git )
7) Make any needed edits to puppet-pi-sensor/modules/role/manifests/growtent.pp
8) Run puppet ( puppet apply --modulepath=/home/alarm/puppet-pi-sensor/modules -e "include role::growtent" )
