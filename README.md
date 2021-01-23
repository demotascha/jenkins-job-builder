# jenkins-job-builder
    
### PREPARE

1. jenkins_job.ini

    1.1 Manage Jenkins > User (Configuration)>  API Token > Add New Token

    ```
    [job_builder]
    ignore_cache=True
    keep_descriptions=False
    include_path=.:scripts:~/git/
    recursive=False
    exclude=.*:manual:./development
    allow_duplicates=False
    update=all

    [jenkins]
    user={userName}
    password={userToken}
    url={host:port}
    query_plugins_info=False
    ```

2. example.yml

    ```
    - job:
        name: example
        project-type: pipeline
        defaults: global
        description: 'Do not edit this job through the web!'
        disabled: false
        display-name: 'Example'
        concurrent: true
        quiet-period: 5
        logrotate:
          daysToKeep: 3
          numToKeep: 20
          artifactDaysToKeep: -1
          artifactNumToKeep: -1
        dsl: |
          echo "Hello World JJB!!!!"
    ```

### RUN

#### CASE 1: version

docker run -v "$PWD":/tmp/jenkins-job --rm -w /tmp/jenkins-job demotascha/jenkins-job-builder:python3-alpine --version

#### CASE 2: update

docker run -v "$PWD":/tmp/jenkins-job --rm -w /tmp/jenkins-job demotascha/jenkins-job-builder:python3-alpine --conf jenkins_job.ini update example.yml

#### CASE 3: delete

docker run -v "$PWD":/tmp/jenkins-job --rm -w /tmp/jenkins-job demotascha/jenkins-job-builder:python3-alpine --conf jenkins_job.ini delete xample
