require 'pry'

def game_hash
  game_hash = {
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
          "Reggie Evans"=> {
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
          "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
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
          "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
home_team = ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"]
away_team = ["Jeff Adrien", "Bismak Biyombo", "DeSagna Diop", "Ben Gordon", "Brendan Haywood"]
if home_team.include?(name)
output = game_hash[:home][:players][name][:points]
puts "#{output}"
output
elsif away_team.include?(name)
output = game_hash[:away][:players][name][:points]
puts "#{output}"
output
end
end

def shoe_size(name)
home_team = ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"]
away_team = ["Jeff Adrien", "Bismak Biyombo", "DeSagna Diop", "Ben Gordon", "Brendan Haywood"]
if home_team.include?(name)
output = game_hash[:home][:players][name][:shoe]
puts "#{output}"
output
elsif away_team.include?(name)
output = game_hash[:away][:players][name][:shoe]
puts "#{output}"
output
end
end

def team_colors(team_name)
if team_name == game_hash[:away][:team_name]
game_hash[:away][:colors]
elsif game_hash[:home][:team_name]
game_hash[:home][:colors]
end
end

def team_names
team1 = game_hash[:away][:team_name]
team2 = game_hash[:home][:team_name]
names_array = []
names_array.push(team1)
names_array.push(team2)
names_array
end


def player_numbers(team_name)
home_team = ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"]
away_team = ["Jeff Adrien", "Bismak Biyombo", "DeSagna Diop", "Ben Gordon", "Brendan Haywood"]
if team_name == "Brooklyn Nets"
numbers_array = []
home_team.each do |team_names|
number = game_hash[:home][:players][team_names][:number]
numbers_array.push(number)
end
elsif team_name == "Charlotte Hornets"
numbers_array = []
away_team.each do |namz|
number = game_hash[:away][:players][namz][:number]
numbers_array.push(number)
end
end
numbers_array
end

def player_stats(player_name)
home_team = ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"]
away_team = ["Jeff Adrien", "Bismak Biyombo", "DeSagna Diop", "Ben Gordon", "Brendan Haywood"]
if home_team.include?(player_name)
output = game_hash[:home][:players][player_name]
puts "#{output}"
output
elsif away_team.include?(player_name)
output = game_hash[:away][:players][player_name]
puts "#{output}"
output
end
end

def big_shoe_rebounds
biggest_shoe = 0
biggest_shoe_rebounds = 0
helper.each do |player_stats|
  if player_stats[:shoe] > biggest_shoe
    biggest_shoe = player_stats[:shoe]
    biggest_shoe_rebounds = player_stats[:rebounds]
  end
end    
end



def helper
new_array = []
game_hash.each do |home_or_away, team_info|
  team_info[:players].each do |name, stats|
    new_array.push(stats)
  end
end
new_array
binding.pry
end

helper()
