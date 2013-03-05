class Admin::SettingsController < Admin::ApplicationController
  before_filter :create_my_kennel

  def show
    @my_kennel=Role.find_by_name(:my_kennel).people.first
  end

  def update
    @my_kennel=Role.find_by_name(:my_kennel).people.first
    if @my_kennel.update_attributes(params[:person])
      redirect_to(:admin_settings,
                  :notice => 'Post was successfully updated.')
    else
      redirect_to(:admin_settings,
                  :alert => "Post wasn't updated.")
    end
  end

  private

  def create_my_kennel
    unless Role.find_by_name(:my_kennel).people.first.present?
      my_kennel=Person.new :name=>'My kennel name'
      my_kennel.roles<<Role.find_by_name('my_kennel')
      my_kennel.save
    end
  end
end
