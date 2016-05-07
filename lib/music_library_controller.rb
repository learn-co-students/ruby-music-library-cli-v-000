require 'pry'

class MusicLibraryController


attr_accessor :path

def initialize(path = './db/mp3s' )
  @path = path
  new_path = MusicImporter.new(path)
  new_path.import
  end


def call

input = gets.chomp
until input == "exit"

input = gets.chomp
end
end

def list_songs
binding.pry


end


end