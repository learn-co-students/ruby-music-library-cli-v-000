class MusicLibraryController

  attr_reader :path, :importer

  def initialize(file_path = "./db/mp3s")
    @path = file_path
    @importer = MusicImporter.new(@path)
    @importer.import
  end

  def call
    puts "Welcome to music library. What would you like to do?\n
    list songs\n
    list genres\n
    play song\n
    list artist\n
    list genre\n
    "
    input = gets.chomp

      if input == "list songs"
        self.list_songs
        self.call
      elsif input == "list artists"
        self.list_artists
        self.call
      elsif input == "list genres"
        self.list_genres
        self.call
      elsif input == "play song"
        self.play_song
        self.call
      elsif input == "list artist"
        self.list_artist
        self.call
      elsif input == "list genre"
        self.list_genre
        self.call
      else
        self.call unless input == "exit"
      end

  end

  def list_songs
    counter = 0
    until counter >= @importer.files.size
      sorted_files = @importer.files.sort
      puts "#{counter+1}. #{sorted_files[counter].split(".").first}"
      counter +=1
    end
  end

  def list_artists
    Artist.all.each {|artist| puts "-#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    puts "Which song would you like to play?"
    input = gets.chomp.to_i
    puts "Playing #{@importer.files.sort[input - 1].split(".mp3").first}"
  end

  def list_artist
    puts "Which artist's songs would you like to see?"
    input = gets.chomp
    @importer.files.each do |f|
      if f.include?(input)
        puts "#{f.split(".mp3").first}"
      end
    end
  end

  def list_genre
    puts "Which genre's songs would you like to see?"
    input = gets.chomp
    @importer.files.each do |f|
      if f.include?(input)
        puts "#{f.split(".mp3").first}"
      end
    end
  end



end
