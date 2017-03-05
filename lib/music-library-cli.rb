require 'pry'
class MusicLibraryController
attr_accessor :path

  def initialize(path= './db/mp3s') #creates new instance with default path, calls instance of MusicImporter on path, then calls the #import func
    import_instance = MusicImporter.new(path)
    import_instance.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library! Type 'exit' to quit, or check the list of commands with 'cmds'."

      input = gets.strip

      case input

      when "cmds"
        cmds
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        artist_songlist
      when "list genre"
        genre_songlist
      when "play song"
        play_song
      end
    end
  end

      def cmds
        puts "list songs, list artists, list genres, list artist, list genre, play song"
      end

      def songs #Oh my fuck. They've been fucking supplying it in the spec. Jesus Christ.
        count = 0; Song.all.each.sort {|song| puts ("#{count +=1}. ") + song.artist.name + " - " + song.name + " - " + song.genre.name}
      end

      def artists
        Artist.all.each {|artist| puts artist.name}
      end

      def genres
        Genre.all.each {|genre| puts genre.name}
      end

      def play_song
        Song.all.each {|song| puts "Playing " + (song.artist.name + " - " + song.name + " - " + song.genre.name)}
      end

      def artist_songlist
        puts Artist.all.each {songs} #didn't expect that to work. Now I see why it does. Completely by accident. This makes like, no sense.
      end

      def genre_songlist
        puts Genre.all.each {|genre| songs}
      end
end
