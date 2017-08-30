require 'rails_helper'

RSpec.describe HooksController, type: :controller do

  describe "GET #index" do
  
    before :each do
      5.times { |i| FactoryGirl.create(:hook) }
    end 
    
    it "return all webhooks" do
      get :index
      expect(assigns(:hooks).count).to eq 5
    end
    
    it "should return success response" do
      get :index
      expect(response).to be_success
    end
    
    it "should render index template" do
      get :index
      expect(response).to render_template("index")
    end
    
    it "should return only 10 records at a time" do
      6.times { |i| FactoryGirl.create(:hook) }
      get :index
      expect(assigns(:hooks).count).to eq 10
    end
    
  end
    
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
