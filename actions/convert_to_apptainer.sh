#!/bin/bash
podman save example -o example.tar
apptainer build example_tar.sif docker-archive:example.tar
