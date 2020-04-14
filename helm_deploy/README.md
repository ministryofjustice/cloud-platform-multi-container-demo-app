# Multi Container Ruby App Helm Chart
## Introduction
This directory contains the necessary helm chart folders required to install the MoJ Multi Container Ruby application via the Helm package manager. This application is intended to be used to demonstrate the ease of deployment on a MoJ Cloud Platform. 

Each component(API server, postgres database, worker, rails app) of this application has its own helm chart to reduce the complexity. Navigate into each folder for instructions on installing each component.

For the local instance of the application we are running Postgres in an ephemeral docker container. When deploying to [cloud platform][cloudplatform] setup an RDS instance using the [terraform module] (https://github.com/ministryofjustice/cloud-platform-terraform-rds-instance) and set the $DATABASE_URL from the kubernetes secret created. 
