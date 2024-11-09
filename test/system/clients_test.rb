require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New client"

    fill_in "Born", with: @client.born_id
    fill_in "Date of visit", with: @client.date_of_visit
    fill_in "Diagnos", with: @client.diagnos
    fill_in "From", with: @client.from
    fill_in "Name", with: @client.name
    fill_in "Paid", with: @client.paid
    fill_in "Surname", with: @client.surname
    fill_in "Visiting for", with: @client.visiting_for
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
    click_on "Edit this client", match: :first

    fill_in "Born", with: @client.born_id
    fill_in "Date of visit", with: @client.date_of_visit
    fill_in "Diagnos", with: @client.diagnos
    fill_in "From", with: @client.from
    fill_in "Name", with: @client.name
    fill_in "Paid", with: @client.paid
    fill_in "Surname", with: @client.surname
    fill_in "Visiting for", with: @client.visiting_for
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Destroy this client", match: :first

    assert_text "Client was successfully destroyed"
  end
end
