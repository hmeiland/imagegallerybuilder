# imagegallerybuilder

The Azure imagebuilder service can be used to create OS images and deploy them through the Shared Image Gallery. Here I will
be maintaining some scripts to create images that are usable for HPC, including e.g. gpu drivers and pre-installed dependencies
for CycleCloud.

Images are build using the Azure imagebuilder service and created in a shared image gallery.

## CentOS 7.8
 * base kernel
 * Nvidia GPU driver 10.130
 * Mellanox OFED 4.9-0.1.7.0-lts
 * dependencies for CycleCloud Jetpack 
