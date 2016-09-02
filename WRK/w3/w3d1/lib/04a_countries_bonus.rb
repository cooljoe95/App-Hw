# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT
    name
  FROM
    countries
  WHERE
   gdp >
  (
    SELECT
      max(gdp)
    FROM
      countries
    WHERE
      continent = 'Europe'
  )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT
      continent,
      name,
      area
    FROM
      countries
    WHERE
      (continent, area) IN
    (
      SELECT
        continent, max(area)
      FROM
        countries
      GROUP BY
        continent
    )
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.

  execute(<<-SQL)


  SELECT
    continent c,
    MAX(population) p
  FROM
    countries
  WHERE
  population <
    (
      SELECT
        MAX(population)
      FROM
        countries
      GROUP BY
        continent
      HAVING
        c = continent
    )
  GROUP BY
    continent



  -- SELECT
  -- name n
  -- FROM
  -- countries
  -- WHERE
  -- (continent, area) IN
  -- (
  -- SELECT
  --   continent, max(area)
  -- FROM
  --   countries
  -- GROUP BY
  --   continent
  -- )
  --   --
    -- SELECT
    --   country,
    --   continent
    -- FROM
    --   countries
    -- WHERE
    --   population >=
    --   (
    --
    --
    --     (
    --     SELECT
    --       continent, MAX( population )
    --     FROM
    --       countries
    --     GROUP BY
    --       continent
    --     )
    --
    --
    --   )
-- up vote
-- 158
-- down vote
-- accepted
-- SELECT MAX( col )
--   FROM table
--  WHERE col < ( SELECT MAX( col )
--                  FROM table )
  SQL
end
