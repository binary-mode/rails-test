require "rails_helper"

RSpec.describe SessionsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/new_session").to route_to("sessions#new")
    end

    it "routes to #login" do
      expect(post: "/login").to route_to("sessions#login")
    end

    it "routes to #logout" do
      expect(get: "/logout").to route_to("sessions#destroy")
    end
  end
end
