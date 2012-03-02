class User < ActiveRecord::Base
  before_create do |user| 
    user.profile_pic = twit_pic(user.name)
    user.full_name = twit_name(user.name)
    # user.save
  end
  
  before_update do |user|
    if user.status == "5.5"
      user.updated_at = Time.now
    else
      user.updated_at = arrival_status(user.status)
    end
  end

  def twit_name(p)
    tw = Twitter.user(p)
    pro = tw[:attrs]["name"]
  end
  
  def twit_pic(p)
    t = Twitter.user(p)
    p = t[:attrs]["profile_image_url"]
  end
  
  def arrival_status(user)
    arrival_time = user.to_i
    current_time = Time.now.strftime("%H").to_i
    eta = arrival_time - current_time
    if eta < 0
      before = 24 - current_time
      arrive = before + arrival_time
      arrive.hours.from_now
    else
      eta.hours.from_now
    end
  end
end
