class UsersController < ApplicationController
  def index
  	return render cell(User::Cell::Index)
  end

  def show
  end

  def new
  	run User::Operation::Create::Present do |result|
      return render cell(
        User::Cell::New,
        nil,
        form: @form
      )
    end
  end

  def create
    run User::Operation::Create do |result|
      return redirect_to users_path
    end

    return render cell(
      User::Cell::New,
      nil,
      form: @form
    )
  end
end
