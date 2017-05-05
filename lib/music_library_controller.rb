class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    musiclibrary = MusicImporter.new(@path)
    musiclibrary.import
  end

  def call
    puts "Hello, where would you like to go?"
    user_input = gets.chomp
    if user_input != "exit"
      cli(user_input)
      call
    else
      puts "Good Bye"
    end
  end

  def cli(user_input)

    case user_input
    when "list songs"
      Song.all.each_with_index do |song, idx|
        puts "#{idx+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

    when "list artists"
      Artist.all.each do |artist|
        puts "#{artist.name}"
      end

    when "list genres"
      Genre.all.each do |genre|
        puts "#{genre.name}"
      end

    when "play song"
      puts "Which song number would you like to listen?"
      i = gets.chomp
      Song.all.each_with_index do |song, idx|
        if i.to_i == idx+1
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end


    when "list artist"
      puts "Please enter the artist name"
      i = gets.chomp
      Artist.all.each do |artist|
        if i == artist.name
          artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end

  when "list genre"
    puts "Which genre would you like to listen?"
    i = gets.chomp
    Genre.all.each do |genre|
      if i == genre.name
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
end

end
