use serverless
GO
Select iso_code,location , continent,
max(isnull(new_deaths_per_million,0)) as death_sum,
max(isnull(people_fully_vaccinated,0) / isnull(population,0)) * 100 as percentage_vaccinated From covid
where isnull(population,0) > 1000000
group by iso_code,location,continent
order by death_sum desc
