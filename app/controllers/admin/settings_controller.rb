class Admin::SettingsController < Admin::ApplicationController

  def show
    @site_name=AdminSettings.site_name
    @adress=AdminSettings.adress
    @owner_name=AdminSettings.owner_name
    @phone_number=AdminSettings.phone_number
    @subscribe_send=AdminSettings.subscribe_send
    @admin_login=AdminSettings.admin_login
    @admin_password=AdminSettings.admin_password
  end

  def update
    Logger.new("#{Rails.root}/log/debdeb.log").info "#{Time.now.strftime("at %R")} in SettingsController - update || #{params}"

    AdminSettings.site_name=params[:site_name]
    AdminSettings.adress=params[:adress]
    AdminSettings.owner_name=params[:owner_name]
    AdminSettings.phone_number=params[:phone_number]
    AdminSettings.admin_login=params[:admin_login]
    AdminSettings.admin_password=params[:admin_password]
    params[:subscribe_send] ? AdminSettings.subscribe_send=true : AdminSettings.subscribe_send=false
    
    if true #todo validate
      redirect_to(:admin_settings,
                  :notice => 'Post was successfully updated.')
    else
      redirect_to(:admin_settings,
                  :alert => "Post wasn't updated.")
    end
  end

end
