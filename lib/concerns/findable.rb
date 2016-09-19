module Concerns
  module Findable

    def find_by_name(name)
      self.all.each do |obj|
        if obj.name == name
          return obj
        end
      end
    end

    def find_or_create_by_name(name)
      self.all.each do |obj|
        if obj.name == name
          return obj
        end
      end
      self.create(name)
    end

  end
end
