require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :name => "Name",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :country => "Country",
        :telephone => "Telephone",
        :email => "Email"
      ),
      stub_model(Order,
        :name => "Name",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :country => "Country",
        :telephone => "Telephone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
