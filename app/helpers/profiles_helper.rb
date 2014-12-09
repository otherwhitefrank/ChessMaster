module ProfilesHelper
  def correct_user?(user)
  	user == current_user
  end
end
