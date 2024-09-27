module Concerns

  module Findable

    def find_by_name(name)
      self.all.find { |object| object.name == name }
    end

    def find_or_create_by_name(name)
      object = self.all.find { |object| object.name == name }
      object = self.create(name) if object.nil?
      object
    end

  end

end
