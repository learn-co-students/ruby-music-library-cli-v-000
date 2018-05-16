require 'bundler'
require 'pry'
Bundler.require
require_all 'lib'

module Concerns
  
  module ClassMethods
    def destroy_all 
    all.clear
    end 
  end
  
  module InstanceMethods 
    def initialize(name, artist = nil, genre = nil)
    @name = name 
    end
    
    def save
    self.class.all << self 
    end
    
    def songs 
    @songs 
    end
  end
  
  module Findable
    
    def create(name)
      self.new(name).tap {|i| i.save}
    end
    
    def find_by_name(name)
      all.detect {|i| i.name == name}
    end
    
    def find_or_create_by_name(name)
      find_by_name(name) || create(name) 
    end

  end 
end 
    



# learn --fail-fast

# PASSING
#    rspec spec/001_song_basics_spec.rb
#    rspec spec/002_artist_basics_spec.rb
#    rspec spec/003_genre_basics_spec.rb
#    rspec spec/004_songs_and_artists_spec.rb
#    rspec spec/005_songs_and_genres_spec.rb
#    rspec spec/006_artists_and_genres_spec.rb
#    rspec spec/007_findable_songs_spec.rb
#    rspec spec/008_findable_module_spec.rb


# IN PROGRESS


# AHEAD
# 9 #    rspec spec/009_music_importer_spec.rb
# 7 #    rspec spec/010_music_library_controller_spec.rb
# 19 #   rspec spec/011_music_library_cli_methods_spec.rb
# 6 #    rspec spec/012_music_library_cli_spec.rb

