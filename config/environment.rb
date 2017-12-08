require 'bundler'
require_relative '../lib/song_basics'
require_relative '../lib/artist_basics'
require_relative '../lib/genre_basics'
Bundler.require

module Concerns
end

require_all 'lib'
