all_files = ['app/barrels.rb', 'app/collisions.rb', 'app/dk.rb', 'app/gameplay.rb', 'app/floors.rb', 'app/helper_functions.rb', 'app/jumpman.rb', 'app/lose.rb', 'app/score.rb', 'app/spawn_points.rb', 'app/state_machine.rb', 'app/text.rb', 'app/win.rb']

all_files.each do |file|
  require file
end
