require 'bundler'
Bundler.require

require_all 'lib'

module Concerns

  module Findable

    def find_by_name(name)
      self.all.last if self.all.any? { |song| song.name = name }
    end

    def Song.find_or_create_by_name(name)
      if self.all.all? { |song| song.name != name }
        self.create(name)
      else
        self.all.last
      end
    end

  end # findable module 



end # concerns module 


