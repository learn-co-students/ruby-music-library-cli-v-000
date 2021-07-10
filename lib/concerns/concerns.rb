module Concerns

  module Findable

    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

    def self.find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

    def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

  end

end

# module Concerns
#   module Findable
#
#     def self.find_by_name(name = nil)
#       unless name == nil
#         self.all.detect do |instance|
#           instance.name == name
#         end
#       end
#     end
#
#     def self.find_or_create_by_name(name)
#       unless self.find_by_name(name)
#         self.create(name)
#       end
#       self.all.last
#     end
#
#   end
# end
