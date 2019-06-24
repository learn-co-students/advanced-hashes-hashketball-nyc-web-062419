require "pry"
# Write your code here!
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
	game_hash.each do |place, team|
		team[:players].each do |attribute, data|
			if name == attribute
				return data[:points]
			end
		end
	end
end

def shoe_size(name) 
	game_hash.each do |place, team|
		team[:players].each do |attribute, data|
			if name == attribute
				return data[:shoe]
			end
		end
	end
end

def team_colors(name_of_team)
	game_hash.each do |place, team|			
		if name_of_team == team[:team_name]
			return team[:colors]
		end
	end
end

def team_names
	array_of_team_names = []
	game_hash.each do |place, team|
		array_of_team_names.push(team[:team_name])
	end
	return array_of_team_names
end

def player_numbers(name_of_team)
	array_of_jersey_numbers = []
	game_hash.each do |place, team|
		if name_of_team == team[:team_name]
			team[:players].each do |attribute, data|
			array_of_jersey_numbers.push(data[:number])
			end
		end
	end
	return array_of_jersey_numbers
end

def player_stats(name)
	game_hash.each do |place, team|
		team[:players].each do |attribute, data|
			if name == attribute
				return data
			end
		end
	end
end

def big_shoe_rebounds
	home_or_away = ""
	player_name = ""
	shoe_size = 0 
	game_hash.each do |place, team|
		team[:players].each do |attribute, data|
			current_shoe_size = data[:shoe]
			if current_shoe_size > shoe_size
				home_or_away = place
				player_name = attribute
				shoe_size = current_shoe_size
			end
		end
	end
	game_hash[home_or_away][:players][player_name][:rebounds]
end

def most_points_scored(name)
end

def winning_team(teamname)
end

def player_with_longest_name(name)
end

def long_name_steals_a_ton?(name)
end










