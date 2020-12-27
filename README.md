## Framework

* RobotFramework
* API Automation is implemented with RequestsLibrary and additionaly we can utilize JSONLibrary inorder to parse json data when needed


## Installation

* Nothing to install manually.
* Use the existing CI pipeline inorder to configure with CircleCi,dockerhub..etc
* Inorder to run manually install python first then install below mentioned libraries:-
   * pip install robotframework
   * pip install robotframework-requestslibrary
   * pip install robotframework-jsonlibrary
   * Clone the Gihub Repository <https://github.com/AbdulAmrin/API_Tests.git>
   * Go to `test-->TestSuites-->Api_Tests.robot` and then execute the below command:-
     ```robot  --outputdir ./Reports Api_Tests.robot```
  

## Reporting Format

* You can view inbuilt reporting format provided by RobotFramework using log.html and reports.html file
* Additionally this repository is configured with ReportPortal(open-source AI buit reporting dashboard) to view test results in real-time
* Refer https://reportportal.io/ for more information

## APIs Used as Test Cases

* POST API  with resource /post - validating the response status code and json data
* PUT API  with resource /put - validating the response status code and json data
* PATCH API with resource /patch - validating the response status code and json data
* GET API with resource /get - validating the response status code and logs json response
* DELETE API with resource /delete - validating the response status code and json data
* Additionally we can implement request chaining but for the sake for simplicity i have validated independent test cases for each HTTP API methods
(please let me know if this was the requirement)


## CI pipeline

* Used CircleCi as CI tool
* Scripts are made to run through docker
* Dockerfile contains all necessary libraries and provision to kickstart the test suites
* Adddtionally ReportPortal test dashboard will receive real-time test results, as listeners are incorporated when tests are either made to run sequentially or parallely


# Test Folder Structure

* Test folder is organized such that all reusable components can be kept in a separate Keywords.robot file
* Data driven approach can be followed using json files instead of hardcoding the request payload within the script file
* User has a provision to input URls as enviroment variables withing circleci's config.yml file without touching the actual codebase
* ${URL} and ${Alias_Name} is parameterized and kept in Configuration folder

```
├── Dockerfile
├── answers.txt
├── bin
│   └── run-tests-in-virtual-screen.sh
└── test
    ├── Configuration
    │   └── Config.robot
    ├── CustomScripts
    ├── DataProvider
    ├── TestSuites
    │   └── Api_Tests.robot
    └── Utility
        
```


