# -*- coding: utf-8 -*-
require 'spec_helper'

class Admin::CohortTest < ActionDispatch::IntegrationTest
  def basic_auth(name, password)
    if page.driver.respond_to?(:basic_auth)
      page.driver.basic_auth(name, password)
    elsif page.driver.respond_to?(:basic_authorize)
      page.driver.basic_authorize(name, password)
    elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
      page.driver.browser.basic_authorize(name, password)
    else
      raise "I don't know how to log in!"
    end
  end

  test "should block access without invalid HTTP auth" do
    visit '/admin'

    assert_equal 401, page.status_code
  end

  test "should show the page" do
    basic_auth('edavis', 'password')

    visit '/admin'

    assert_equal 200, page.status_code
    assert has_content?("Cohorts")
  end

end