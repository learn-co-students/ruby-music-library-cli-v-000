require 'pry'


class MusicImporter
#=================properties===================
  attr_accessor :path, :files
#=================intialize====================
  def initialize(path)
    self.path = path
  end
#=================instance=====================
  def files
    files = Dir.glob(@path+"/*.mp3")
    
    # binding.pry
  end
#==============================================
end


# @path = ./spec/fixtures/mp3s


# ./spec/fixtures/mp3s/Action Bronson - Larry Csonka - indie.mp3