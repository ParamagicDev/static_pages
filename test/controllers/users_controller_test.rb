# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get signup_path
    assert_response :success
    assert_select 'title', full_title(page_title: 'Sign up')
  end
end
