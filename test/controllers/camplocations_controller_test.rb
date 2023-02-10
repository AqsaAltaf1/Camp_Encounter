# frozen_string_literal: true

require 'test_helper'

class CamplocationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get camplocations_index_url
    assert_response :success
  end
end
