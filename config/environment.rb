require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'

require_relative '../lib/song'
require_relative '../lib/artist'
require_relative '../lib/genre'
require_relative '../lib/concerns'
require_relative '../lib/music_importer'
require_relative '../lib/music_library_controller'

