require "rails_helper"

RSpec.describe "home", type: :request do
  include_context "logged in"
  it "can render the root page" do
    get "/"

    expect(response).to be_successful

    sign_out current_user
    get "/"

    expect(response).to redirect_to("/users/sign_in")
  end
end
