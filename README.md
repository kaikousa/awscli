# AWS tools

Dockerized set of AWS CLI tools for CircleCI and other CI-tools that support running jobs in Docker containers.

Installs:

* `awscli`
* `s3cmd`
* `awsebcli`
* `boto3`
* `jinja2`
* `yarn`
* `serverless`
* `ecs-deploy`: [github](https://github.com/silinternational/ecs-deploy)

## Custom tools

### eb_deploy

Handles the deployment process to Elastic Beanstalk

### dockerrun

Generates contents of `Dockerrun.aws.json` based on a jinja2-template.
