module Concerns
  module Findable
    def find_by_name(name)
      self.all.each do |obj|
        return obj if obj.name == name
      end
    end

    def find_or_create_by_name(name)
      self.all.each do |obj|
        return obj if obj.name == name
      end

      obj = self.create(name)

    end

  end

end
