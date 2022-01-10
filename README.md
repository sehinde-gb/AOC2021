## objectscript-adventofcode-template
I am using a template to to craft solutions for [AdventofCode](https://adventofcode.com/2021) using InterSystems ObjectScript.

## Prerequisites
Please ensure that you have docker and git installed on your machine.


## Installation 

Clone/git pull the repo into any local directory

```
$ git clone https://github.com/AOC2021.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Test it

Template goes with the first puzzle solved and a ready to use class Base to load data from files named input1.txt, input2.txt, ... placed in the root of repo.

Open IRIS terminal:

```
$ docker-compose exec iris iris session iris
USER>zn "IRISAPP"
IRISAPP> ##class(sehinde.Advent2021.Day1).Run()
```

## How to add another task
Create Day2.cls derived from base
put input2.txt into the root and start solving tasks.

You can code ObjectScript with VSCode if you want - this repo goes ready to code with IRIS in docker.

Install [VSCode](https://code.visualstudio.com/) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.
Open /src/cls/eshvarov/advent2019/Day1.cls class and try to make changes - it will be compiled in running IRIS docker container.

# .vscode/settings.json

Settings file to let you immedietly code in VSCode with [VSCode ObjectScript plugin](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript))

# .vscode/launch.json
Config file if you want to debug with VSCode ObjectScript
