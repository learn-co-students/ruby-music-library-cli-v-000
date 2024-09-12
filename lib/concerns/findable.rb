
#Referenced Labs
# ruby-advanced-class-methods-lab-v-000

module Concerns::Findable

  # module ClassMethods

    def find_by_name(name)
      self.all.detect{|item| item.name == name}
    end

    def find_or_create_by_name(name)
      if (self.find_by_name(name))
        return self.find_by_name(name)
      else
        self.create(name)
      end
    end

    def alphabetical
      self.all.sort_by { |temp| temp.name }
    end


  # end

end
