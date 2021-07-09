# eva-ics-docker
EVA ICS docker image builder and tools

## Images of EVA ICS 3.4 and above

Warning: operator API key and user are not available any longer by default. To
create them, Use setup / deployment features of the container.

### Permanent volumes

The following volumes can be permanent (mounted from the host):

* ui
* pvt
* backup
* runtime
* etc
* log
* var

The permanent volumes must be mounted to the container as /mnt/\<VOL\>

### Configuration variables

The following variables can be set in the container environment to configure
the system (for the first launch only):

* MASTERKEY - system master key
* DEFAULTKEY - system default key
* DEPLOY - path or URI to a deployment YAML file

System name is automatically set according to the container host name.

### Prepare / setup scripts

When the container is started for the first time or updated, the following
scripts are executed automatically if exist and mounted:

* /setup/prepare.sh - if exists, executed before the system setup (EVA ICS
  registry is already started)

* /setup/rc.local - if exists, is copied to the container and executed at every
  container launch (after EVA ICS registry startup, before controllers startup)

* /setup/setup.sh - if exists, executed after the system setup (EVA ICS
  registry and controllers are already started)

If "DEPLOY" variable is used, the automatic deployment is performed after all
setup scripts are finished.
