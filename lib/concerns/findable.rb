module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect {|item| item.name == name}
    end

    def find_or_create_by_name(name)
      if find_by_name(name) == nil
        create_by_name(name)
      else
        find_by_name(name)
    end
  end
  def create_by_name(name)
    item = self.new(name)
    item.save
    item
  end
end
end
