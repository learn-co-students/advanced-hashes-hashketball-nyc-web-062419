# Write your code here!

require "pry"

def game_hash
    {home:
        {team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: [
            {number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12, 
            assists: 12,
            steals: 3, 
            blocks: 1,
            slam_dunks: 1},

            {number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12, 
            assists: 12,
            steals: 12, 
            blocks: 12,
            slam_dunks: 7},

            {number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19, 
            assists: 10,
            steals: 3, 
            blocks: 1,
            slam_dunks: 15},

            {number: 1,
            shoe: 19,
            points: 26,
            rebounds: 11, 
            assists: 6,
            steals: 3, 
            blocks: 8,
            slam_dunks: 5},

            {number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4, 
            blocks: 11,
            slam_dunks: 1}

        ]},
    away:
        {team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: [
            {number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1, 
            assists: 1,
            steals: 2, 
            blocks: 7,
            slam_dunks: 2},

            {number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4, 
            assists: 7,
            steals: 22, 
            blocks: 15,
            slam_dunks: 10},

            {number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12, 
            assists: 12,
            steals: 4, 
            blocks: 5,
            slam_dunks: 5},

            {number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3, 
            assists: 2,
            steals: 1, 
            blocks: 1,
            slam_dunks: 0},

            {number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12, 
            assists: 12,
            steals: 7, 
            blocks: 5,
            slam_dunks: 12}

        ]}}
end




def name_search(name)

    nets_names = ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"]
    hornets_names = ["Jeff Adrien", "Bismack Biyombo", "DeSagna Diop", "Ben Gordon", "Kemba Walker"]

    if nets_names.include? name
        ind = nets_names.index(name)
        tm = :home
    else
        ind = hornets_names.index(name)
        tm = :away
    end

    {team: tm, index: ind}

end

def team_search(team)

    if team == "Brooklyn Nets"
        symb = :home
    elsif team == "Charlotte Hornets"
        symb = :away
    end

    symb

end




def num_points_scored(name)

    info = name_search(name)

    game_hash[info[:team]][:players][info[:index]][:points]

end

def shoe_size (name)

    info = name_search(name)

    game_hash[info[:team]][:players][info[:index]][:shoe]

end

def team_colors(team)

    game_hash[team_search(team)][:colors]
    
end

def team_names

    [game_hash[:home][:team_name], game_hash[:away][:team_name]]

end

def player_numbers (team)

    game_hash[team_search(team)][:players].collect do |player|
        player[:number]
    end
end

def player_stats (name)

    info = name_search(name)

    game_hash[info[:team]][:players][info[:index]]

end

def big_shoe_rebounds

    candidate = game_hash[:home][:players][0]

    game_hash[:home][:players].each do |player|
        if player[:shoe] > candidate[:shoe]
            candidate = player
        end
    end

    game_hash[:away][:players].each do |player|
        if player[:shoe] > candidate[:shoe]
            candidate = player
        end
    end

    candidate[:rebounds]

end


def most_points_scored

    candidate = game_hash[:home][:players][0]
    candidate_team = 0
    candidate_player = 0

    game_hash[:home][:players].each_with_index do |player, index|
        if player[:points] > candidate[:points]
            candidate = player
            candidate_team = 0
            candidate_player = index
        end
    end

    game_hash[:away][:players].each_with_index do |player, index|
        if player[:points] > candidate[:points]
            candidate = player
            candidate_team = 1
            candidate_player = index
        end
    end

    people = [["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"],
        ["Jeff Adrien", "Bismack Biyombo", "DeSagna Diop", "Ben Gordon", "Kemba Walker"]]

    people[candidate_team][candidate_player]

end

def winning_team

    def team_score(symb)

        total = 0

        game_hash[symb][:players].each do |player|
            total = total + player[:points]
        end

        total
    end

    if team_score(:home)>team_score(:away)
        game_hash[:home][:team_name]
    else
        game_hash[:away][:team_name]
    end
end

def player_with_longest_name

    people = ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry",
        "Jeff Adrien", "Bismack Biyombo", "DeSagna Diop", "Ben Gordon", "Kemba Walker"]

    candidate = "Alan Anderson"

    people.each do |player|
        if player.size > candidate.size
            candidate = player
        end
    end

    candidate

end

def long_name_steals_a_ton?
    
    candidate_value = true

    longest = player_with_longest_name

    longest_steals = game_hash[name_search(longest)[:team]][:players][name_search(longest)[:index]][:steals] 


    game_hash[:home][:players].each do |player|
        if player[:steals] > longest_steals
            candidate_value = false
        end
    end

    game_hash[:away][:players].each do |player|
        if player[:steals] > longest_steals
            candidate_value = false
        end
    end


    candidate_value

end



