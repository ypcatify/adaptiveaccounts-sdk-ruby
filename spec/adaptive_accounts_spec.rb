require 'spec_helper'

describe "AdaptiveAccounts" do

  before :all do
    @client = PayPal::SDK::AdaptiveAccounts::API.new
  end

  describe "Services" do
    PayPal::SDK::AdaptiveAccounts::Services.instance_methods.select{|m| m =~ /^[A-Z]/ and m !~ /^Build/ }.each do |service_method|
      it "make empty request to #{service_method}" do
        response = @client.send(service_method, {})
        response.response_envelope.ack.should_not be_nil
      end
    end
  end

  describe "DataTypes" do
    PayPal::SDK::AdaptiveAccounts::DataTypes.constants.each do |const_name|
      it "create object for #{const_name}" do
        klass = PayPal::SDK::AdaptiveAccounts::DataTypes.const_get(const_name)
        klass.new.should be_a klass
      end
    end
  end

end
