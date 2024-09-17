require 'bundler'
Bundler.require

module Concerns
  module Findable
      def find_by_name(name)
        self.all.find {|s| s.name == name}
      end

      def sorted
        self.all.sort {|x, y| x.name <=> y.name}
      end

    def find_or_create_by_name(song_name)
      if self.find_by_name(song_name)
        self.find_by_name(song_name)
      else
        self.create(song_name)
      end
    end
  end

end

require_all 'lib'
