# README

1) Getting started
To get the Rails server running locally:

Clone this repo
bundle install
rake db:migrate
rails s

2) Testing the Implementation
Uploading a Employee Report:
	Send a POST request to the /upload endpoint with the report_id and time report CSV data. For example,
	POST http://localhost:3000/upload

Retrieving the Payroll Report:
  Send a GET request to the /payroll_report endpoint to retrieve the payroll report in JSON format. For example,
  GET http://localhost:3000/payroll_report


3) How did you test that your implementation was correct?
To test the implementation, I used the following approach: I tested the API endpoints using tools like Postman, or a web browser to ensure they returned the expected responses.


4) If this application was destined for a production environment, what would you add or change?
For a production environment, I would consider the following improvements:
Authentication and Authorization 
Data Validation and Error Handling 
File Upload Handling.
Database Optimization 

5) Due to the time constraints of this challenge, a few compromises were made in the implementation:
Error Handling
Security Measures
Optimizations
