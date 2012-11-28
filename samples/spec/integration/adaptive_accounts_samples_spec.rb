require 'spec_helper'

describe "AdaptivePaymentsSamples" do

  def get_response_value(key)
    if find(:id, 'response').text =~ /#{key}: ([^\s]*)/
      $1.dup
    end
  end

  before :each do
    visit adaptive_accounts_samples_path
  end

  it "Create Account" do
    click_link   "Create"
    click_button "Submit"
    page.should have_content("ack: Success")
    @account_id = get_response_value("accountId")
    @create_account_key = get_response_value("createAccountKey")

    click_link "Add Bank"
    fill_in "AddBankAccountRequest[accountId]", :with => @account_id
    click_button "Submit"
    page.should have_content("ack: Success")

    click_link "Add Payment Card"
    fill_in "Account", :with => @account_id
    click_button "Submit"
    page.should have_content("ack: Success")

    click_link "Get User Agreement"
    fill_in "Create account key", :with => @create_account_key
    click_button "Submit"
    page.should have_content("ack: Success")
  end

  it "Get Verification Status" do
    click_link "Get Verified Status"
    click_button "Submit"
    page.should have_content("ack: Success")
  end
end
