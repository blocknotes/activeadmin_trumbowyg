# frozen_string_literal: true

module Formtastic
  module Inputs
    class TrumbowygInput < Formtastic::Inputs::TextInput
      def to_html
        input_wrapping do
          label_html << builder.text_area(method, input_html_options.merge('data-aa-trumbowyg': '1'))
        end
      end
    end
  end
end
