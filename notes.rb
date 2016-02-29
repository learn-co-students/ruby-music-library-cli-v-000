rspec spec/001_song_basics_spec.rb

rspec spec/002_artist_basics_spec.rb 

rspec spec/003_genre_basics_spec.rb 

rspec spec/004_songs_and_artists_spec.rb

#################################





#################################





#################################

+  def add_song(song)
 +    if song.artist != self
 +      song.artist = self
 +    end
 +    if !@songs.include?(song)
 +      self.songs.push(song)
 +    end
 +  end



#################################

  def add_song(song, *artist)
    if @@all.detect(song.artist)
      song.artist = artist
        @songs << song
    else self.create(artist)
      song.artist = artist
        @songs << song
    end
  end

#################################

   if songs.include?(song) == false && @@all.include?(song.name) == false;
      @songs << song
      song.artist = self

#################################

   def add_song(song)
     if song.artist != self
       song.artist = self
     end
     if !@songs.include?(song)
       self.songs.push(song)
     end
   end

#################################
def add_song(song)
   if songs.include?(song) == false && @@all.include?(song.name) == false;
      
      song.artist.name = Artist.new(name)
      @songs << song

    end
  end
#################################
  def add_song(song, *artist)
    if songs.include?(song) == false;
      @songs << song 
    if song.artist != true;
      song.artist = self
      end
    end
  end

#################################
  def add_song(song)
    if songs.include?(song) == false && song.artist != true;
      @songs << song 
      song.artist = self
    end
  end
#################################

# rspec spec/001_song_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb


# ################################
  # def add_song(song, *artist)
  #   if songs.include?(song) == false;
  #     @songs << song 
  #   if song.artist != true;
  #     song.artist = self
  #     end
  #   end
  # end

# #################################
#   def add_song(song, *artist)
#     if songs.include?(song) == false;
#       @songs << song 
#     if song.artist != true;
#       song.artist = self
#       end
#     end
#   end

# #################################
#   def add_song(song)
#     if songs.include?(song) == false && song.artist != true;
#       @songs << song 
#       song.artist = self
#     end
#   end
# #################################