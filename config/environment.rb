
require 'bundler'
Bundler.require

module Concerns
end
# require them  here, not on individual files. line 14 covers all of these. 
# require_relative '../lib/artist.rb'
# require_relative '../lib/genre.rb'
# require_relative '../lib/song.rb'
#
# require_relative '../lib/concerns/findable'

require_all 'lib'
