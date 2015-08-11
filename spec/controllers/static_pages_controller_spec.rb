require 'rails_helper'

describe StaticPagesController, :type => :controller do
  describe "Get #landing_page" do
    it "respond successfully with an HTTP 200 status code" do
      get :landing_page
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :landing_page
      expect(response).to render_template("landing_page")
    end
  end

  describe "Get #index" do
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