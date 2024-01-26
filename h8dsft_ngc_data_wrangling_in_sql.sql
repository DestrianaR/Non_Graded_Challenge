SELECT *
FROM `patents-public-data.uspto_oce_cancer.publications`


SELECT CAST(SUBSTR(Grant_or_Publication_Date, 1, 4) AS INT) AS year, CAST(SUBSTR(Grant_or_Publication_Date, 5, 2) AS INT) AS month, COUNT(Patent_or_Publication_ID) AS total_patent
FROM `patents-public-data.uspto_oce_cancer.publications`
WHERE (Patent_Title LIKE '%data mining%' 
AND (Grant_or_Publication_Date >= '20120000' AND Grant_or_Publication_Date <= '2023000'))
GROUP BY Grant_or_Publication_Date
ORDER BY year DESC, month ASC;