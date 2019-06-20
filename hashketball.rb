require "pry"



def game_hash
    team_hash={
        home:{
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players:[
                {
                    player_name: "Alan Anderson",
                    number: 0,
                    shoe: 16,
                    points: 22,
                    rebounds: 12,
                    assists: 12,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 1
                    },
                {
                    player_name: "Reggie Evans",
                    number: 30,
                    shoe: 14,
                    points: 12,
                    rebounds: 12,
                    assists: 12,
                    steals: 12,
                    blocks: 12,
                    slam_dunks: 7
                    },
                {
                    player_name: "Brook Lopez",
                    number: 11,
                    shoe: 17,
                    points: 17,
                    rebounds: 19,
                    assists: 10,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 15
                    },
                {
                    player_name: "Mason Plumlee",
                    number: 1,
                    shoe: 19,
                    points: 26,
                    rebounds: 11,
                    assists: 6,
                    steals: 3,
                    blocks: 8,
                    slam_dunks: 5
                    },                            
                {
                    player_name: "Jason Terry",
                    number: 31,
                    shoe: 15,
                    points: 19,
                    rebounds: 2,
                    assists: 2,
                    steals: 4,
                    blocks: 11,
                    slam_dunks: 1
                    }                          
            ]#end players array

        },#end home hash




        away:{
            team_name: "Charlotte Hornets",
            colors: ["Turquoise", "Purple"],
            players:[
                {
                    player_name: "Jeff Adrien",
                    number: 4,
                    shoe: 18,
                    points: 10,
                    rebounds: 1,
                    assists: 1,
                    steals: 2,
                    blocks: 7,
                    slam_dunks: 2
                    },
                {
                    player_name: "Bismack Biyombo",
                    number: 0,
                    shoe: 16,
                    points: 12,
                    rebounds: 4,
                    assists: 7,
                    steals: 22,
                    blocks: 15,
                    slam_dunks: 10
                    },
                {
                    player_name: "DeSagna Diop",
                    number: 2,
                    shoe: 14,
                    points: 24,
                    rebounds: 12,
                    assists: 12,
                    steals: 4,
                    blocks: 5,
                    slam_dunks: 5
                    },
                {
                    player_name: "Ben Gordon",
                    number: 8,
                    shoe: 15,
                    points: 33,
                    rebounds: 3,
                    assists: 2,
                    steals: 1,
                    blocks: 1,
                    slam_dunks: 0
                    },                            
                {
                    player_name: "Kemba Walker",
                    number: 33,
                    shoe: 15,
                    points: 6,
                    rebounds: 12,
                    assists: 12,
                    steals: 7,
                    blocks: 5,
                    slam_dunks: 12
                    }                            
            ]#end players array

        }#end away hash
    } #end team_hash
    return team_hash
end #end game_hash method


def home_team_name
    game_hash[:home][:team_name]
end


def good_practices
    game_hash.each do |location, team_data|
      #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
      binding.pry
      team_data.each do |attribute, team|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
       binding.pry
   
        #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
        team.each do |data_item|#didn't work bc string
            binding.pry
        end
      end
    end
  
end

#good_practices


def num_points_scored(name)
#takes in an argument of a player's name and returns the number of points scored for that player.

    game_hash.each do |location, team_data|
        team_data[:players].each do |player|
            #binding.pry
            if player[:player_name] == name
                #binding.pry
                return player[:points]
            end
        end
    end
end



def shoe_size(name)
  #takes in an argument of a player's name and returns the shoe size for that player

    game_hash.each do |location, team_data|
        team_data[:players].each do |player|
        #binding.pry
            if player[:player_name] == name
            #binding.pry
                return player[:shoe]
            end
        end
    end
end


def team_colors(team)
  #takes in an argument of the team name and returns an array of that teams colors.

    game_hash.each do |location, team_data|
        if team_data[:team_name] == team
        #binding.pry
            return team_data[:colors]
        end
    end
end


def team_names
      #operates on the game hash to return an array of the team names
    team_names_array = []

    game_hash.each do |location, team_data|
        #binding.pry
        team_names_array.push(team_data[:team_name])
    end
    return team_names_array
    
end


def player_numbers(team)
  #takes in an argument of a team name and returns an array of the jersey numbers for that team.
    jersey_numbers_array = []

    game_hash.each do |location, team_data|
        if team_data[:team_name] == team
        #binding.pry
            team_data[:players].each do |jersey|

        #binding.pry
                
            jersey_numbers_array.push(jersey[:number])
        
            end
        end
    end
    return jersey_numbers_array

end


def player_stats(name)
  #takes in an argument of a player's name and returns a hash of that player's stats.
  
    game_hash.each do |location, team_data|
        team_data[:players].each do |player|
        #binding.pry
            if player[:player_name] == name
            new_hash = player
            # binding.pry

            new_hash.delete_if {|key, value| key == :player_name}
            #binding.pry

            return new_hash
            end
        end
    end    
end


def big_shoe_rebounds
  #returns the number of rebounds associated with the player that has the largest shoe size.
  #First, find the player with the largest shoe size
  #Then, return that player's number of rebounds

    largest_shoe_player = {player_name: nil, number: nil, shoe: 0, points: nil, rebounds: nil, assists: nil, steals: nil, blocks: nil, slam_dunks: nil}

    game_hash.each do |location, team_data|
        team_data[:players].each do |player|
            #binding.pry
            if player[:shoe] > largest_shoe_player[:shoe]
                largest_shoe_player = player
            end
            #binding.pry


        end
    end
    return largest_shoe_player[:rebounds]
end

#h.sort {|a,b| a[1]<=>b[1]} ??