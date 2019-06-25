require 'pry'
require 'byebug'

def game_hash 
	{
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: [
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
					},
					],
		},
		
	
	away: {
		team_name: "Charlotte Hornets",
		colors: ["Turquoise", "Purple"],
		players: [
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
					},
					],
			},
	}			
end

def players_array(given_hash)
	given_hash.collect do |side, information|
		information[:players]
	end.flatten
end

def num_points_scored(name)
	all_players = players_array(game_hash)
	player = all_players.find do |player_hash|
		player_hash[:player_name] == name
	end
	player[:points]
end

# def num_points_scored(name)
# 	game_hash.each do |team, team_information|
# 		team_information[:players].each do |player_name, player_stat|
# 			if name == player_name
# 				return player_stat[:points]
# 			end
# 		end
# 	end
# end

def shoe_size(name)
	all_players = players_array(game_hash)
	player = all_players.find do |player_hash|
		player_hash[:player_name] == name
	end
	player[:shoe]
end

# def shoe_size(name) 
# 	game_hash.each do |team, team_info|
# 		team_info[:players].each do |player_name, player_stat|
# 			if name == player_name
# 				return player_stat[:shoe]
# 			end
# 		end
# 	end
# end

def team_colors(team_name)
	game_hash.each do |team, team_info|
		if team_name == team_info[:team_name]
			return team_info[:colors]
		end
	end
end

# def team_colors(name_of_team)
# 	game_hash.each do |team, team_info|			
# 		if name_of_team == team_info[:team_name]
# 			return team_info[:colors]
# 		end
# 	end
# end

def team_names
	array_of_team_names = []
	game_hash.collect do |team, team_info|
		team_info[:team_name]
	end
end

# def team_names
# 	array_of_team_names = []
# 	game_hash.each do |team, team_info|
# 		array_of_team_names.push(team_info[:team_name])
# 	end
# 	return array_of_team_names
# end

def player_numbers(name_of_team)
	array_of_jersey_numbers = []
	game_hash.each do |team, team_information|
		if name_of_team == team_information[:team_name]
			team_information[:players].each do |player_stat|
			array_of_jersey_numbers.push(player_stat[:number])
			end
		end
	end
	return array_of_jersey_numbers
end

def player_stats(name)
	stats_hash = {}
	all_players = players_array(game_hash)
	all_players.each do |player_information|
		player_information.each do |k, v|
			if name == player_information[:player_name] 
				stats_hash[k] = v
			end
		end
	end
	stats_hash.reject! {|k| k == :player_name}
end

def big_shoe_rebounds
	shoe_size = 0
	player_rebounds = 0
	all_players = players_array(game_hash)
	all_players.each do |player_hash|
		current_shoe_size = player_hash[:shoe]
		if current_shoe_size > shoe_size
			player_rebounds = player_hash[:rebounds]
			shoe_size = current_shoe_size
		end				
	end
	player_rebounds
end

def most_points_scored
	points_scored = 0
	player_name = ""
	all_players = players_array(game_hash)
	all_players.each do |player_hash|
		most_points_scored = player_hash[:points]
		if most_points_scored > points_scored
			player_name = player_hash[:player_name]
			points_scored = most_points_scored
		end
	end
	player_name
end

def winning_team
	away = 0
	home = 0
	game_hash[:away][:players].each do |player_hash|
		away += player_hash[:points]
	end
	game_hash[:home][:players].each do |player_hash|
		home += player_hash[:points]
	end
	if away > home
		"Charlotte Hornets"
	elsif home > away 
		"Brooklyn Nets"
	else 
		"tie"
	end
end

def player_with_longest_name
	all_players = players_array(game_hash)
	player_name = ""
	name_length = 0
	all_players.each do |player_hash|
		longest_name = player_hash[:player_name].length
		if longest_name > name_length
			player_name = player_hash[:player_name]
			name_length = longest_name
		end
	end
	player_name
end

def long_name_steals_a_ton?
	all_players = players_array(game_hash)
	player_name = ""
	steals = 0
	all_players.each do |player_hash|
		most_steals = player_hash[:steals]
		if most_steals > steals
			player_name = player_hash[:player_name]
			steals = most_steals
		end
	end
	if player_name = player_with_longest_name
		true
	else
		false
	end
end


# def long_name_steals_a_ton?
# player_name = ""
# steals = 0
# 		game_hash.each do |team, team_information|
# 			team_information[:players].each do |player, player_stat|
# 				most_steals = player_stat[:steals]
# 				if 	most_steals > steals
# 					player_name = player
# 					steals = most_steals
# 				end
# 			end
# 		end
# 	if player_name = player_with_longest_name
# 		true 
# 	else
# 		false
# 	end
# end







