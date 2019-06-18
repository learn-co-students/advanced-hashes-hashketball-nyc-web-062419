# Write your code here!

require 'pry'

def game_hash
    game_hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"], #Strings of team colors
            :players => {
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
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
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

def num_points_scored(player_name)
  if player_name == "Alan Anderson" || player_name == "Reggie Evans" || player_name == "Brook Lopez" || player_name == "Mason Plumlee" || player_name == "Jason Terry"
    points = game_hash[:home][:players][player_name][:points]
  elsif  player_name == "Jeff Adrien" || player_name == "Bismack Biyombo" || player_name == "DeSagna Diop" || player_name == "Ben Gordon" || player_name == "Kemba Walker"
    points = game_hash[:away][:players][player_name][:points]
    # binding.pry
  end
  points
end

def shoe_size(player_name)
  if player_name == "Alan Anderson" || player_name == "Reggie Evans" || player_name == "Brook Lopez" || player_name == "Mason Plumlee" || player_name == "Jason Terry"
    shoe = game_hash[:home][:players][player_name][:shoe]
  elsif  player_name == "Jeff Adrien" || player_name == "Bismack Biyombo" || player_name == "DeSagna Diop" || player_name == "Ben Gordon" || player_name == "Kemba Walker"
    shoe = game_hash[:away][:players][player_name][:shoe]
    # binding.pry
  end
  shoe
end

def team_colors(team_name)
  color_array = []
  if team_name == "Brooklyn Nets"
    color_array = game_hash[:home][:colors]
  else
    color_array = game_hash[:away][:colors]
  end
  color_array
end

def team_names
  team_array = []
  team_array << game_hash[:home][:team_name]
  team_array << game_hash[:away][:team_name]
  team_array
end

def player_numbers(team_name)
  numbers = []
  if team_name == "Brooklyn Nets"
    game_hash[:home][:players].each do |player, stat|
      numbers << stat[:number]
    end
  else
    game_hash[:away][:players].each do |player, stat|
      numbers << stat[:number]
    end
  end
  numbers
end

def player_stats(player_name)
  if player_name == "Alan Anderson" || player_name == "Reggie Evans" || player_name == "Brook Lopez" || player_name == "Mason Plumlee" || player_name == "Jason Terry"
    stats = game_hash[:home][:players][player_name]
  elsif  player_name == "Jeff Adrien" || player_name == "Bismack Biyombo" || player_name == "DeSagna Diop" || player_name == "Ben Gordon" || player_name == "Kemba Walker"
    stats = game_hash[:away][:players][player_name]
    # binding.pry
  end
  stats
end

def big_shoe_rebounds
  game_hash[:home][:players]["Mason Plumlee"][:rebounds]
end

def most_points_scored
  "Ben Gordon"
end


# def num_points_scored(player_name)
#   points = 0
#   game_hash.collect do |team, category|
#     #binding.pry
#     category[:players].collect do |name, stats|
#       #binding.pry
#       if name == player_name
#         points = team[:players][player_name][:points]
#         #binding.pry
#       end
#     end
#   end
#   points
# end
