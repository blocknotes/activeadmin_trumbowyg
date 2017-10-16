module Formtastic
  module Inputs
    class TrumbowygInput < Formtastic::Inputs::TextInput
      def to_html
        input_wrapping do
          label_html <<
          builder.text_area( method, input_html_options.merge( class: 'trumbowyg-textarea' ) )
        end
      end
    end
  end
end
