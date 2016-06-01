class MusicLibraryController

  attr_accessor :path
  attr_reader :importer

  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    while self.path != 'exit'
      self.path = gets.strip
      case self.path
      when 'list songs'
        @importer.files.each_with_index{|song, i| puts "#{i + 1}. #{song.split(".")[0]}"}
      when 'list artists'
        @importer.files.each{|song| puts "#{song.split(" - ")[0]}"}
      when 'list genres'
        @importer.files.each{|song| puts "#{song.split(" - ")[2].split(".")[0]}"}
      when 'play song'
        play_song
      when 'list artist'
        list_artist
      when 'list genre'
        list_genre
      end  
    end
  end

  def play_song
    puts "Which song number?"
    song_num = gets.strip
    puts "Playing #{@importer.files[song_num.to_i - 1]}"
  end

  def list_artist
    puts "Which artist?"
    artist_name = gets.strip
    @importer.files.select {|file| file.split(" - ")[0] == artist_name}.each {|song| puts song}
  end

  def list_genre
    puts "Which genre?"
    genre_name = gets.strip
    @importer.files.select {|file| file.split(" - ")[2].split('.')[0] == genre_name}.each {|song| puts song}
  end

end
