module Concerns
  # Module code here

  module Findable

    def find_by_name(name)
      self.all.find{|thing| thing.name==name}
    end

    def find_or_create_by_name(name)

      thing = self.find_by_name(name)
      if  thing == nil
        thing=self.create(name)
      end
      thing

    end    
  end


end
