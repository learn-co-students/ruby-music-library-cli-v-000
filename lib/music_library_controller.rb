class MusicLibraryController

  attr_accessor :songs
  def initialize(path = './db/mp3s')
     @songs = MusicImporter.new(path).import
    #  if gets.strip = "list songs"
    #    self.list_songs
    #  end
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    user_input = ""

    while user_input != "exit"
      user_input = gets.strip
      if user_input == "list songs"
         self.list_songs
      elsif user_input == "list artists"
        self.list_artists
      elsif user_input == "list genres"
        self.list_genres
      elsif user_input == "list artist"
        self.list_songs_by_artist
      elsif user_input == "list genre"
        self.list_songs_by_genre
      elsif user_input == "play song"
        self.play_song
       end
    end

  end

  def list_songs
    sorted  = @songs.sort_by { |s| s.split(" - ")[1]}
    sorted.each_index {|x| puts "#{x + 1}. #{sorted[x].split(" - ")[0]} - #{sorted[x].split(" - ")[1]} - #{sorted[x].split(" - ")[2].split(".")[0]}"}
  end

  def list_artists
    sorted  = Artist.all.sort_by {|s| s.name}
    sorted = sorted.uniq {|s| s.name}
    sorted.each_index {|x| puts "#{x + 1}. #{sorted[x].name}"}
    # sorted  = @songs.sort_by { |s| s.split(" - ")[0]}.uniq {|s| s.split(" - ")[0]}
    # # sorted = sorted.uniq {|s| s.split(" - ")[0]}
    # sorted.each_index {|x| puts "#{x + 1}. #{sorted[x].split(" - ")[0]}"}
  end

  def list_genres
    sorted  = Genre.all.sort_by {|s| s.name}
    sorted = sorted.uniq {|s| s.name}
    sorted.each_index {|x| puts "#{x + 1}. #{sorted[x].name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    user_input = gets.strip

    sorted  = Artist.all.sort_by {|s| s.name}
    names = sorted.collect {|x| x.name}

    if names.include?(user_input)
      selected = sorted.select {|a| a.name == user_input}
      selected = selected[0].songs.collect {|s| "#{s.name} - #{s.genre.name}"}
      selected = selected.sort
      selected.each_index {|x| puts "#{x + 1}. #{selected[x]}"}
    end

    # while !sorted.include?(user_input)
    #   user_input = gets.strip
    # end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"

    user_input = gets.strip

    sorted  = Genre.all.sort_by {|s| s.name}
    names = sorted.collect {|x| x.name}


    if names.include?(user_input)
      selected = sorted.select {|a| a.name == user_input}
      selected = selected[0].songs.collect {|s| "#{s.artist.name} - #{s.name}"}
      selected = selected.sort_by { |s| s.split(" - ")[1]}
      selected.each_index {|x| puts "#{x + 1}. #{selected[x]}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip
    list = @songs.sort_by { |s| s.split(" - ")[1]}

    if user_input.to_i >= 1 && user_input.to_i <= list.length
      puts "Playing #{list[user_input.to_i - 1].split(" - ")[1]} by #{list[user_input.to_i - 1].split(" - ")[0]}"
    end
  end


end
