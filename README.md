# Reproducer for tox/virtualenv installing the wrong pip
Build the docker image that uses pyenv to install python 3.7 and 3.13
```bash
docker build --tag tox-pip-reporoducer --progress plain .
```

Now launch a container from the image and run the script that runs tox (cleaning up `.tox` before each run)
with 3 different configurations (`tox1.ini` - `tox3.ini`).
All of them have py37 and py313 factors.
The py37 ones are the problem here: 
Configuration 1 and 3 will fail.
It appears that pip 24.2 from python 3.13 is installed and used in the tox virtual environment.
That's a problem because with 24.1 pip dropped support for python 3.7.

```bash
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

```bash
docker run -it --rm -v ./:/demo -v ./out:/demo/out -w /demo -u "$USER_ID:$GROUP_ID" tox-pip-reporoducer ./run.sh
```

You can find the output of the 3 tox runs in the `out` directory.
