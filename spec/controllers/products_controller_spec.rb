require 'rails_helper'

describe ProductsController, :type => :controller do
  before do
    @user = User.create(email: "max@mustermann.de", password: "12345678")
    sign_in @user 
    # get :index, id: @user.id 
  end 

  describe "GET #index" do
   
    it "respond successfully with an HTTP 200 status code" do  
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end