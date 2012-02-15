require 'spec_helper'

describe "people/index.html.erb" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :name => "Name"
      ),
      stub_model(Person,
        :name => "Name"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
