require 'rails_helper'

RSpec.describe "home", type: :request do
  include_context "logged in" 
  it "can render the root page" do
    get "/"

    expect(response).to be_successful
  end
end
