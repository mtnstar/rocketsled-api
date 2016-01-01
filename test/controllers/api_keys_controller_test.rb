require 'test_helper'

class ApiKeysControllerTest < ActionController::TestCase

  test 'return 401 and error if invalid user/pw' do
    post :create, email: alice.email, password: 'wrong'
    assert_response :unauthorized
    assert_match /invalid user or password/, response_errors.first
  end

  test 'returns new authentication token' do
    alice.api_key.destroy!
    post :create, email: alice.email, password: 'password'
    #assert_response :success
    assert response_entries.include?('access_token')
    assert_not response_entries.include?('user_id')
    assert_not response_entries.include?('id')
  end

  test 'returns existing authentication token' do
    post :create, email: alice.email, password: 'password'
    #assert_response :success
    assert response_entries.include?('access_token')
    assert_not response_entries.include?('user_id')
    assert_not response_entries.include?('id')
  end

  private
  def alice
    users(:alice)
  end

  def response_json
    JSON.parse(response.body)
  end

  def response_entries
    response_json.second
  end

  def response_errors
    response_json.first['errors']
  end

  def response_info
    response_json.first['info']
  end
end
