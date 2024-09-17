class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(self.path)
    music_importer.import
    music_importer
  end

  def call
    puts "Welcome to your Music Library. What would you like to do today?\nChoose:\n-list artists\t-list songs\t-list genres\n-list artist\t-list genre\t-play song\t-exit"
    input = ""

    until input == "exit"
      selection = gets.strip

      case selection 
        when "list artists"
          Artist.all.each{|a| puts "#{a.name}"}
        when "list songs"
          Song.all.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
        when "list genres"
          Genre.all.each{|g| puts "#{g.name}"}
        when "list artist"
          puts "Which artist?"
          artist = gets.strip
          artist = Artist.find_or_create_by_name(artist)
          artist.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
        when "list genre"
          puts "Which genre?"
          genre = gets.strip
          genre = Genre.find_or_create_by_name(genre)
          genre.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
        when "play song"
          puts "Which song?"
          song = gets.strip

          if song.to_i.is_a?(Fixnum) && song.to_i != 0
            song = song.to_i
            song = Song.all[song-1]
          else
            song = Song.find_or_create_by_name(song)
          end
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
      input = selection
    end
  end
end