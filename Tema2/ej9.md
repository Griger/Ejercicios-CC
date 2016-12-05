Lo primero que vamos a hacer es crear una máquina virtual en **AWS** que es la que vamos a provisionar con **Vagrant** haciendo uso de dos provisionadore distintos: **Chef** y **Ansible**.

Cuando nos damos de alta en los servicios de AWS tenemos una versión de prueba de 1 año que nos permite tener una máquina de tipo t2.micro en Linux, RHEL o SLES durante 750 horas por mes y esta es la que vamos a usar para la realización de este ejercicio que es precisamente el hito2 de la asignatura.

Hemos creado una máquina virtual siguiendo el [tutorial que proporciona AWS](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html#ec2-launch-instance_linux) aunque hemos de asegurarnos que en las pantallas de creación en las que estemos trabajando la región seleccionada sea aquella que hemos seleccionado mientras creábamos el usuario y el grupo de segurida en los pasos previos a la creación de una máquina virtual: de otro modo ni el grupo de seguridad ni el par de claves estarán disponibles para la creación de la instancia.

Lo primero que vamos a necesitar para poder trabajar con las instancias de AWS desde Vagrant es instalar el plugin de Vagrant para este propósito:

```bash
vagrant plugin install vagrant-aws
```

Ahora vamos a descargar una *box* de Vagrant que emplearemos simplemente como esqueleto ya que después modificaremos su configuración por medio del Vagrantfile, pero sí que necesitaremos es que dicha imagen sea compatible con el proveedor AWS:

```bash
vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
```
**Bibliografía**
https://gist.github.com/arbabnazar/ccf020f03c599ae35cfb
http://gettingstartedwithchef.com/first-steps-with-chef.html
