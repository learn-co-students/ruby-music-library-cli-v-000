require 'bundler'
Bundler.require

module Concerns

end

# module Setup
#
#   module InstanceMethods
#     def initialize(name)
#       @name = name
#     end
#
#     def save
#       self.class.all << self
#     end
#   end
#   module ClassMethods
#     def all
#       self.all
#     end
#
#     def destroy_all
#       self.all.clear
#     end
#
#     def create(name)
#       self.new(name).save
#     end
#   end
# end

require_all 'lib'
