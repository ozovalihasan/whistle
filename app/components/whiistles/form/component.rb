# frozen_string_literal: true

module Whiistles
  module Form
    class Component < Application::Component
      def initialize(
        form_url:,
        whiistle:,
        label:,
        cur_user:,
        value: nil,
        quoted_whiistle: nil,
        enable_quoting_whiistle: nil,
        enable_adding_floods: nil,
        open_modal: nil,
        modal_path: nil
      )

        @form_url = form_url
        @whiistle = whiistle
        @label = label
        @user = cur_user
        @value = value
        @quoted_whiistle = quoted_whiistle
        @enable_quoting_whiistle = enable_quoting_whiistle
        @enable_adding_floods = enable_adding_floods
        @open_modal = open_modal
        @modal_path = modal_path
      end
    end
  end
end
