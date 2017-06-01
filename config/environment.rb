require 'bundler'
Bundler.require

module Concerns
#  module Findable
#    def find_by_name(name)
#      self.all.detect{|a| a.name == name}
#    end
#    def find_or_create_by_name(name)
#      a = self.all.detect{|instance| instance.name == artist_name}
#      if(a.nil?)
#        return a.class.create(name)
#      end
#      return a
#    end
#  end
#  module ClassMethods
#    def self.destroy_all
#      self.all.clear
#    end
#  end
end


require_all 'lib'
