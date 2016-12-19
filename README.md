# HAProxy 1.7.x builder for CentOS

This project builds an RPM from source for HAProxy 1.7.x, installing it as a systemd service and sending logs to the systemd journal (by default).

Building it in docker is easy:

    make
    
You can try and build a different version by providing it as an argument to the builder.

    make VERSION=1.7.1 RELEASE=1

