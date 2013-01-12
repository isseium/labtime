# coding: utf-8
class WorkController < ApplicationController
	def index
    @gakuchiku = current_login_users
    @me = Work.where(:user_id => current_user.id, :work_time => nil).first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gakuchiku }
    end
  end

  def in
    work = Work.new
    work.user_id = params[:user_id]
    if work.save
      day = Time.now
      twitter_client.update("らぼいん。#{day.strftime('%Y/%m/%d %H:%M:%S')}")
      redirect_to :root, :notice => "らぼいんしました。"
    end
  end

  def out
    work = Work.where(:user_id => current_user.id).last
    tmp = Time.now
    days = (tmp - work.created_at).divmod(24*60*60)
    hours = days[1].divmod(60*60)
    mins = hours[1].divmod(60)
    if work.update_attribute(:work_time, tmp - work.created_at)
      twitter_client.update("らぼあうと。 #{hours[0].to_i} 時間 #{mins[0].to_i} 分 #{mins[1].to_i} 秒ガンバりました。")
      redirect_to :root, :notice => "らぼあうとしました。"
    end
  end

  private
  #　各クライアント生成

  def twitter_client
    Twitter.configure do |config|
      config.consumer_key       = ENV['TWITTER_KEY']
      config.consumer_secret    = ENV['TWITTER_SECRET']
      config.oauth_token        = current_user.token
      config.oauth_token_secret = current_user.secret
    end
  end

  def current_login_users
    Work.where(:work_time => nil )
  end

  # def home_timeline_from_twitter
  #   twitter_client.home_timeline(:count => 20, :include_rts => 'ture').map{|tl|
  #     {
  #       :id => tl.user.id,
  #       :name => tl.user.name,
  #       :screen_name => tl.user.screen_name,
  #       :profile_url => tl.user.profile_image_url,
  #       :background_url => tl.user.profile_background_image_url,
  #       :text => tl.text
  #     }
  #   }
  # end

# フォリワーを取得
#  def friends_from_twitter
#    twitter_client.friends.users.map{|user|
#      {
#        :id => user.id,
#        :name => user.screen_name,
#        :profile_url => user.profile_image_url
#      }
#    }
#  end
end
