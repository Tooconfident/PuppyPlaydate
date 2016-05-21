helpers do

  def users_exist
    User.all.any?
  end

  def playdates_exist
    Playdate.all.any?
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def current_user_id
    session[:user_id]
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    session[:user_id] != nil
  end

  def logout_user
    session[:user_id] = nil
  end

end
