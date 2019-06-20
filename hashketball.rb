

def game_hash
    the_game_hash = {home: {team_name: "Brooklyn Nets", colors: ["Black", "White"], players: [{name: "Alan Anderson",number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}, {name: "Reggie Evans",number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}, {name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15}, {name: "Mason Plumlee",number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5}, {name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}]}, 
    away: {team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"], players: [{name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2}, {name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10}, {name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5}, {name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0}, {name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}]}}
end

def num_points_scored(name)
    points = nil
    game_hash.each do |location, data_set|  
        data_set.each do |attribute, data|
            if attribute == :players
                data.each do |hash|
                    if hash.values.include?(name)
                        hash.collect do |stat, info|
                            if stat == :points
                                points = info
                            break
                            end
                        end
                    end
                end
            end
        end
    end
    points
end

def shoe_size(name)
    shoe_size = nil
    game_hash.each do |location, data_set|  
        data_set.each do |attribute, data|
            if attribute == :players
                data.each do |hash|
                    if hash.values.include?(name)
                        hash.collect do |stat, info|
                            if stat == :shoe
                                shoe_size = info
                            break
                            end
                        end
                    end
                end
            end
        end
    end
    shoe_size
end

def team_colors(team)
    colors = nil
    game_hash.each do |location, data_set|
        if data_set.values.include?(team)
            data_set.each do |attribute, data|
                if attribute == :colors
                    colors = data
                end
            end
        end
    end  
    colors
end

def team_names
    teams = []
    game_hash.each do |location, data_set|
        data_set.each do |attribute, data|
            if attribute == :team_name
                teams << data
            end
        end
    end
    teams
end

def player_numbers(team)
    numbers = []
    game_hash.each do |location, data_set|
        if data_set.values.include?(team)
            data_set.each do |attribute, data|
                if attribute == :players
                    data.each do |hash|
                        hash.collect do |stat, info|
                            if stat == :number
                                numbers << info
                            end
                        end
                    end
                end
            end
        end
    end
    numbers
end


def player_stats(name)
    stats = nil
    game_hash.each do |location, data_set|
        data_set.each do |attribute, data|
            if attribute == :players
                data.each do |hash|
                    if hash.values.include?(name)
                        stats = hash
                    end
                end
            end
        end
    end
    stats.delete(:name)
    stats
end

def big_shoe_rebounds
    biggest_shoe = 0
    rebounds = 0
    game_hash.each do |location, data_set|
        data_set.each do |attribute, data|
            if attribute == :players
                data.each do |hash|
                    hash.each do |stat, info|
                        if stat == :shoe
                            if info > biggest_shoe
                                biggest_shoe = info
                                rebounds = "update"
                            end
                        elsif stat == :rebounds
                            if rebounds == "update"
                                rebounds = info
                            end
                        end
                    end
                end
            end
        end
    end
    rebounds
end

def most_points_scored
    most_points = 0
    current_player = ""
    player = ""
    game_hash.each do |location, data_set|
        data_set.each do |attribute, data|
            if attribute == :players
                data.each do |hash|
                    hash.each do |stat, info|
                        if stat == :name
                            current_player = info
                        elsif stat == :points
                            if info > most_points
                                most_points = info
                                player = current_player
                            end
                        end
                    end
                end
            end
        end
    end
    player
end

def winning_team
    home_score = 0
    away_score = 0
    game_hash[:home].each do |attribute, data|
        if attribute == :players
            data.each do |hash|
                hash.each do |stat, info|
                    if stat == :points
                        home_score += info
                    end
                end
            end
        end
    end
    game_hash[:away].each do |attribute, data|
        if attribute == :players
            data.each do |hash|
                hash.each do |stat, info|
                    if stat == :points
                        away_score += info
                    end
                end
            end
        end
    end
    if home_score > away_score
        game_hash[:home][:team_name]
    else
        game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    longest_length = 0
    player = ""
    game_hash.each do |location, data_set|
        data_set.each do |attribute, data|
            if attribute == :players
                data.each do |hash|
                    hash.each do |stat, info|
                        if stat == :name
                            if info.length > longest_length
                                longest_length = info.length
                                player = info
                            end
                        end
                    end
                end
            end
        end
    end
    player
end

def long_name_steals_a_ton?
    most_steals = 0
    longest_name = player_with_longest_name
    longest_name_steals = 0

    game_hash.each do |location, data_set|
        data_set.each do |attribute, data|
            if attribute == :players
                data.each do |hash|
                    if hash.values.include?(longest_name)
                        hash.each do |stat, info|
                            if stat == :steals
                                longest_name_steals = info
                                end
                            end
                        end
                    hash.each do |stat, info|
                        if stat == :steals
                            if info > most_steals
                                most_steals = info
                            end
                        end
                    end
                end
            end
        end
    end

    if longest_name_steals >= most_steals
        true
    else
        false
    end
end
# def good_practices
#     game_hash.each do |location, team_data|
#       #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#       binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
   
#         #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#         end
#       end
#     end
#   end

#   good_practices
# Write your code here!










