CREATE DATABASE LKQ

USE LKQ

--- Get the Table from Models 

SELECT * FROM ['Car_Table']

--- Get the Table from Car_Price

SELECT * FROM ['Car_Price']

----- List Out Car Break Discs (Most selling)

SELECT Front_Brakes, COUNT(*) 
FROM ['Car_Table']
GROUP BY Front_Brakes
HAVING COUNT(*)>1

SELECT * FROM ['Car_Table']
WHERE Front_Brakes = 'Ventilated Disc'

--- Listing Total Models

SELECT model, COUNT(*) AS Total_Models
FROM ['Car_Table']
GROUP BY model
HAVING COUNT(*) >= 1

--- Listing Total Models with Varients who have Front Breakes 

SELECT model, Variant, Front_Brakes, COUNT(Variant) as Total_Variants
from ['Car_Table']
group by model, Variant, Front_Brakes
having count (Variant)>0


update ['Car_Table'] 
set Front_Brakes = 'Brembo Brake Disc (Front)'
where Showroom_Price = 'Rs. 7,68,612'

--->>> Analysing the Most sold vehicle in April 2022

--- Maruti Suzuki India Limited sold a total of 150,661 units in April 2022. 
--- Total sales in the month include domestic sales of 126,261 units.
--- Baleno Rs.6.49 - 9.71 Lakh
--- Swift Rs. 5.91 - 8.85 Lakh
--- breaks are in pairs so 2*150661
--- lkq must recycle 2*150661 parts to meet demand after 2 years of warrenty
--- We need How many vehicles? ( Assuming, Cardheko Production incresed ) 

SELECT * FROM ['Car_Table']

SELECT * FROM ['Car_Price']




