require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:michael)
    remember(@user)
  end

  test 'current_user returns right user when sessions is nil' do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test 'current_user returns nil when remember_digest is wrong' do
    # Assigns a new token to the user which will be different from ActiveRecord token
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end