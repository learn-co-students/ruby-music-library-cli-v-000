require 'bundler'
Bundler.require

module Concerns
    module Findable
        
        def find_by_name(name)
            all.detect {|a| a.name == name}
        end

        def find_or_create_by_name(name)
            if find_by_name(name)
                find_by_name(name)
            else
                a = self.new(name)
                a.save
                a
            end
        end

    end
end

require_all 'lib'