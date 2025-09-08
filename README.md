# Setup for MacOS

1. Install and launch XQuartz.
2. In _Settings > Security_ enable "Allow connections from network clients".
3. Make sure `~/.Xauthority` exists before the next step: `ls -la ~/.Xauthority`
4. Build and run the Docker container: `docker compose up -d`
5. Allow connections from within the container towards XQuartz. In the macOS Terminal run
```sh
xhost + 127.0.0.1
```
1. (To revoke permissions, run the following.)
```sh
xhost - 127.0.0.1
```