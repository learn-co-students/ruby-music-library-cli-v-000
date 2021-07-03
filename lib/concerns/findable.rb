module Concerns


  module Findable

    def find_by_name(name)
      all.find do |v|
        v.name == name
      end
    end


  # def create(name)
  #     # new_object = self.new
  #   # new_object.name = name
  #   # new_object
  #   # save
  #   self.new.tap do |o|
  #     o.name = name
  #   end
  # end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
       self.create(name)
    else
      self.find_by_name(name)
    end
  end
end
end
