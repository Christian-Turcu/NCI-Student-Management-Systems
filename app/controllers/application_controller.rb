class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :test_environment?

  private

  def test_environment?
    Rails.env.test?
  end
end
