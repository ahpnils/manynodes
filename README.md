# manynodes

Manynodes allows you to quickly create many virtual Linux guests in a customized
network on a local or remote KVM/libvirt host.

## installation

Manynodes requires a recent version of [Terraform](https://www.terraform.io/),
and the [libvirt
provider](https://github.com/dmacvicar/terraform-provider-libvirt). Just run
`terraform init -upgrade` from the *terraform* directory to install the
provider.

## Options

Manynodes allows you to customize the following aspects :
 * how many nodes to create ;
 * how many virtual cpus per node ;
 * how much RAM per node ;
 * the subnet address ;
 * the (Linux) base image to create the guests from ;
 * the disk size ;
 * the second disk size ;
 * a list of commands run at first boot ;
 * a user name and a group, with password and an (optional) authorized public
   ssh key.

To customize these settings, create a *terraform.tfvars* file. An example file
is provided.
