require 'spec_helper'

describe "admin_users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(Admin::User))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_users_path(@user), :method => "post" do
    end
  end
end
