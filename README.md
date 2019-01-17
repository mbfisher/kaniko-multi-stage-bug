Reproduction of https://github.com/GoogleContainerTools/kaniko/issues/533.

# Bug

To reproduce the bug run `kaniko-build.sh`:

```
+ docker run --rm -it --volume /Volumes/Users/mbfisher/git-projects/kaniko-multi-stage-bug:/build gcr.io/kaniko-project/executor:debug --context=/build --destination=my-kaniko-bug
INFO[0000] Downloading base image mbfisher/kaniko-multi-stage-bug:builder
2019/01/17 10:05:39 No matching credentials were found, falling back on anonymous
INFO[0001] Executing 1 build triggers
INFO[0001] Unpacking rootfs as cmd RUN mkdir /app && echo "Hello, World!" > /app/index requires it.
INFO[0001] Taking snapshot of full filesystem...
INFO[0001] Skipping paths under /kaniko, as it is a whitelisted directory
INFO[0001] Skipping paths under /build, as it is a whitelisted directory
INFO[0001] Skipping paths under /proc, as it is a whitelisted directory
INFO[0001] Skipping paths under /dev, as it is a whitelisted directory
INFO[0001] Skipping paths under /sys, as it is a whitelisted directory
INFO[0001] Skipping paths under /busybox, as it is a whitelisted directory
INFO[0001] RUN mkdir /app && echo "Hello, World!" > /app/index
INFO[0001] cmd: /bin/sh
INFO[0001] args: [-c mkdir /app && echo "Hello, World!" > /app/index]
INFO[0001] Taking snapshot of full filesystem...
INFO[0001] Skipping paths under /kaniko, as it is a whitelisted directory
INFO[0001] Skipping paths under /build, as it is a whitelisted directory
INFO[0001] Skipping paths under /proc, as it is a whitelisted directory
INFO[0001] Skipping paths under /dev, as it is a whitelisted directory
INFO[0001] Skipping paths under /sys, as it is a whitelisted directory
INFO[0001] Skipping paths under /busybox, as it is a whitelisted directory
INFO[0001] Deleting filesystem...
INFO[0002] Downloading base image mbfisher/kaniko-multi-stage-bug:runtime
2019/01/17 10:05:41 No matching credentials were found, falling back on anonymous
INFO[0002] Executing 1 build triggers
INFO[0002] Taking snapshot of full filesystem...
INFO[0002] Skipping paths under /kaniko, as it is a whitelisted directory
INFO[0002] Skipping paths under /build, as it is a whitelisted directory
INFO[0002] Skipping paths under /proc, as it is a whitelisted directory
INFO[0002] Skipping paths under /dev, as it is a whitelisted directory
INFO[0002] Skipping paths under /sys, as it is a whitelisted directory
INFO[0002] Skipping paths under /busybox, as it is a whitelisted directory
INFO[0002] COPY --from=builder /app/* /app/
error building image: error building stage: lstat /kaniko/builder: no such file or directory
```

Expected behaviour from `docker-build.sh`:

```
+ docker build --no-cache -t my-multi-stage-build .
Sending build context to Docker daemon  50.69kB
Step 1/2 : FROM mbfisher/kaniko-multi-stage-bug:builder AS builder
# Executing 1 build trigger
 ---> Running in c6bbc064f397
Removing intermediate container c6bbc064f397
 ---> c3d2e2f359f7
Step 2/2 : FROM mbfisher/kaniko-multi-stage-bug:runtime
# Executing 1 build trigger
 ---> 2b4f93925947
Successfully built 2b4f93925947
Successfully tagged my-multi-stage-build:latest
+ docker run --rm my-multi-stage-build
Hello, World!
```

# Usage

- `docker login`
- Build and push the base images with `setup.sh`
- Produce the bug with `kaniko-build.sh`
