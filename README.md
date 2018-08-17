# Feeling Tracker #

Feeling tracker is an demonstration app that allows a user to declare a feeling of the moment from a web interface. The UI uses the associated API services to save and view data.

The intention of the demonstration is to show how to use a [Bitbucket Pipeline](https://bitbucket.org/product/features/pipelines) to test a web app, pack the app into a container and then deploy the container to a Kubernetes cluster on Google Cloud.


## Deployment
This code is intended to run in a Docker container. Check out the file, `Dockerfile` to learn the particulars.


## Environment Variables

### `CURRENT_VERSON=1.6`,
Sets the current version of the application. If you enhance this code, increment the current version up.

### `IS_LOCAL=true`
Set the environment variable `IS_LOCAL=true` to run the GUI tests on your local machine. (Linux or MAC) Otherwise, the GUI testing code will use [`xvfb`](https://en.wikipedia.org/wiki/Xvfb) to create a virtual desktop in which to run the GUI testing in a Linux environment.

When running under a headless Linux server, [xvfb](https://www.x.org/wiki/) must be installed in the environment already. Check out the the file, `bitbucket-pipeline.yml` to learn the details of setting up, [xvfb](https://en.wikipedia.org/wiki/Xvfb).

### `GOOGLE_ACCOUNT`

`GOOGLE_ACCOUNT` is releveant to the Bitbucket Pipeline. This environment variable tis set in the Settings section of the Bitbucket Project. `GOOGLE_ACCOUNT` describes the identifier of the Google Cloud [Service Account](https://cloud.google.com/compute/docs/access/service-accounts) under which the deployment to the Kubernetes cluster will execute. For example, `myprojectservice@myproject-110011.iam.gserviceaccount.com`.

Should you want to deploy this project under your own Bitbucket Pipelines instance, make sure your Service Account has permissions for:

* Kubernetes Service Agent
* Compute Engine Service Agent
* Cloud Functions Service Agent
### `GOOGLE_CLIENT_SECRET`
`GOOGLE_CLIENT_SECRET` is releveant to the Bitbucket Pipeline. `GOOGLE_CLIENT_SECRET` is the private key in JSON format that gets generated when a service account is created. This environment variable is used by in the deployment file, `bitbucket-pipelines.yml` to get access Google Cloud resources that are part of the deployment and testing process.

### `PROJECT_ID`
`PROJECT_ID` is relevant to the Bitbucket Pipeline and Google Cloud. `PROJECT_ID` is the identifier of the Google Cloud [project](https://cloud.google.com/resource-manager/docs/creating-managing-projects) by which access to Google Cloud resources is being granted.

### `IS_CONTAINER_TEST`
Set `IS_CONTAINER_TEST` to `true` to tell the GUI and API tests that they will be running over HTTP against the containerized web application. Setting `IS_CONTAINER_TEST` to `true` prevents the test code from using the web server internal to mocha/chai. Default setting is `false`.



