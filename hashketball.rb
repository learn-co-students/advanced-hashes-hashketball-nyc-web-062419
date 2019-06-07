# Write your code here!
require "pry"

def game_hash 
    game = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
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
                    :rebounds => 12,
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


def num_points_scored(player)
    game_hash.each do |location, team_data|
        team_data.each do |team_attribute, attribute_value|
            if attribute_value.include?(player)
                return game_hash[location][team_attribute][player][:points]
            end
        end
    end
end

def shoe_size(player)
    game_hash.each do |location, team_data|
        team_data.each do |team_attribute, attribute_value|
            if attribute_value.include?(player)
                return game_hash[location][team_attribute][player][:shoe]
            end
        end
    end
end

 def team_colors(name)
    array = []
    game_hash.each do |location, attributes|
        if game_hash[location].values.include?(name)
            attributes.each do |attribute, info|
                if attribute == :colors
                    array << info
                end
            end
        end
    end
    return array.flatten
end

def team_names
    names = []
    game_hash.each do |location, attributes|
        attributes.each do |attribute, info|
            if attribute == :team_name
                names << info
            end
        end
    end
    return names
end

def player_numbers(team)
    array = []
    game_hash.each do |location, attributes|
        if game_hash[location].values.include?(team)
            attributes[:players].each do |name, stat|
                array << stat[:number]
            end
        end
    end
    return array
end

def player_stats(player_name)
    result = {}
    game_hash.each do |location, attributes|
        attributes[:players].each do |name, stats|
            if name == player_name
                result = stats
                return result
            end
        end
    end
end 

def big_shoe_rebounds
    biggest_name = nil
    biggest_shoe = 0
    game_hash.each do |location, attributes|
        attributes[:players].each do |name, stats|
            if biggest_shoe == 0 || stats[:shoe] > biggest_shoe
                biggest_shoe = stats[:shoe]
                biggest_name = name
            end
        end
    end 
    #biggest_name
    game_hash.each do |location, attributes|
        attributes[:players].each do |name, stats|
            if name == biggest_name
                return stats[:rebounds]
            end
        end
    end
end     

def most_points_scored
    most_pts_name = nil
    most_pts = 0
    game_hash.each do |location, attributes|
        attributes[:players].each do |name, stats|
            if most_pts == 0 || stats[:points] > most_pts
                most_pts = stats[:points]
                most_pts_name = name
            end
        end
    end 
    most_pts_name
end

def winning_team
    pt_bucket_home = 0
    pt_bucket_away = 0

    game_hash.each do |attributes, value|
        if attributes == :home
            value[:players].each do |name, stats|
                pt_bucket_home += stats[:points]
            end
        end
    end 

    game_hash.each do |attributes, value|
        if attributes == :away
            value[:players].each do |name, stats|
                pt_bucket_away += stats[:points]
            end
        end
    end 

    if pt_bucket_home > pt_bucket_away
        return game_hash[:home][:team_name]
    elsif pt_bucket_home < pt_bucket_away
        return game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    longest_name = " "

    game_hash.each do |attributes, value|
        value[:players].each do |name, stats|
            if longest_name.length == 0 || name.length > longest_name.length
                longest_name = name
            end
        end
    end
    longest_name
end

def long_name_steals_a_ton?
    longest_name = " "

    game_hash.each do |attributes, value|
        value[:players].each do |name, stats|
            if longest_name.length == 0 || name.length > longest_name.length
                longest_name = name
            end
        end
    end

    stealy_dan = ""
    most_steals = 0

    game_hash.each do |attributes, value|
        value[:players].each do |name, stats|
            if most_steals == 0 || stats[:steals] > most_steals
                most_steals = stats[:steals]
                stealy_dan = name
            end
        end
        stealy_dan
    end

    if longest_name == stealy_dan
        return true  
    end

end

# holy shit i did it!