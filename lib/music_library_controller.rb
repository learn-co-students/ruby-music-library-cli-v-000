class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    import_path = MusicImporter.new(path)
    import_path.import
  end
  
  def call
    input = nil
    all_songs = Song.all.sort{|a,b| a.artist.name <=> b.artist.name}
    all_artists = Artist.all.collect{|artist| artist.name}
    all_genres = Genre.all.collect{|genre| genre.name}

    while input != "exit"
      input = gets.strip
      
      case input
      when "list songs"
        all_songs.each{|song| puts "#{all_songs.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      
      when "list artists"
       all_artists.each{|artist| puts artist}

      when "list genres"
        all_genres.each{|genre| puts genre}

      when "play song"
        puts "Which track would you like to play?"
        input = gets.strip.to_i
        song = all_songs[input-1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

      when all_artists.select{|a| a == input}[0]
        Artist.find_by_name(input).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      when all_genres.select{|g| g == input}[0]
        Genre.find_by_name(input).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end  
end