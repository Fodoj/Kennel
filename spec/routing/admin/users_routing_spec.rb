require "spec_helper"

describe Admin::UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_users").should route_to("admin_users#index")
    end

    it "routes to #new" do
      get("/admin_users/new").should route_to("admin_users#new")
    end

    it "routes to #show" do
      get("/admin_users/1").should route_to("admin_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_users/1/edit").should route_to("admin_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_users").should route_to("admin_users#create")
    end

    it "routes to #update" do
      put("/admin_users/1").should route_to("admin_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_users/1").should route_to("admin_users#destroy", :id => "1")
    end

  end
end
