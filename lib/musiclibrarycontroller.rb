class MusicLibraryController
  def initialize(path="./db/mp3s")
    m = MusicImporter.new(path)
    return m.import
  end

  def call
    #puts "Welcome to the music library!"
    #puts "Please choose from the following options:"
    #puts "'list songs', 'play song', 'list artists', 'list artist', 'list genres', 'list genre', 'exit'"
    good_choice = false
    while good_choice == false
      choice = gets.chomp
      case choice
      when 'list songs'
        Song.list_all
      when 'play song'
        song_number = gets.chomp
        Song.play_song(song_number.to_i)
      when 'list artists'
        Artist.list_all
      when 'list artist'
        my_artist = gets.chomp
        Artist.list_artist(my_artist)
      when 'list genres'
        Genre.list_all
      when 'list genre'
        my_genre = gets.chomp
        Genre.list_genre(my_genre)
      when 'exit'
    #    puts 'stage left!'
        good_choice=true
      else
    #    puts 'Please choose a valid option.'
      end
    end
  end

end
