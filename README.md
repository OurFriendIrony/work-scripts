**\_wso2\_purge.sh**  
This script will reset the local WSO2 development environment  
Why:
 - You just want a clean dev environment
 - You're getting inconsistent results when running tests
 - A wso2 component is reporting strange errors (Api Manager can't publish Apis)

What:
 - Shuts down all containers
 - Wipes out persisted data
 - Initialises registry tables
 - Initialises DAS tables 

How:
 - Execute anywhere

---

**\_project\_purge.sh**  
This script will delete all the 'build' type directories  
Why:
 - You want to grep a wso2 project but the results contain output file garbage

What:
 - Deletes build, target, out, etc

How:
 - Execute from any project directory

---
**\_whitespace\_remove.sh**  
This script will remove all whitespace from a file  
Why:
- You want to store a registry resource as plain text but you can't get rid of the crlf

What:
 - Removes whitespace on a given file

How:
 - Execute anywhere, just pass the filepath of the file

