require 'bundler'
require 'pry'
Bundler.require

module Concerns
  module Findable
      def find_by_name(name)
        self.all.detect{|item| item.name == name}
      end

      def find_or_create_by_name(name)
        item = find_by_name(name)
        unless item
          item = self.create(name)
        end

        item
      end

  end
end

require_all 'lib'

require_relative '../lib/Artist.rb'
require_relative '../lib/Song.rb'
require_relative '../lib/Genre.rb'
require_relative '../lib/MusicImporter.rb'
require_relative '../lib/MusicLibraryController.rb'
require_relative '../lib/concerns/memorable.rb'
