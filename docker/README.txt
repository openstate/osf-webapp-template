How to start from scratch:
    $ sudo ./buid.sh  # only sudo if need be (Ie. not for mac ;))
    $ sudo ./run.sh
    $ sudo docker exec -it c-nodejs-osf-webapp-template bash

In the container:
    # The line below updates npm which is best practice, but it currently doesn't work in docker using Node up to at least version 6.2.1, fixes are being posted on GitHub though so check back with later versions of Node to see if this works
    # npm install -g npm@latest

    $ npm install -g gulp bower
    $ npm install
    $ bower install --allow-root

    # Run gulp to optimize the files in assets/
    $ gulp
    # Or run it from the host machine
    $ docker exec c-nodejs-osf-webapp-template gulp

    # After running gulp you can use the following command which will automatically optimize the files when the are changed
    $ gulp watch
    # Again you can also run this from the host machine (note the use of `-it` otherwise CTRL+d or CTRL+c will only kill the `exec` process and not the `gulp` process in the container as well!)
    $ docker exec -it c-nodejs-osf-webapp-template gulp watch

    # In production use the following command (it doesn't create source map files, saving a few KB's); always run it after using `gulp watch` (which has no `--production` mode)
    $ gulp --production
    # Or from the host machine
    $ docker exec c-nodejs-osf-webapp-template gulp --production

    If you want to use BrowserSync (which automatically runs when using `gulp watch`) then make sure to edit the `hosts` file in the container:
    # (optional) if you want to use vim to edit the file, install vim first using `apt-get update` and `apt-get install vim`
    $ vim /etc/hosts
    # Add a redirect line, see the example below, where the IP address is the address of the docker_c-nginx_1 container (just like in the `hosts` file on the host machine)
    172.17.0.5  subsidietrekker.nl

    # Then add your development URL (basically what you use in the host machine's `hosts` file) to `assets/manifest.json`

    # Finally run gulp watch and open the URL specified under 'External' (see an example below). Currently you have to accept the wrong SSL certificate if you use HTTPS.
    [BS] Proxying: http://subsidietrekker.nl
    [BS] Access URLs:
     ------------------------------------
           Local: http://localhost:3010
        External: http://172.17.0.6:3010
     ------------------------------------
              UI: http://localhost:3011
     UI External: http://172.17.0.6:3011
     ------------------------------------
