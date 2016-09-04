require 'singletON'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# List the films in which 'Chuck Norris' has appeared; ORDER BY movie
# title.
def bearded_films
  MovieDatabase.execute(<<-SQL)
  SELECT movies.title
  FROM movies
  JOIN castings ON movie_id = movies.id
  JOIN actors ON castings.actor_id = actors.id
  WHERE actors.name = 'Chuck Norris'
  ORDER BY title;
  SQL
end

# Obtain the cast list for the movie "Zombies of the Stratosphere";
# ORDER BY the actor's name.
def zombie_cast
  MovieDatabase.execute(<<-SQL)
  SELECT name
  FROM castings
  JOIN actors ON actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE movies.title = 'Zombies of the Stratosphere'
  ORDER BY name;
  SQL
end

# Which were the busiest years for 'Danny DeVito'? Show the year AND
# the number of movies he acted in for any year in which he was part of
# >2 movies. ORDER BY year. Note the 'V' is capitalized.
def biggest_years_for_little_danny
  MovieDatabase.execute(<<-SQL)
  SELECT yr, count(title) count
  FROM movies
  JOIN castings ON movie_id = movies.id
  JOIN actors ON actors.id = castings.actor_id
  WHERE name = 'Danny DeVito'
  GROUP BY yr
  HAVING count(title) > 2
  ORDER BY yr;
  SQL
end

# List the films WHERE 'Nicolas Cage' has appeared, but not in the
# star role. ORDER BY movie title.
def more_cage_please
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM movies
  JOIN castings ON movie_id = movies.id
  JOIN actors ON actors.id = castings.actor_id
  WHERE name = 'Nicolas Cage' AND ord != 1
  ORDER BY title;
  SQL
end

# List the films together with the leading star for all 1908
# films. ORDER BY movie title.
def who_is_florence_lawrence
  MovieDatabase.execute(<<-SQL)
  SELECT title, name
  FROM movies
  JOIN castings ON movie_id = movies.id
  JOIN actors ON actors.id = castings.actor_id
  WHERE yr = 1908 AND ord = 1
  ORDER BY title;
  SQL
end

# Some actors listed in our database are not associated with any actual
# movie role(s). How many such actors are there? Alias this number as
# 'num_bad_actors'.
def count_bad_actors
  MovieDatabase.execute(<<-SQL)
  SELECT COUNT(name) num_bad_actors
  FROM actors
  LEFT OUTER JOIN castings ON actors.id = castings.actor_id
  LEFT OUTER JOIN movies ON movies.id = castings.movie_id
  WHERE ord IS NULL
SQL
end

# Obtain a list in alphabetical order of actors who've had exactly 20
# starring roles. ORDER BY actor name.
def twenty_roles
  MovieDatabase.execute(<<-SQL)
  SELECT name
  FROM movies
  JOIN castings ON movie_id = movies.id
  JOIN actors ON actors.id = castings.actor_id
  WHERE ord = 1
  GROUP BY name
  HAVING COUNT(title) = 20
  ORDER BY name;
  SQL
end

# List the film title AND the leading actor for all of the films
# 'Chris Farley' played in.
def chris_is_missed
  MovieDatabase.execute(<<-SQL)
  SELECT title, name
  FROM (
    SELECT movies.*
    FROM movies
    JOIN castings on movie_id = movies.id
    JOIN actors ON actors.id = castings.actor_id
    WHERE name = 'Chris Farley'
  ) movies
  JOIN castings on movie_id = movies.id
  JOIN actors ON actors.id = castings.actor_id
  WHERE ord = 1;
  SQL
end
