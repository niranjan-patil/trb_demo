module User::Operation
  class Create < Trailblazer::Operation

    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: User::Contract::Form)
    end

    step Subprocess(Present)
    step Contract::Validate(key: :user)
    step Contract::Persist()
  end
end