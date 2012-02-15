require 'spec_helper'

describe "admin_users/index.html.erb" do
  before(:each) do
    assign(:admin_users, [
      stub_model(Admin::User),
      stub_model(Admin::User)
    ])
  end

  it "renders a list of admin_users" do
    render
  end
end
