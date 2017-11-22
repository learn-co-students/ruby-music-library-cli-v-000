require 'bundler'
Bundler.require

require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/memorable'
#require_relative '../lib/concerns/paramable'

module Concerns
end

require_all 'lib'
