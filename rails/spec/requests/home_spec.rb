require 'rails_helper'

RSpec.describe "home", type: :request do
  it "can render the root page" do
    get "/"

    expect(response).to be_successful
  end
end
