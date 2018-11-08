# rbc-project

*** README ***

in order to run the test in this project, the following software requirements
are needed.
Python 3 and pip must be installed on the machine to be used.
then install the libraries below using pip
pip install -U robotframework
pip install -U robotframework-requests
pip install -U robotframework-seleniumlibrary

Also selenium webdriver needs to be installed and must be added to PATH
incase this is to be run on a windows machine.

***This project was developed on Windows machine and you may need to adjust
some file path to Linux or Unix style in order work as expected.***


This README explains how to run the tests for the pet store app.
The file api.robot contains tests related to the endpoints to verify if they meet the requirement specification
in swagger documentation

To run the API tests navigate to the root of the project rbc-project directory and run the command below
           robot -d results/api -L DEBUG tests/api.robot

This will run API test suite and results can be viewed in Results/api directory for the API tests

In order to run an individual test case in the api.robot file, run the command below
			robot -d results/api  -i testTag -L DEBUG tests/api.robot

All test cases are tagged so that each test can be run individually


Similarly UI tests are in two files. Each file represent the acceptance tests for each story

In order to run test cases in each file for the UI, below are the commands
	robot -d results -L DEBUG tests/pet_us03.robot
	robot -d results -L DEBUG tests/pet_us02.robot

Also running each UI test case in the test files, below are the commands.

	robot -d results -L DEBUG  -i testTag testtests/pet_us03.robot
	robot -d results -L DEBUG  -i testTag testtests/pet_us02.robot

All test cases are tagged so that each test can be run individually

Note: For the UI tests, it is advisable to run the pet_us03.robot test cases first as the test file pet_us02.robot
has a little demanding scenario.

To run the pet_us02.robot test cases, a csv file containing petname and status should be added to the Data folder
sample.csv is already provided for guidance 

In addition, there is also a performance test of the application to see how it behaves when 1000 concurrent users
are using the app store e.g creating a pet.
See the petStorePerf.PNG file in the root of the project folder for details.
