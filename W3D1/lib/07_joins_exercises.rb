# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
  SELECT title
  FROM movies
  JOIN castings ON movies.id = castings.movie_id
  JOIN actors ON actors.id = castings.actor_id
  WHERE name = 'Harrison Ford';
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
  SELECT title
  FROM movies
  JOIN castings ON movies.id = castings.movie_id
  JOIN actors ON actors.id = castings.actor_id
  WHERE castings.ord != 1 AND name = 'Harrison Ford'
  GROUP BY title;
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
  SELECT title, name
  FROM movies
  JOIN castings ON movies.id = castings.movie_id
  JOIN actors ON actors.id = castings.actor_id
  WHERE castings.ord = 1 AND yr = 1962;
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
  SELECT yr, count(title)
  FROM movies

  -- join join join --
  JOIN castings ON movies.id = castings.movie_id
  JOIN actors ON actors.id = castings.actor_id
  -- join join join --

  WHERE name = 'John Travolta'

  GROUP BY yr
    HAVING count(title) > 1

  ORDER BY yr;
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.

  # ord = 1

  execute(<<-SQL)
  -- join method --
  SELECT jm.title, la.name
  FROM actors AS ja
  JOIN castings AS jc -- => actors + castings
    on ja.id = jc.actor_id -- 1
  JOIN movies AS jm -- => actors + castings + movies
    ON jc.movie_id = jm.id -- 2
  JOIN castings AS lc -- => actors + castings + movies + castings
    ON lc.movie_id = jm.id -- 3
  JOIN actors AS la -- => actors + castings + movies + castings + actors
    ON la.id = lc.actor_id -- 4
  WHERE ja.name = 'Julie Andrews' AND lc.ord = 1;

  -- subquery method --
  SELECT title, name
  FROM actors
  JOIN castings -- => actors + castings
    ON actors.id = castings.actor_id
  JOIN movies
    ON castings.movie_id = movies.id
  WHERE castings.ord = 1 AND castings.movie_id IN
    (
      SELECT castings.movie_id
      FROM actors
      JOIN castings -- => actors + castings
        ON actors.id = castings.actor_id
      JOIN movies
        ON castings.movie_id = movies.id
      WHERE actors.name = 'Julie Andrews'
    );
    --------
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
  SQL
end
