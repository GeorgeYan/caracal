require 'caracal/core/models/num_title_model'
require 'caracal/errors'


module Caracal
  module Core

    # This module encapsulates all the functionality related to adding
    # horizontal rules to the document.
    #
    module NumTitles
      def self.included(base)
        base.class_eval do

          #-------------------------------------------------------------
          # Public Methods
          #-------------------------------------------------------------

          #============== ATTRIBUTES ==========================


          def num_title(*args, &block)
            options = Caracal::Utilities.extract_options!(args)
            # options.merge!({ show: !!args.first }) unless args.first.nil?  # careful: falsey value
            model = Caracal::Core::Models::NumTitleModel.new(options, &block)
            if model.valid?
              @num_title_text = model.num_title_text
              @num_title_num_id  = model.num_title_num_id
              @num_title_ilvl  = model.num_title_ilvl
              @num_title_pstyle  = model.num_title_pstyle
              contents << model
            else
              raise Caracal::Errors::InvalidModelError, 'num_title has errors'
            end
            model
          end

        end
      end
    end

  end
end
