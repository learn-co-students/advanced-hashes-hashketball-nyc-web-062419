def game_hash 
    {
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black","White"],
            players: {
                "Alan Anderson" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                "Reggie Evans" => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                },
                "Brook Lopez" => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                "Mason Plumlee" => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 11,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                "Jason Terry" => {
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            }
        },
        away: {
            team_name: "Charlotte Hornets",
            colors: ["Purple", "Turquoise"],
            players: {
                "Jeff Adrien" => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                "Bismack Biyombo" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                "DeSagna Diop" => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                "Ben Gordon" => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                "Kemba Walker" => {
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 7,
                    :blocks => 5,
                    :slam_dunks => 12
                }
            }
         }
    }
end


 def num_points_scored(selected_player)
  points_to_return = 0
  hash = game_hash
  game_hash.each do |sides,teams|
    teams[:players].each do |player,data|
      if player == selected_player
      points_to_return += data[:points]
      end
    end
  end
  points_to_return
end


 def shoe_size(selected_player)
  value_to_return = 0
  hash = game_hash
  game_hash.each do |sides,teams|
    teams[:players].each do |player,data|
      if player == selected_player
        value_to_return += data[:shoe]
      end
    end
  end
  value_to_return
end


 def team_colors(team)
  colors = []
  hash = game_hash
  hash.each do |sides,teams|
    if teams[:team_name] == team
      colors = teams[:colors]
    end
  end
  colors
end


 def team_names 
  teams_display = []
  hash = game_hash
  hash.each do |sides,teams|
    teams_display << teams[:team_name] 
    end
  teams_display
end


 def player_numbers(team)
  hash = game_hash
  jersey_nums = []
  hash.each do |sides,teams|
    if teams[:team_name] == team
      teams[:players].each  do |player,data|
        jersey_nums << data[:number]
      end
    end
  end
  jersey_nums
end


 def big_shoe_rebounds 
  value_to_return = 0
  shoe_size = 0
  hash = game_hash
  game_hash.each do |sides,teams|
    teams[:players].each do |player,data|
      if data[:shoe] > shoe_size 
        shoe_size = data[:shoe]
        value_to_return = data[:rebounds]
      end
    end
  end
  value_to_return
end


 def player_stats(selection)
  value_to_return = 0
  hash = game_hash
  game_hash.each do |sides,teams|
    teams[:players].each do |player,data|
      if selection == player
        value_to_return = data
      end
    end
  end
  value_to_return
end


 def most_points_scored 
  value_to_return = 0
  points_scored = 0
  hash = game_hash
  game_hash.each do |sides,teams|
    teams[:players].each do |player,data|
      if data[:points] > points_scored
        points_scored = data[:points]
        value_to_return = player
      end
    end
  end
  value_to_return
end


 def most_steals 
  value_to_return = 0
  steals = 0
  hash = game_hash
  game_hash.each do |sides,teams|
    teams[:players].each do |player,data|
      if data[:steals] > steals
        steals = data[:steals]
        value_to_return = player
      end
    end
  end
  value_to_return
end


 def winning_team 
  value_to_return = ""
  allPoints = []
  hash = game_hash
  game_hash.each do |sides,teams|
    teamPoints = 0
    teams[:players].each do |player,data|
      teamPoints += data[:points] 
    end
    allPoints.push(teamPoints)
  end
  if allPoints[0] > allPoints[1]
    value_to_return = "Brooklyn Nets"
  else
    value_to_return = "Charlotte Hornets"
  end
  value_to_return
end


 def player_with_longest_name
  value_to_return = 0
  nameLen = 0
  hash = game_hash
  game_hash.each do |sides,teams|
    teams[:players].each do |player,data|
      if player.to_s.length > nameLen
        nameLen = player.to_s.length
        value_to_return = player
      end
    end
  end
  value_to_return
end

def long_name_steals_a_ton?
  if player_with_longest_name == most_steals
    return true 
  end
end


