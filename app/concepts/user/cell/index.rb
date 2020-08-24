module User::Cell
  class Index < Trailblazer::Cell

    def users
      User.all
    end

  end
end