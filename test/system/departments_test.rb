require "application_system_test_case"

class DepartmentsTest < ApplicationSystemTestCase
  setup do
    @department = departments(:one)
  end

  test "visiting the index" do
    visit departments_url
    assert_selector "h1", text: "Departments"
  end

  test "should create department" do
    visit departments_url
    click_on "New department"

    fill_in "Cep", with: @department.cep
    fill_in "City", with: @department.city
    fill_in "Code", with: @department.code
    fill_in "Complement", with: @department.complement
    fill_in "Description", with: @department.description
    fill_in "District", with: @department.district
    fill_in "Name", with: @department.name
    fill_in "Number", with: @department.number
    fill_in "State", with: @department.state
    fill_in "Status", with: @department.status
    fill_in "Street", with: @department.street
    click_on "Create Department"

    assert_text "Department was successfully created"
    click_on "Back"
  end

  test "should update Department" do
    visit department_url(@department)
    click_on "Edit this department", match: :first

    fill_in "Cep", with: @department.cep
    fill_in "City", with: @department.city
    fill_in "Code", with: @department.code
    fill_in "Complement", with: @department.complement
    fill_in "Description", with: @department.description
    fill_in "District", with: @department.district
    fill_in "Name", with: @department.name
    fill_in "Number", with: @department.number
    fill_in "State", with: @department.state
    fill_in "Status", with: @department.status
    fill_in "Street", with: @department.street
    click_on "Update Department"

    assert_text "Department was successfully updated"
    click_on "Back"
  end

  test "should destroy Department" do
    visit department_url(@department)
    click_on "Destroy this department", match: :first

    assert_text "Department was successfully destroyed"
  end
end
