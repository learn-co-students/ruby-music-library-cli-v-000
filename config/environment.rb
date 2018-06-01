require 'bundler'
require_relative '../lib/song.rb'
require_relative '../lib/artist.rb'
require_relative '../lib/genre.rb'
require_relative '../lib/music_importer.rb'

Bundler.require

module Concerns
end

require_all 'lib'
