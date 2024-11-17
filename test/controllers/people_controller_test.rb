require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post people_url, params: { person: { address: @person.address, email: @person.email, last_name: @person.last_name, middle_name: @person.middle_name, name: @person.name, password_digest: @person.password_digest, phone: @person.phone, role_id: @person.role_id, second_last_name: @person.second_last_name, status: @person.status, username: @person.username } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { address: @person.address, email: @person.email, last_name: @person.last_name, middle_name: @person.middle_name, name: @person.name, password_digest: @person.password_digest, phone: @person.phone, role_id: @person.role_id, second_last_name: @person.second_last_name, status: @person.status, username: @person.username } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
