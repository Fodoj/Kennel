class Admin::SettingsController < Admin::ApplicationController

  def show
    @site_name=AdminSettings.site_name
    @adress=AdminSettings.adress
  end

  def update
    # Logger.new("#{Rails.root}/log/debugger.log").info "#{Time.now.strftime("at %R")} in SettingsController - update || #{params}"

    AdminSettings.site_name=params[:site_name]
    AdminSettings.adress=params[:adress]
    
    if true #todo validate
      redirect_to(:admin_settings,
                  :notice => 'Post was successfully updated.')
    else
      redirect_to(:admin_settings,
                  :alert => "Post wasn't updated.")
    end
  end

end
