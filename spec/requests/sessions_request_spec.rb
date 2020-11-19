require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/new_session"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /login" do
    context "with valid login parameters" do
      before do
        Admin.create(
          username: "test_admin",
          password: 'test_pass',
          created_at: '2020-11-18 09:25:14.582690',
          updated_at: '2020-11-18 09:25:14.582690'
        )
      end

      it "logs in an admin successfully" do
        post login_url, params: { username: 'test_admin', password: 'test_pass' }

        expect(session[:admin_id]).not_to be_blank
      end

      it "redirects admin to the messages page" do
        post login_url, params: { username: 'test_admin', password: 'test_pass' }

        expect(response).to redirect_to messages_path
      end
    end

    context "with invalid login parameters" do
      it "throws an error" do
        post login_url, params: { username: 'test_admin', password: 'test_pass' }

        expect(flash[:error]).to eql 'Login Failed. Please Try Again.'
      end

      it "redirects user back to the login page" do
        post login_url, params: { username: 'test_admin', password: 'test_pass' }

        expect(response).to redirect_to new_session_path
      end
    end
  end
end
