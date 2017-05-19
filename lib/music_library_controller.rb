class MusicLibraryController

  attr_accessor :files


  def initialize(path="./db/mp3s")
    # binding.pry
    importer = MusicImporter.new(path)
    importer.import
    @files = importer.files
  end

  def call
    input = ""

    puts "Welcome to the Music Library"
    puts "Please input information:"
    while input != "exit" do

      input = gets.strip

      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        puts "Please input song number:"
        input = gets.strip
        play_song(input)
      when "list artist"
        puts "Please input artist:"
        input = gets.strip
        list_artist(input)
      when "list genre"
        puts "Please input genre:"
        input = gets.strip
        list_genre(input)
      end

    end
  end


  def songs
    self.files.to_enum.with_index(1).each do |elem, i|
       puts "#{i}. #{elem}"
    end
  end

  def artists
    Song.all.each {|i| puts "#{i.artist.name}"}
  end

  def genres
    Song.all.each {|i| puts "#{i.genre.name}"}
  end

  def play_song(input)
    puts "Playing #{self.files[input.to_i-1][0..-4]}"
  end

  def list_artist(input)
    input = Artist.all.detect{|a| a.name == input}
    input.songs.each {|i| puts "#{input.name} - #{i.name} - #{i.genre.name}"}
  end

  def list_genre(input)
     input = Genre.all.detect{|a| a.name == input}
     input.songs.each {|i| puts "#{i.artist.name} - #{i.name} - #{input.name}"}
  end

end
