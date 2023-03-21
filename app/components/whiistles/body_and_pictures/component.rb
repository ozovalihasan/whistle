# frozen_string_literal: true

module Whiistles
  module BodyAndPictures
    class Component < Application::Component
      def initialize(whiistle:, show_quoted_whiistle: true, show_pictures: true)
        @whiistle = whiistle
        @show_quoted_whiistle = show_quoted_whiistle
        @show_pictures = show_pictures
      end
    end
  end
end
