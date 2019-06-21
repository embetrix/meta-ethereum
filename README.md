# meta-ethereum

![meta-ethereum](https://github.com/bernardoaraujor/meta-ethereum/raw/master/meta-ethereum.png  "meta-ethereum")

The upcoming wave of blockchain-enabled IoT devices is creating a rising demand for embedded support for the [Ethereum](https://www.ethereum.org/) protocol. Examples of projects that aim to run Ethereum inside embedded systems are:

 * **EthRaspbian**: <https://ethraspbian.com>
 * **cpp-ethereum-cross**: <https://github.com/doublethinkco/cpp-ethereum-cross/>
 * **EthEmbedded**: <http://ethembedded.com>
 * **Oaken Project**: <https://www.oakeninnovations.com/>

The [**Yocto Project**](https://www.yoctoproject.org/) is an open source collaboration project that helps developers create custom Linux-based systems regardless of the hardware architecture. Meanwhile, [**OpenEmbedded**](http://www.openembedded.org/wiki/Main_Page) is a build automation framework and cross-compile environment used to create Linux distributions for embedded devices.

Together, these projects provides a flexible set of tools and a space where embedded developers worldwide can share technologies, software stacks, configurations, and best practices that can be used to create tailored Linux images for embedded and IoT devices, or anywhere a customized Linux OS is needed. 

The **meta-ethereum** OpenEmbedded Layer aims to provide recipes for Ethereum related programs, tools and libraries in order to support the Ethereum blockchain on a large variety of embedded devices. Please note that the meta-* is an OE layer naming convention, and this repository has nothing to do with the [Ethereum Meta](https://ethermeta.com/) project.

Currently, we aim to provide recipes for the following:

 * **libethash** [v0.4.4 - stable]: <https://github.com/ethereum/ethash>
 * **geth/go-ethereum** [v1.8.27 - stable]: <https://github.com/ethereum/go-ethereum>
 * **aleth/cpp-ethereum** [v1.6.0 - under development]: <https://github.com/ethereum/aleth>
 * **parity** [v2.4.6 - planned]: <https://github.com/paritytech/parity-ethereum>
 
Any collaborations (issues, patches, pull requests, suggestions) are more than welcome: <bernardoar@protonmail.com>

---
## Dependencies

The meta-ethereum layer depends on:

	URI: git://git.openembedded.org/openembedded-core
	layers: meta
	branch: sumo

	URI: git://git.openembedded.org/meta-openembedded
	layers: meta-oe
	branch: sumo
	
After we start the development of recipes for **parity** in the near future, it is very likely that there will also be dependency to the **meta-rust** layer.	

Please note that in order to build **geth**, you need to set ```GOVERSION = "1.10%"``` inside your conf/local.conf. This is because sumo sets 1.9 as its default Go version, but **geth** needs to be built with 1.10 or higher to avoid some compilation problems.

---
## Tutorials
You can find some tutorials in the `docs` folder:

 - [Running geth on a QEMU MIPS 32 bits emulated machine](https://github.com/bernardoaraujor/meta-ethereum/blob/master/docs/qemu_tutorial.md) ([YouTube](https://youtu.be/IZ6nDKGy7NA))
 - [Testing geth on a BeagleBone Black](https://github.com/bernardoaraujor/meta-ethereum/blob/master/docs/bbb_tutorial.md) ([YouTube](TODO))

---
## License

meta-ethereum is released under the [GPLv3](https://github.com/bernardoaraujor/meta-ethereum/blob/master/LICENSE).
