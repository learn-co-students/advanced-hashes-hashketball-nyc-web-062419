# Write your code here!
require "pry"

def game_hash
    {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black","White"],
            :players => [
                {
                    :player_name => "Alan Anderson",     
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                {
                    :player_name => "Reggie Evans",
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7 
                },
                {
                    :player_name => "Brook Lopez",
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15 
                },
                {
                    :player_name => "Mason Plumlee",
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                {
                    :player_name => "Jason Terry",
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            ]
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => [
                {
                    :player_name => "Jeff Adrien",
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                {
                    :player_name => "Bismack Biyombo",
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                {
                    :player_name => "DeSagna Diop",
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5 
                },
                {
                    :player_name => "Ben Gordon",
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0 
                },
                {
                    :player_name => "Kemba Walker",
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 7,
                    :blocks => 5,
                    :slam_dunks => 12
                }
            ]
        }
    }
end

def player_info
    players = game_hash.keys.map do |location|
        game_hash[location][:players]
    end
    players.flatten
end

def player_finder(name)
    player_info.find do |info|
        info[:player_name] == name
    end
end

def num_points_scored(player_names)
    found_player = player_finder(player_names)
    found_player[:points]
end

def shoe_size(player_names)
    found_player = player_finder(player_names)
    found_player[:shoe]
end

def team_colors(team)
    game_hash.each do |loc, data|
        if data[:team_name] == team
            return game_hash[loc][:colors]
        end
    end
end

def team_names 
    game_hash.map do |loc,data|
        data[:team_name]
    end
end

def player_numbers(name)
    x = []
    game_hash.each do |loc, data|
        if data[:team_name] == name
            data[:players].each do |stat|
               x << stat[:number]
            end
        end
    end
    return x 
end

def player_stats(player_name)
    found_player = player_finder(player_name)
    found_player.delete(:player_name)
    return found_player
end

def big_shoe_rebounds
    rebound = 0
    biggest_shoe = 0
    game_hash.each do |loc, data|
        data[:players].each do |z|
            if z[:shoe] > biggest_shoe
                biggest_shoe = z[:shoe]
                rebound = z[:rebounds]
            end
        end
    end
    return rebound
end

def most_points_scored
    points = 0
    player_name = " "
    game_hash.each do |loc, data|
        data[:players].each do |z|
            if z[:points] > points
                points = z[:points]
                player_name = z[:player_name]
            end
        end
    end
    return player_name
end

def end_game_scores(team_name)
    total_score = 0 
    game_hash.each do |loc, data|

        if data[:team_name] == team_name
            data[:players].each do |z|
                total_score += z[:points]
            end
        end
    end
    return total_score
end




def winning_team
    higher_score = 0
    higher_score_team = " "
    teams = {}
    team_names.each do |x|
        teams[x] = end_game_scores(x)
    end
    teams.each do |team,score|
        if score > higher_score
            higher_score = score
            higher_score_team = team
        end
    end
    return higher_score_team
end

def player_with_longest_name
    name_length = 0
    name = " "
    game_hash.each do |loc, data|
        data[:players].each do |z|
            if z[:player_name].length > name_length
                name_length = z[:player_name].length
                name = z[:player_name]
            end
        end
    end
    return name
end

def long_name_steals_a_ton?
    steals = 0
    player_name = " "
    game_hash.each do |loc, data|
        data[:players].each do |z|
            if z[:steals] > steals
                steals = z[:steals]
                player_name = z[:player_name]
            end
        end
    end
    player_name
    player_with_longest_name == player_name
end