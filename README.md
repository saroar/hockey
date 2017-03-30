# Ruby OOP style

# How to run code: 
team1 = Team.new('Team1', 2)
team2 = Team.new('Team2', 3)

h = Hockey.new(team1, team2, :html)

p h.print_format
p h.print_format

# How to run test: 
bundle exec rspec spec
