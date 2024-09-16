require 'pry'
class MusicLibraryController
  attr_accessor :path, :lib
  def initialize(path='./db/mp3s')
    @path=path
    m=MusicImporter.new(self.path)
    @lib=m.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    x=gets.strip 
    if ['list songs','list artists','list genres','list artist','list genre','play song','exit'].include?(x)==FALSE 
      self.call
    elsif x=='list songs'
      self.list_songs
    elsif x=='list artists'
      self.list_artists
    elsif x=='list genres'
      self.list_genres
    elsif x=='list artist'
      self.list_songs_by_artist
    elsif x=='list genre'
      self.list_songs_by_genre
    elsif x=='play song'
      self.play_song  
    end
  end
  
  def list_songs
    l=self.lib
    l.sort_by!{|x| x.name}
    l.each{|s| puts "#{l.index(s)+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end 
  
  def list_artists
    list=self.lib
    l=Artist.all
    list.each{|x| l<< x.artist if l.include?(x.artist)==FALSE}
    l.sort_by!{|x| x.name}
    l.each{|s| puts "#{l.index(s)+1}. #{s.name}"}
  end
  
  def list_genres
    l=Genre.all
    list=self.lib
    list.each{|x| l<< x.genre if l.include?(x.genre)==FALSE}
    l.sort_by!{|x| x.name}
    l.each{|s| puts "#{l.index(s)+1}. #{s.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name=gets.strip
    l=self.lib + Song.all
    #l.sort_by!{|x| x.name}
    a=[]
    l.each{|s| a << s if s.artist.name==name and a.include?(s)==FALSE}
    a.sort_by!{|x| x.name}
    a.each{|s| puts "#{a.index(s)+1}. #{s.name} - #{s.genre.name}"}
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name=gets.strip
    l=self.lib 
    l.select!{|s| s.genre.name==name}
    l.each{|s| puts "#{l.index(s)+1}. #{s.artist.name} - #{s.name}"}
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    #self.list_songs 
    num=gets.strip.to_i
    l=self.lib #+ Song.all
    l.sort_by!{|x| x.name}
    if l[num]!=nil and num!=0
      #self.play_song 
    #else 
      #=l.select{|s| s.name==name}
      puts "Playing #{l[num-1].name} by #{l[num-1].artist.name}"
    end
  end
      
  #binding.prys
end 








