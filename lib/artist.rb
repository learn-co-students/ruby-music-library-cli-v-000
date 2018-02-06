require 'music_module.rb'

class Artist
  extend MusicModule::ClassMethods
  include MusicModule::InstanceMethods
  
  @@all = []

end