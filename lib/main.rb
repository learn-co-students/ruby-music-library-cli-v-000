class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name,artist,genre)
    @name = name
    @genre = genre
    @artist = artist
    @@all << self
  end
  def self.all
    @@all
  end

  #def self.list_songs
   # songs_sorted_by_name = self.all.sort_by do |song|
    #  song.name
    #end
    #songs_sorted_by_name.each_with_index do |song,index|
      #puts "#{index+1}. #{song.artist} - #{song.name} - #{song.genre}"
    #end
  #end


end

class MusicLibraryController
  
  def list_songs()

    @all_songs = Song.all
    songs_sorted_by_name = @all_songs.sort_by do |song|
      song.name
    end
    songs_sorted_by_name.each.with_index(1) do |song,index|
          puts "#{index}. #{song.artist} - #{song.name} - #{song.genre}"
        end
  end
=begin
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist} - #{s.name} - #{s.genre}"
      end

=end
end

#purple_rain = Song.new("purple rain","prince","pop")
#bold_as_love = Song.new("bold as love","hendrix","rock")
#malted_milk = Song.new("malted milk","robert johnson","blues")

for_love_i_come = Song.new("For Love I Come", "Thundercat", "dance")
green_aisles = Song.new("Green Aisles", "Real Estate", "country")
its_real = Song.new("It's Real", "Real Estate", "hip-hop")
larry_csonka = Song.new("Larry Csonka","Action Bronson", "indie")
whats_golden = Song.new("What's Golden", "Jurassic 5", "hip-hop")

#new_controller = MusicLibraryController.new
#new_controller.list_songs

def play_song
  list_of_songs =  Song.all.sort{ |a, b| a.name <=> b.name }

  music_controller = MusicLibraryController.new
  music_controller.list_songs
  puts "Which song number would you like to play?"
  input = gets.strip.to_i
  #if (input > 0) && (input <= list_of_songs.size)
  #if (input > 0) && (input <= list_of_songs.size) 
  if (1..Song.all.length).include?(input)
    song = list_of_songs[input-1]
    puts "Playing #{song.name} by #{song.artist}"
  end
end


