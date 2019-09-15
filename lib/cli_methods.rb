require 'pry'

class CLI_methods

  def list_songs
    name = music_library_controller.song.name
    puts "#{name}"
  end



end
