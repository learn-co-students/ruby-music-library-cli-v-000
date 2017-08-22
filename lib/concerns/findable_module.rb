module Concerns

  module Findable

    def find_by_name(name)
      # binding.pry
      self.all.detect{|item| item.name == name}
    end

  end





end
