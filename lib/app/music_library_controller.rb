class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    
    puts "What would you like to do?"
    input = gets.strip.downcase
    while input != "exit"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end    
  end
  
    def songs
      Song.name.all.each.with_index(1) do |song, index|
        puts "#{index}. #{song}"
      end
    end

    def artists
      Artist.all.each.with_index(1) {|a, i|
        puts "#{i}. #{a}"}
      end

      def genres
        Genre.all.each.with_index(1){|g, i|
        puts "#{i}. #{g}"}
      end

      def list_artist
        puts "Which artist would you like to list songs for?"
        artist_input = gets.strip
        if artist= Artist.find_by_name(artist_input)
          artist.songs.each {|song,i|
          puts "#{i}. #{song}"}
      end

      def list_genre
    puts "What genre by name you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each {|s,i|
        puts "#{i}. #{s}"}
      end
    end
  end
end
