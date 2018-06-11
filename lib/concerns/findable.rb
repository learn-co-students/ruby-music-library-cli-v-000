module Concerns
  module Findable 
    
    #@@all = []
    
    def find_by_name(name)
    x = nil 
    all.each do |song|
      if song.name == name 
        x = song 
      end 
    end 
    x
  end 
  
  def find_or_create_by_name(name) 
    if find_by_name(name) == nil 
      create(name)
    else 
      find_by_name(name)
    end 
    
  end 
  end 
  
  def alpha_songs 
    count = 1
    songName = []
    finalSongArray = []
    songObArray = Song.all 
    
    songObArray.map do |songInstance|
      songName << songInstance.name 
    end 
    songName = songName.sort
    
    songName.map do |name|
      songObArray.map do |songInstance|
        if name == songInstance.name 
          songName = songInstance.name 
          songArtistOb = songInstance.artist
          songArtist = songArtistOb.name
          songGenreOb = songInstance.genre 
          songGenre = songGenreOb.name
          songInfo = "#{songArtist} - #{songName} - #{songGenre}"
          finalSongArray << songInfo
        end 
      end 
    end 
    finalSongArray
  end 
end 