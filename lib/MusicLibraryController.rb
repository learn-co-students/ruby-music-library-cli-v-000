class MusicLibraryController

  attr_reader :path, :music

  def initialize(path='./db/mp3s' )
    @path = path
    importer = MusicImporter.new(path)
    @music = importer.import
  end

  def call(input = '')
    puts "Please enter an input"
    while input != 'exit'
      input = gets.chomp

      action(input)
    end
  end

  def action(input)
    #check if user/tests entered an artist name
    if Artist.find_by_name(input)
        artist_songs(input)
    end
    if Genre.find_by_name(input)
        genre_songs(input)
    end   
    input = input.split(' ').join('_')
    decision = input.to_sym
    if self.respond_to?(decision)
      self.send(decision)
    end
  end

  def list_artists
    music_sort.each {|song| puts "#{song.artist.name}"}
  end

  def artist_songs(name)
      music_sort.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if name == song.artist.name}
  end 
  
  def list_songs
    music_sort.each_with_index {|song, idx| puts "#{idx+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genres
    music_sort.each {|song| puts "#{song.genre.name}"}
  end
  
  def genre_songs(name)
    music_sort.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if name == song.genre.name}
  end
  
  def music_sort
    @music.sort! {|a, b| a.artist.name <=> b.artist.name }
  end

  def play_song
    idx_to_play = gets.chomp
    index = idx_to_play.to_i - 1
    music_sort.each_with_index {|song, idx| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}" if idx == index  }
  end


end
