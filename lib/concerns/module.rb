module Concerns
  module Findable
    def find_by_name(n)
      self.all.find {|title| title.name == n ? n : false}
    end

    def find_or_create_by_name(n)
      self.find_by_name(n) || self.create(n)
    end
  end
end
