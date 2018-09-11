module Concerns
  #class methods module (extend)
  module Findable
    def find_by_name(the_name)
      self.all.find { |song| song.name == the_name}
    end

    def create(the_name)
      new_inst = self.new(the_name)
      new_inst.save
      new_inst
    end

    def find_or_create_by_name(the_name)
      if !find_by_name(the_name)
        create(the_name)
      else
        find_by_name(the_name)
      end
    end

  end

end
