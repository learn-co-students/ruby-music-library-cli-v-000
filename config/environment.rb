require 'bundler'
Bundler.require

module Concerns

  module Findable

      def find_by_name(name)
        self.all.select{|item| item.name == name}[0]
      end

      def find_or_create_by_name(name)
        item_exists = self.all.select{|item| item.name == name}[0] #loop through @@all looking for the song and return the first match
        puts "item_exists = #{item_exists}"
        item_exists == nil ? self.create(name) : item_exists #if the array is empty, create the song. otherwise, return the existing song
      end

  end

end

require_all 'lib'
