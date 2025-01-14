#!/bin/bash

if [ ! -f ./wp-config.php ]

    wget https://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress

fi
