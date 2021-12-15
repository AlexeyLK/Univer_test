# To compile program on Ubuntu:
### Install dmd compiler
- sudo apt update
- sudo apt install snapd
- sudo snap install dmd --classic
### Make directory for project and run calc.d
- mkdir dirname
- cd dirname
- git clone https://github.com/AlexeyLK/Univer_test
- dmd -unittest calc.d
- ./calc
