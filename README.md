# Bug

Here's the output of `run.sh`:

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

# Usage

- `docker login`
- Build and push the base images with `setup.sh`
- Produce the bug with `run.sh`
