# frozen_string_literal: true

require 'test_helper'

class BulletinsTest < ActionDispatch::IntegrationTest
  setup do
    @bulletin = bulletins(:one)
  end

  test 'should get index' do
    get bulletins_url

    assert_response :success
  end

  test 'should show bulletin' do
    get bulletins_url @bulletin

    assert_response :success
  end
end
