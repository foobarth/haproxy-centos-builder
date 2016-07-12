# HAProxy 1.6.x builder for CentOS

This project builds an RPM from source for HAProxy 1.6.x, installing it as a systemd service and sending logs to the systemd journal (by default).

Building it in docker is easy:

    make
    
You can try and build a different version by providing it as an argument to the builder.

    make VERSION=1.6.5 RELEASE=2

# Grab the artifact

If you're in a hurry and willing to trust some guy on github, [you can download a package here](https://github.com/timcharper/haproxy-centos-builder/releases/).
