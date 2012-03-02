module UsersHelper
  def first_name
    @user.full_name.split(' ')[0]   
  end
end
