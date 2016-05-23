require 'bundler'
Bundler.require
require_relative '../lib/concerns/Findable'
require_relative '../lib/song'
require_relative '../lib/artist'
require_relative '../lib/genre'

module Concerns
end

require_all 'lib'
