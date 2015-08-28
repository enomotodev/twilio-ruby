require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch incoming_phone_numbers" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').incoming_phone_numbers.get('PNllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').incoming_phone_numbers.get('PNkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').incoming_phone_numbers.get('PNmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read incoming_phone_numbers" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.list(beta: true, friendly_name: 'friendly_name', phone_number: 'phone_number') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').incoming_phone_numbers.list(beta: true, friendly_name: 'friendly_name', phone_number: 'phone_number') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').incoming_phone_numbers.list(beta: true, friendly_name: 'friendly_name', phone_number: 'phone_number') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').incoming_phone_numbers.list(beta: true, friendly_name: 'friendly_name', phone_number: 'phone_number') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create incoming_phone_numbers" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.create(api_version: 'api_version', friendly_name: 'friendly_name', phone_number: 'phone_number', sms_application_sid: 'sms_application_sid', sms_fallback_method: "GET", sms_fallback_url: "https://example.com", sms_method: "GET", sms_url: "https://example.com", status_callback: "https://example.com", status_callback_method: "GET", voice_application_sid: 'voice_application_sid', voice_caller_id_lookup: true, voice_fallback_method: "GET", voice_fallback_url: "https://example.com", voice_method: "GET", voice_url: "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').incoming_phone_numbers.create(api_version: 'api_version', friendly_name: 'friendly_name', phone_number: 'phone_number', sms_application_sid: 'sms_application_sid', sms_fallback_method: "GET", sms_fallback_url: "https://example.com", sms_method: "GET", sms_url: "https://example.com", status_callback: "https://example.com", status_callback_method: "GET", voice_application_sid: 'voice_application_sid', voice_caller_id_lookup: true, voice_fallback_method: "GET", voice_fallback_url: "https://example.com", voice_method: "GET", voice_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').incoming_phone_numbers.create(api_version: 'api_version', friendly_name: 'friendly_name', phone_number: 'phone_number', sms_application_sid: 'sms_application_sid', sms_fallback_method: "GET", sms_fallback_url: "https://example.com", sms_method: "GET", sms_url: "https://example.com", status_callback: "https://example.com", status_callback_method: "GET", voice_application_sid: 'voice_application_sid', voice_caller_id_lookup: true, voice_fallback_method: "GET", voice_fallback_url: "https://example.com", voice_method: "GET", voice_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').incoming_phone_numbers.create(api_version: 'api_version', friendly_name: 'friendly_name', phone_number: 'phone_number', sms_application_sid: 'sms_application_sid', sms_fallback_method: "GET", sms_fallback_url: "https://example.com", sms_method: "GET", sms_url: "https://example.com", status_callback: "https://example.com", status_callback_method: "GET", voice_application_sid: 'voice_application_sid', voice_caller_id_lookup: true, voice_fallback_method: "GET", voice_fallback_url: "https://example.com", voice_method: "GET", voice_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update incoming_phone_numbers" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(account_sid: 'account_sid', api_version: 'api_version', friendly_name: 'friendly_name', sms_application_sid: 'sms_application_sid', sms_fallback_method: "GET", sms_fallback_url: "https://example.com", sms_method: "GET", sms_url: "https://example.com", status_callback: "https://example.com", status_callback_method: "GET", voice_application_sid: 'voice_application_sid', voice_caller_id_lookup: true, voice_fallback_method: "GET", voice_fallback_url: "https://example.com", voice_method: "GET", voice_url: "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').incoming_phone_numbers.get('PNllllllllllllllllllllllllllllllll')
      expect { resource.update(account_sid: 'account_sid', api_version: 'api_version', friendly_name: 'friendly_name', sms_application_sid: 'sms_application_sid', sms_fallback_method: "GET", sms_fallback_url: "https://example.com", sms_method: "GET", sms_url: "https://example.com", status_callback: "https://example.com", status_callback_method: "GET", voice_application_sid: 'voice_application_sid', voice_caller_id_lookup: true, voice_fallback_method: "GET", voice_fallback_url: "https://example.com", voice_method: "GET", voice_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').incoming_phone_numbers.get('PNkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(account_sid: 'account_sid', api_version: 'api_version', friendly_name: 'friendly_name', sms_application_sid: 'sms_application_sid', sms_fallback_method: "GET", sms_fallback_url: "https://example.com", sms_method: "GET", sms_url: "https://example.com", status_callback: "https://example.com", status_callback_method: "GET", voice_application_sid: 'voice_application_sid', voice_caller_id_lookup: true, voice_fallback_method: "GET", voice_fallback_url: "https://example.com", voice_method: "GET", voice_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').incoming_phone_numbers.get('PNmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(account_sid: 'account_sid', api_version: 'api_version', friendly_name: 'friendly_name', sms_application_sid: 'sms_application_sid', sms_fallback_method: "GET", sms_fallback_url: "https://example.com", sms_method: "GET", sms_url: "https://example.com", status_callback: "https://example.com", status_callback_method: "GET", voice_application_sid: 'voice_application_sid', voice_caller_id_lookup: true, voice_fallback_method: "GET", voice_fallback_url: "https://example.com", voice_method: "GET", voice_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should delete incoming_phone_numbers" do
    it "and return 204" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').incoming_phone_numbers.get('PNllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').incoming_phone_numbers.get('PNkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').incoming_phone_numbers.get('PNmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end
end