require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :name => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :telephone => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_name[name=?]", "order[name]"
      assert_select "input#order_street_address[name=?]", "order[street_address]"
      assert_select "input#order_city[name=?]", "order[city]"
      assert_select "input#order_state[name=?]", "order[state]"
      assert_select "input#order_country[name=?]", "order[country]"
      assert_select "input#order_telephone[name=?]", "order[telephone]"
      assert_select "input#order_email[name=?]", "order[email]"
    end
  end
end
