# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    yr
  FROM
    nobels
  WHERE
    subject = 'Physics' AND yr NOT IN
    (
      SELECT
        yr
      FROM
        nobels
      WHERE
        subject = 'Chemistry'
    )
  GROUP BY
    yr






  -- SELECT
  --   yr
  -- FROM
  --   nobels
  -- WHERE
  --   (SELECT
  --     subject
  --   FROM
  --     nobels
  --   WHERE
  --     )
  -- --   winner IN
  -- (SELECT
  --   winner
  -- FROM
  --   nobels
  -- WHERE
  --   subject = 'Physics')
  -- AND
  -- winner IN
  -- (SELECT
  --   subject
  -- FROM
  --   nobels
  -- WHERE
  --   subject != 'Chemistry')
  SQL
end
