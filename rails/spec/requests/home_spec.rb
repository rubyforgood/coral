require "rails_helper"

RSpec.describe "home", type: :request do
  include_context "logged in"
  it "can render the root page" do
    get "/"
    puts response.inspect
    expect(response).to be_successful

    sign_out current_user
    get "/"

    expect(response).to redirect_to("/#{default_locale}/users/sign_in")
  end
  xit "can render a locale-specific root page" do
    locale_path_prefixes.each do |locale|
      puts locale
      puts "Getting #{locale}/"
      get "#{locale}/"
      expect(response).to be_successful

      sign_out current_user
      get "#{locale}/"

      expect(response).to redirect_to("#{locale}/users/sign_in")
    end
  end
end
