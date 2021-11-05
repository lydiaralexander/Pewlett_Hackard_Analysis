
-- Export Data
SELECT * FROM retirement_info;

COPY "public".retirement_info TO 'C:\Users\mrale\Lydia\AnalysisProjects\Pewlett_Hackard_Analysis\Pewlett_Hackard_Analysis\retirement_info.csv' DELIMITER ',' CSV HEADER