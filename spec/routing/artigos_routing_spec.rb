require "rails_helper"

RSpec.describe ArtigosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/artigos").to route_to("artigos#index")
    end

    it "routes to #show" do
      expect(get: "/artigos/1").to route_to("artigos#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/artigos").to route_to("artigos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/artigos/1").to route_to("artigos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/artigos/1").to route_to("artigos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/artigos/1").to route_to("artigos#destroy", id: "1")
    end
  end
end
