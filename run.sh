#!/usr/bin/sh
if [ "$1" == "start" ]; then
    echo "Starting server"
    mkdir -p $(pwd)/work
    docker run -d -p 8888:8888 -v $(pwd)/work:/home/jovyan/work --name saditya-tda --platform linux/x86_64 saditya88/tda
    echo "Getting link"
    sleep 1
    docker exec -it saditya-tda bash -c 'jupyter lab list' | grep http | cut -f1 -d ' ' | sed 's/\/\/.*:8888/\/\/localhost:8888/'
elif [ "$1" == "stop" ]; then
    echo "Stopping the server"
    docker stop saditya-tda
    docker rm -f saditya-tda
elif [ "$1" == "install" ]; then
    echo "Installing..."
    if ! command -v docker &> /dev/null
    then
        echo "Docker not installed. Please install it before proceeding"
    else
        docker build -f tda.dockerfile -t saditya88/tda .
    fi
else
    echo "Unknown option selected '$1'"
fi
