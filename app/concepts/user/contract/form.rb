require 'reform'
module User::Contract
  class Form < Reform::Form
  	include Reform::Form::ActiveModel

    property :name
    property :email

    validates :name, :email, presence: true
  end
end