SELECT * FROM bank_loan_data

--TOTAL LOAN APPLICATIONS--

select count(id) as total_applications 
from bank_loan_data

select count(id) as mtd_applications 
from bank_loan_data
where month(issue_date)=12

select count(id) as pmtd_applications 
from bank_loan_data
where month(issue_date)=11

select month(issue_date) as month_ ,count(id) as applications
from bank_loan_data
group by month(issue_date)
order by month_


--TOTAL FUNDED AMOUNT--

select sum(loan_amount) as total_funded_amount 
from bank_loan_data

select month(issue_date) as month_ ,sum(loan_amount) as total_funded_amount 
from bank_loan_data
group by month(issue_date)
order by month_

--TOTAL AMOUNT RECEIVED--

select sum(total_payment) as total_amount_received 
from bank_loan_data

select month(issue_date) as month_ ,sum(total_payment) as total_amount_received 
from bank_loan_data
group by month(issue_date)
order by month_

--AVERAGE INTEREST RATE--

select round(avg(int_rate)*100,2) as avergae_interest_rate 
from bank_loan_data

select month(issue_date) as month_ ,round(avg(int_rate)*100,2) as avergae_interest_rate 
from bank_loan_data
group by month(issue_date)
order by month_

--AVERAGE DEBT-TO-INCOME RATIO--


select round(avg(dti)*100,2) as avergae_dti
from bank_loan_data

select month(issue_date) as month_ ,round(avg(dti)*100,2) as avergae_dti
from bank_loan_data
group by month(issue_date)
order by month_

--GOOD LOAN ISSUED--

select count(id) as good_loan_applications
from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

select sum(loan_amount) as good_loan_funded_amount
from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

select sum(total_payment) as good_loan_amount_received
from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

select (count(
case when loan_status='Fully Paid' or loan_status='Current' 
then id end) *100.0) / count(id) as good_loan_percentage
from bank_loan_data

--BAD LOAN ISSUED--

select count(id) as bad_loan_applications
from bank_loan_data
where loan_status='Charged Off' 

select sum(loan_amount) as bad_loan_funded_amount
from bank_loan_data
where loan_status='Charged Off' 

select sum(total_payment) as bad_loan_amount_received
from bank_loan_data
where loan_status='Charged Off' 

select (count(
case when loan_status='Charged Off'  
then id end) *100.0) / count(id) as bad_loan_percentage
from bank_loan_data

--LOAN STATUS--

select loan_status, 
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received,
round(avg(int_rate*100),2) as average_interest_rate,
round(avg(dti*100),2) as average_dti
from bank_loan_data
group by loan_status

select loan_status, 
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received,
round(avg(int_rate*100),2) as average_interest_rate,
round(avg(dti*100),2) as average_dti
from bank_loan_data
where month(issue_date)=12
group by loan_status

--MONTHLY BANK LOAN--

select month(issue_date) as month_number,
datename(month,issue_date) as month_name,
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from bank_loan_data
group by month(issue_date),datename(month,issue_date)
order by month(issue_date)

--STATE WISE BANK LOAN--

select address_state as state,
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from bank_loan_data
group by address_state
order by address_state

--TERM WISE BANK LOAN--

select term, 
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from bank_loan_data
group by term

--BANK LOAN BASED ON EMPLOYEE LENGTH--

select emp_length as employee_length,
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from bank_loan_data
group by emp_length
order by emp_length

--BANK LOAN BASED ON PURPOSE--

select purpose,
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from bank_loan_data
group by purpose
order by count(id) desc

select purpose,
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from bank_loan_data
where grade='A'
group by purpose
order by count(id) desc

--BANK LOAN BASED ON HOME OWNERSHIP--

select home_ownership,
count(id) as total_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from bank_loan_data
group by home_ownership
order by home_ownership