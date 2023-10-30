#!/bin/bash
podman save inla -o inla.tar
apptainer build inla.sif docker-archive:inla.tar
