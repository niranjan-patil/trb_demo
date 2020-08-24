module User::Cell
  class Edit < Trailblazer::Cell
    include ActionView::Helpers::FormOptionsHelper
    include SimpleForm::ActionViewExtensions::FormHelper

    def form
      @options[:form]
    end

  end
end