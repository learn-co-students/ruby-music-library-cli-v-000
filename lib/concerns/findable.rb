module Concerns
  module Findable
    def self.find_by_name(name)
      @@all.select {|x| x.name == name}
    end
  end
end


# module Concerns
#   module Findable
#   end
# end
