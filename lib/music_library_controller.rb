class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    user_input = gets.chomp
    while user_input != "exit"
      user_input = gets.chomp
    end

    def output(input)
       case input
       when "list songs"
           self.list_songs
         when "list artists"
           self.list_artists
         when "list genres"
           self.list_genres
         when "play song"
           self.play_song
         when "list artist"
           self.list_artist
         when "list genre"
           self.list_genre
       end
     end
   end
 end
