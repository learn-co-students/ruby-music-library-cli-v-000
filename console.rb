require 'pry'

def reload!
    load 'lib/artist.rb'
    load 'lib/song.rb'
    load 'lib/genre.rb'
    load 'lib/concerns/findable_module.rb'
end

require_relative './artist.rb'
require_relative './song.rb'
require_relative './genre.rb'
require_relative './concerns/findable_module.rb'

Pry.start
