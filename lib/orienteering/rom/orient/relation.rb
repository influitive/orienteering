module Orienteering
  module ROM
    module Orient
      class Relation < ::ROM::Relation
        adapter :orient

        forward :filter, :where
      end
    end
  end
end
