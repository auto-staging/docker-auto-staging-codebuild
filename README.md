# Docker Auto Staging CodeBuild Image

> Docker image used in the Auto Staging CodeBuild Job

[Image on Docker Hub](https://cloud.docker.com/u/autostaging/repository/docker/autostaging/auto-staging-codebuild/general)

## Commands

### Build image

``` bash
docker build -t autostaging/auto-staging-codebuild:terraform1x ./terraform1x
```

### Push image to DockerHub
# FIXME how to login?
``` bash
docker push autostaging/auto-staging-codebuild:terraform1x
```

See _build_for_aws_ecr.sh_ to build & push to the public AWS ECR.
