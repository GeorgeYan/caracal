require 'caracal/core/models/base_model'



module Caracal
  module Core
    module Models



      class NumTitleModel < BaseModel

        const_set(:DEFAULT__NUM_TITLE_NUM_ID,  6  )

        attr_reader :num_title_text
        attr_reader :num_title_num_id
        attr_reader :num_title_ilvl
        attr_reader :num_title_pstyle


        def initialize(options={}, &block)
          @num_title_text  = nil
          @num_title_num_id  = DEFAULT__NUM_TITLE_NUM_ID
          @num_title_ilvl  = nil
          @num_title_pstyle  = nil

          super options,&block
        end

        def text(value)
          @num_title_text = value.to_s.strip
        end

        def num_id(value)
          @num_title_num_id = value.to_s.to_i
        end

        def ilvl(value)
          @num_title_ilvl = value.to_s.to_i
        end

        def pstyle(value)
          @num_title_pstyle = value.to_s.strip
        end

        private

        def option_keys
          [:num_title_text, :num_title_num_id, :num_title_ilvl, :num_title_pstyle]
        end
      end
    end
  end
end
