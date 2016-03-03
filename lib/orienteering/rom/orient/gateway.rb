require 'active_support/core_ext/string/inflections'

module Orienteering
  module ROM
    module Orient
      class Gateway < ::ROM::Gateway
        attr_reader :url, :opts
        def initialize(url, opts)
          @url = url
          @opts = opts
        end

        def dataset(name)
          g = graph.v('@class' => name.to_s.titleize)
          Dataset.new(g)
        end

        private
        def graph
          @graph ||= Pacer.orient(url, opts.slice(:user, :password))
        end
      end

      class Dataset
        def initialize(graph)
          @graph = graph
        end

        def each
          graph.each do |v|
            yield v.properties
          end
        end

        def method_missing(method, *args)
          graph.send(method, *args)
        end

        private
        attr_reader :graph
      end
    end
  end
end
