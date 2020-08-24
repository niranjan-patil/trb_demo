class UsersController < ApplicationController
  def index
  	return render cell(User::Cell::Index)
  end

  def show
    run User::Operation::Show
    if result.success?
      render cell(User::Cell::Show, result["model"])
    else
      redirect_to users_path
    end
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

  def edit
    run User::Operation::Update::Present do |result|
      return render cell(
        User::Cell::Edit,
        nil,
        form: @form
      )
    end
  end

  def update
    run User::Operation::Update do |result|
      return redirect_to users_path
    end

    return render cell(
      User::Cell::Edit,
      nil,
      form: @form
    )
  end

  def destroy
    run User::Operation::Delete
    redirect_to users_path
  end
end
