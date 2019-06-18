require 'pry'
require 'byebug'

def game_hash 
	{
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
				"Alan Anderson" => {
					number: 0,
					shoe: 16, 
					points: 22,
					rebounds: 12,
					assists: 12,
					steals: 3,
					blocks: 1,
					slam_dunks: 1
									}, 
				"Reggie Evans" => {
					number: 30,
					shoe: 14, 
					points: 12,
					rebounds: 12,
					assists: 12,
					steals: 12,
					blocks: 12,
					slam_dunks: 7
									}, 
				"Brook Lopez" => {
					number: 11,
					shoe: 17, 
					points: 17,
					rebounds: 19,
					assists: 10,
					steals: 3,
					blocks: 1,
					slam_dunks: 15
									}, 
				"Mason Plumlee" => {
					number: 1,
					shoe: 19, 
					points: 26,
					rebounds: 11,
					assists: 6,
					steals: 3,
					blocks: 8,
					slam_dunks: 5
									},
				"Jason Terry" => {
					number: 31,
					shoe: 15, 
					points: 19,
					rebounds: 2,
					assists: 2,
					steals: 4,
					blocks: 11,
					slam_dunks: 1
								},
			},
		},
		
	
	away: {
		team_name: "Charlotte Hornets",
		colors: ["Turquoise", "Purple"],
		players: {
				"Jeff Adrien" => {
					number: 4,
					shoe: 18, 
					points: 10,
					rebounds: 1,
					assists: 1,
					steals: 2,
					blocks: 7,
					slam_dunks: 2
								}, 
				"Bismack Biyombo" => {
					number: 0,
					shoe: 16, 
					points: 12,
					rebounds: 4,
					assists: 7,
					steals: 22,
					blocks: 15,
					slam_dunks: 10
								}, 
				"DeSagna Diop" => {
					number: 2,
					shoe: 14, 
					points: 24,
					rebounds: 12,
					assists: 12,
					steals: 4,
					blocks: 5,
					slam_dunks: 5
								}, 
				"Ben Gordon" => {
					number: 8,
					shoe: 15, 
					points: 33,
					rebounds: 3,
					assists: 2,
					steals: 1,
					blocks: 1,
					slam_dunks: 0
								},
				"Kemba Walker" => {
					number: 33,
					shoe: 15, 
					points: 6,
					rebounds: 12,
					assists: 12,
					steals: 7,
					blocks: 5,
					slam_dunks: 12
								},

				},
			},
	}			
end

def num_points_scored(name)
	game_hash.each do |team, team_information|
		team_information[:players].each do |player_name, player_stat|
			if name == player_name
				return player_stat[:points]
			end
		end
	end
end

def shoe_size(name) 
	game_hash.each do |team, team_info|
		team_info[:players].each do |player_name, player_stat|
			if name == player_name
				return player_stat[:shoe]
			end
		end
	end

end

def team_colors(name_of_team)
	game_hash.each do |team, team_info|			
		if name_of_team == team_info[:team_name]
			return team_info[:colors]
		end
	end
end

def team_names
	array_of_team_names = []
	game_hash.each do |team, team_info|
		array_of_team_names.push(team_info[:team_name])
	end
	return array_of_team_names
end

def player_numbers(name_of_team)
	array_of_jersey_numbers = []
	game_hash.each do |team, team_information|
		if name_of_team == team_information[:team_name]
			team_information[:players].each do |player_name, player_stat|
			array_of_jersey_numbers.push(player_stat[:number])
			end
		end
	end
	return array_of_jersey_numbers
end

def player_stats(name)
	game_hash.each do |team, team_information|
		team_information[:players].each do |player_name, player_stat|
			if name == player_name
				return player_stat
			end
		end
	end
end

def big_shoe_rebounds
	home_or_away = ""
	player_name = ""
	shoe_size = 0 
	game_hash.each do |team, team_information|
		team_information[:players].each do |player, player_stat|
			current_shoe_size = player_stat[:shoe]
			if current_shoe_size > shoe_size
				home_or_away = team 
				player_name = player
				shoe_size = current_shoe_size
			end
		end
	end
	game_hash[home_or_away][:players][player_name][:rebounds]
end

def most_points_scored
	player_name = ""
	points_scored = 0
	game_hash.each do |team, team_information|
		team_information[:players].each do |player, player_stat|
			current_point_leader = player_stat[:points]
			if current_point_leader > points_scored
				player_name = player
				points_scored = current_point_leader
			end
		end
	end
	player_name
end

def winning_team
	away_total = 0
	home_total = 0 
	game_hash[:away][:players].each do |player, stats|
		away_total += stats[:points]
	end
	game_hash[:home][:players].each do |player, stats|
		home_total += stats[:points]
	end
	if away_total > home_total
		return "Charlotte Hornets"
	elsif home_total > away_total
		return "Brooklyn Nets"
	else 
		"Tie"
	end
end

def player_with_longest_name
	player_name = ""
	name_length = 0
	game_hash.each do |team, team_information|
		team_information[:players].each do |player, player_stat|
		longest_name = player.length
			if longest_name > name_length
				player_name = player
				name_length = longest_name
			end
		end
	end
	player_name
end

def long_name_steals_a_ton?
player_name = ""
steals = 0
	game_hash.each do |team, team_information|
		team_information[:players].each do |player, player_stat|
			most_steals = player_stat[:steals]
			if 	most_steals > steals
				player_name = player
				steals = most_steals
			end
		end
	end
		if player_name = player_with_longest_name
			true 
		else
			false
		end
end







