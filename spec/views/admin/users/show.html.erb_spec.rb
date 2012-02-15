require 'spec_helper'

describe "admin_users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(Admin::User))
  end

  it "renders attributes in <p>" do
    render
  end
end
