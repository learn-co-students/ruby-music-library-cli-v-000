module Concerns
  module Basics
    def initialize(name, second= nil, third =nil)
        self.name = name
    end

    def save
        self.class.all<<self
    end

  end
    module Findable

        def destroy_all
            all.clear
        end

        def create(name)
            temp=new(name)
            temp.save
            temp
        end

        def find_by_name(name)
          all.detect{|item| item.name==name}
        end

        def find_or_create_by_name(name)
          if !find_by_name(name).nil?
            find_by_name(name)
          else
            create(name)
          end
        end
    end
end
