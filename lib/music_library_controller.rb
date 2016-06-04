require "pry"
class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    answer = gets
    if answer != "exit"
       "exit"
      call
    else
       "exit"
    end
  end

end