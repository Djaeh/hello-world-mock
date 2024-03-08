# Run the server

## Bash
     ./entrypoint.sh

## Using docker

1. Create docker image for mock server

        docker image build -t hello-world-mock .

2. Run the container and expose it on port 8081

        docker run -it -p 8081:8081 hello-world-mock