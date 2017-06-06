module Concerns

  module Findable
    def find_by_name(name)
      self.all.detect{|o| o.name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def create(name)
      self.new(name).tap {|art| art.save}
    end


  end




end
