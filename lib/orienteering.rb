require 'rom'

require_relative 'orienteering/rom/orient/gateway.rb'
require_relative 'orienteering/rom/orient/relation.rb'

ROM.register_adapter(:orient, Orienteering::ROM::Orient)
