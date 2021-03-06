select b.*
from HealthFacts_2016.dbo.view_encounter a
left join HealthFacts_2016.dbo.view_clinical_event b on a.ENCOUNTER_ID = b.ENCOUNTER_ID
where patient_sk in
(
	select distinct PATIENT_SK
	from HealthFacts_2016.dbo.view_encounter
	where encounter_id in
	(
		select distinct encounter_id
		FROM HealthFacts_2016.dbo.view_procedure
		where PROCEDURE_CODE in ('36.10', '36.11', '36.12', '36.13', '36.14', '36.15', '36.16', '36.17', '36.19', '36.2')
	)
) and
	year(admitted_dt_tm) >= 2010 and
	year(admitted_dt_tm) <= 2015