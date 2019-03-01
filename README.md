# Multi-container demo application

This is an application consisting of several components, to use as the basis of a walkthrough showing how to deploy a multi-container application to the cloud platform.

The components are:

* A Ruby on Rails application
* A content API
* A worker process

Each of these components runs in its own container. The Ruby on Rails application reads a record from the database and displays its contents, along with an image supplied via the content API. The worker process periodically updates the database record, and the content API responds to requests with the URL of a random kitten image.

The intent is to have a tutorial application that has the following deployment requirements:

* Multiple containers, with communication between them
* An RDS instance
* A secret (the RDS database credentials)
* Database migrations

The tutorial will cover:

* Running the whole application locally via docker-compose (to verify that it works)
* Granting Helm permission to deploy applications within the user's cluster namespace
* Creating the RDS instance for the application
* Adding kubernetes secrets to make the database credentials available
* An explanation of the Helm chart to deploy the application
* Manual deployment (via Helm)
* Setting up CircleCI to continuously deploy the application
* Making a change and confirming that the deployed application gets updated
