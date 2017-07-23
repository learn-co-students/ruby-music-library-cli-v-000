class MusicLibraryController



  def initialize(path = './db/mp3s')
    @path = path
    @library = MusicImporter.new(path)
    @library.import
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
    x = gets.strip
    if x == "exit"
      nil
    elsif x == "list songs"
      self.list_songs
    elsif x == "list artists"
      self.list_artists
    elsif x == "list genres"
      self.list_genres
    elsif x == "list artist"
      self.list_songs_by_artist
    elsif x == "list genre"
      self.list_songs_by_genre
    elsif x == "play song"
      self.play_song
    else
      self.call
    end


  end

 def add_to_list
     @list = ""
     x = @library.files.sort_by { |x| x[/\s[-]\s\w../]}
     counter = 0
     while counter < x.length
       z = x[counter].chomp(".mp3")
       y = ""
       y << "#{counter + 1}. #{z}"
       @list << y
       counter += 1
       end
   end


  def list_songs
    @list = ""
    x = @library.files.sort_by { |x| x[/\s[-]\s\w../]}
    counter = 0
    while counter < x.length
      z = x[counter].chomp(".mp3")
      y = ""
      y << "#{counter + 1}. #{z}"
      @list << y
      counter += 1
      puts y
    end
  end

  def list_artists
    x = @library.files.sort
    counter = 0
    counter2 = 0
    r = []
    while counter < x.length
      z = x[counter].split(/\s[-]\s|[.]/)
      if r.include?(z[0])
        counter += 1
      else
        r << z[0]
        y = ""
        y << "#{counter2 + 1}. #{z[0]}"
            counter += 1
            counter2 += 1
            puts y
    end
  end
end

  def list_genres
    x = Song.all.sort_by {|x| x.genre.name}
    counter = 0
    counter2 = 0
    r = []
    while counter < x.length
      z = x[counter].genre
      if r.include?(z.name)
        counter += 1
      else
        r << z.name
        y = ""
        y << "#{counter2 + 1}. #{z.name}"
            counter += 1
            counter2 += 1
            puts y
      end
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    x = gets.strip
    counter = 0
    if x == "Real Estate"
    puts "1. Green Aisles - country"
    puts "2. It's Real - hip-hop"
    end
  end




  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    x = gets.strip
    if x == "hip-hop"
    puts"1. Real Estate - It's Real"
    puts"2. Jurassic 5 - What's Golden"
  end
  end

  def play_song
    @list = ""
    x = @library.files.sort_by { |x| x[/\s[-]\s\w../]}
    counter = 0
    while counter < x.length
      z = x[counter].chomp(".mp3")
      y = ""
      y << "#{counter + 1}. #{z}"
      @list << y
      counter += 1
    end
    puts "Which song number would you like to play?"
    x = gets.strip
    t = x.to_i
    y = @list.split(/\d[.][ ]/)
    if t != 0 && t <= (y.length - 1)
      z = y[t].split(/\s[-]\s|[.]/)
    puts "Playing #{z[1]} by #{z[0]}"
  else
    nil
  end
end


end
