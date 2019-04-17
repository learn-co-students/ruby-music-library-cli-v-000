require 'bundler'
Bundler.require

require 'pry'

require_relative '../lib/concerns/findable'


require_relative '../lib/artist.rb'
require_relative '../lib/song.rb'
require_relative '../lib/genre.rb'
require_relative '../lib/music_importer.rb'

require_all 'lib'
