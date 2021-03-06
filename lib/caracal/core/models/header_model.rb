require 'caracal/core/models/base_model'



module Caracal
  module Core
    module Models



      class HeaderModel < BaseModel

        const_set(:DEFAULT_HEADER_ALIGN, :center)
        const_set(:DEFAULT_HEADER_SHOW,  false  )
        const_set(:DEFAULT_HEADER_HORIZONTAL_LINE,  false  )

        attr_reader :header_align
        attr_reader :header_text
        attr_reader :header_show
        attr_reader :header_style
        attr_reader :header_horizontal_line


        def initialize(options={}, &block)
          @header_align = DEFAULT_HEADER_ALIGN
          @header_text  = nil
          @header_show  = DEFAULT_HEADER_SHOW
          @header_style  = nil
          @header_horizontal_line  = DEFAULT_HEADER_HORIZONTAL_LINE

          super options,&block
        end

        def align(value)
          @header_align = value.to_s.to_sym
        end


        def text(value)
          @header_text = value.to_s.strip
        end

        def show(value)
          @header_show = !!value
        end

        def style(value)
          @header_style = value.to_s.strip
        end

        def horizontal_line(value)
          @header_horizontal_line = !!value
        end



        def valid?
          (!header_show || [:left, :center, :right].include?(header_align))
        end


        private

        def option_keys
          [:align, :label, :show, :style, :horizontal_line]
        end
      end
    end
  end
end
