# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ['Black', 'White'],
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
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: %w[Turquoise Purple],
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
        }
      ]
    }
  }
end

# Brute Force 
game_hash[:home]
game_hash[:home][:colors][0] # Gets the string "black" from the array
game_hash[:home][:colors][1] # Gets the string "black" from the array

game_hash.each do |

# Write code here, I need to put everything below in classes it's disgusting to look at

# Points Scored function
def num_points_scored(compare_playerName)
  # Home Team map function
  game_hash[:home][:players].map do |player|
    return player[:points] if compare_playerName == player[:player_name]
  end

  # Away Team Map function ^ Combine the two to reduce abstraction
  game_hash[:away][:players].map do |player|
    return player[:points] if compare_playerName == player[:player_name]
  end
end

# Shoe Size function
def shoe_size(compare_playerName)
  # Home Team map function
  game_hash[:home][:players].map do |player|
    return player[:shoe] if compare_playerName == player[:player_name]
  end

  # Away Team Map function ^ Combine the two to reduce abstraction
  game_hash[:away][:players].map do |player|
    return player[:shoe] if compare_playerName == player[:player_name]
  end
end

#Team Colors function
def team_colors(compare_teamName)
  # Home Team Colors fetch statement
  return game_hash[:home][:colors] if compare_teamName == game_hash[:home][:team_name]

  # Away Team Colors fetch statement
  return game_hash[:away][:colors] if compare_teamName == game_hash[:away][:team_name]
end

#Team Names function ALWAYS CHECK YOUR DAMN FUNCTION NAMES JONNY
def team_names
  array_teamNames = []
  #Team Names Grabbers
  game_hash.each do |teamNames, teamKeys|
    array_teamNames << teamKeys[:team_name]
  end

  array_teamNames
end

# #Team Names function
# def team_names
#   array_teamNames = []

#   #Team Names Grabbers
#     game_hash.each do |t, teamNameFinder|
#       # puts teamNameFinder
#       if teamNameFinder == game_hash[:home] || teamNameFinder == game_hash[:away]
#         array_teamNames << teamNameFinder[:team_name]
#       end

#     end

#   return array_teamNames
# end

# Points Scored function
def player_numbers(compare_playerName)
  # Home Team map function
  game_hash[:home][:players].map do |player|
    return player[:number] if compare_playerName == player[:player_name]
  end

  # Away Team Map function ^ Combine the two to reduce abstraction
  game_hash[:away][:players].map do |player|
    return player[:number] if compare_playerName == player[:player_name]
  end
end

# Team Numbers Function
def player_numbers(compare_playerTeam)
  teamNumbers = []

  #Team Names Grabbers
  game_hash.each do |t, teamNameFinder|
    if teamNameFinder[:team_name] == compare_playerTeam
      teamNameFinder[:players].each do |p, players|
        teamNumbers << p[:number]
      end
    end
  end

  return teamNumbers
end

# Player Stats Function
def player_stats(compare_playerName)
    # Home Team map function
  game_hash[:home][:players].map do |player|
    return player if compare_playerName == player[:player_name]
  end

  # Away Team Map function ^ Combine the two to reduce abstraction
  game_hash[:away][:players].map do |player|
    return player if compare_playerName == player[:player_name]
  end
end

# Big Shoe Rebounds Function
def big_shoe_rebounds
  # playerShoeSort
  game_hash.each do |tKey, team|
    team[:players].each do |pKey, players|
      # puts pKey[:shoe]
      if pKey[:shoe] == playerShoeSort
        return pKey[:rebounds]
      end
    end
  end
end

# Shoe Sort Function Need to Abstract 
def playerShoeSort
  playerCollection = []
  shoeSize = []

  # Shovel All Players into an array
  game_hash.each do |tKey, team|
    team[:players].each do |pKey, players|
      playerCollection  << pKey
    end
  end

  # Iterate over each shoe size and sort by highest value
  i = 0
  while shoeSize.length < playerCollection.length
    shoeSize << playerCollection[i][:shoe]
    i += 1
  end

  # Sort Shoe Sizes
  sortedShoeSize = shoeSize.sort.reverse

  return sortedShoeSize[0]
end