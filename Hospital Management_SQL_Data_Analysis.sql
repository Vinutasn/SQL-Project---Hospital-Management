CREATE TABLE hospital_data(
	Hospital_Name VARCHAR(100),
	Location VARCHAR(50),
	Department VARCHAR(50),
	Doctors_Count INT,
	Patients_Count INT,
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC(10,2)
);

SELECT * FROM hospital_data;

--find the total number of patients across all hospitals
SELECT SUM(patients_count) AS Total_patients_count
FROM hospital_data;

--Retrieve the average count of doctors available in each hospital
SELECT hospital_name, AVG(doctors_count) AS avg_doctors_count
FROM hospital_data
GROUP BY hospital_name;

--Find the top 3 hospital departments that have the highest number of patients
SELECT department, SUM(patients_count) AS highest_number_of_patients
FROM hospital_data
GROUP BY department
ORDER BY SUM(patients_count)
LIMIT 3;

--Identify the hospital that recorded the highest medical expenses. 
SELECT hospital_name, SUM(medical_expenses) AS highest_medical_expense
FROM hospital_data
GROUP BY hospital_name
ORDER BY highest_medical_expense DESC
LIMIT 1;

--Calculate the average medical expenses per day for each hospital
SELECT hospital_name, admission_date, AVG(medical_expenses) AS avg_medical_expense
FROM hospital_data
GROUP BY hospital_name, admission_date
Order BY hospital_name, admission_date;

--Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT hospital_name, location, department, admission_date, discharge_date, 
discharge_date-admission_date AS Long_stay_day
FROM hospital_data
ORDER BY Long_stay_day DESC
LIMIT 1;

--Count the total number of patients treated in each city
SELECT location, SUM(patients_count) AS total_patients_count
FROM hospital_data
GROUP BY location
ORDER BY total_patients_count;

--Calculate the average number of days patients spend in each department
SELECT department, AVG(discharge_date-admission_date) AS Avg_stay_days
FROM hospital_data
GROUP BY department
ORDER BY Avg_stay_days DESC;

--Find the department with the least number of patients
SELECT department, SUM(patients_count) AS less_patients_count
FROM hospital_data
GROUP BY department
ORDER BY less_patients_count
LIMIT 1;

--Group the data by month and calculate the total medical expenses for each month
SELECT 
	DATE_TRUNC('month',admission_date) AS Month,
	SUM(medical_expenses) AS Total_expenses
FROM hospital_data
GROUP BY DATE_TRUNC('month',admission_date)
ORDER BY Month;