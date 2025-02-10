*** Settings *** 
Documentation    A simple test to verify Robot Framework is set up correctly. 
Suite Setup      Log    Starting the Test Suite 
Suite Teardown   Log    Ending the Test Suite 
 
*** Test Cases *** 
Hello World 
    Log    Hello, Robot Framework! 
 
*** Keywords *** 
