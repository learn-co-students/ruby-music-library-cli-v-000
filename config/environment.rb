require 'bundler'
Bundler.require

module Concerns
  module Findable
      def find_by_name(name)
    self.all.detect {|object| object.name == name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      new_object = self.new(name)
      self.all << new_object
      new_object
    end
  end
  end
end
# my issue is that when I have a band that's already known, find_or_create_by_name returns the first band given
require_all 'lib'
