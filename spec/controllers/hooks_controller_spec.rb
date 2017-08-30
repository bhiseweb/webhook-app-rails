require 'rails_helper'

RSpec.describe HooksController, type: :controller do
    
  describe "POST #create", type: :request do
  
    let(:hook) { FactoryGirl.build(:hook) }
        
    it "should return success response" do
      post '/hooks', params: hook.data.to_json
      expect(response).to be_success
    end

    it "should create a record" do
      expect(Hook.count).to eq 0
      post '/hooks', params: hook.data.to_json
      expect(Hook.count).to eq 1
    end
    
    it "should create a record with name Tester1" do
      hook.data['name'] = 'Tester1'
      post '/hooks', params: hook.data.to_json
      expect(Hook.first.data["name"]).to eq "Tester1"
    end  
  end
  
end
