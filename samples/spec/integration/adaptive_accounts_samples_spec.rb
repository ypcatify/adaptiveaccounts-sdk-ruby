require 'spec_helper'

describe "AdaptivePaymentsSamples" do

  before :each do
    visit adaptive_accounts_samples_path
  end

  it "Create Account" do
    check_sample "Create"
    @account_id = get_response_value("accountId")
    @create_account_key = get_response_value("createAccountKey")

    check_sample "Add Bank" do
      fill_in "AddBankAccountRequest[accountId]", :with => @account_id
    end

    check_sample "Add Payment Card" do
      fill_in "Account", :with => @account_id
    end

    check_sample "Get User Agreement" do
      fill_in "Create account key", :with => @create_account_key
    end
  end

  it_check_sample "Get Verified Status"
end
