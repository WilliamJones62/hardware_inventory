require "application_system_test_case"

class HardwaresTest < ApplicationSystemTestCase
  setup do
    @hardware = hardwares(:one)
  end

  test "visiting the index" do
    visit hardwares_url
    assert_selector "h1", text: "Hardwares"
  end

  test "creating a Hardware" do
    visit hardwares_url
    click_on "New Hardware"

    fill_in "Available physical memory", with: @hardware.available_physical_memory
    fill_in "Boot time", with: @hardware.boot_time
    fill_in "Host", with: @hardware.host
    fill_in "Install date", with: @hardware.install_date
    fill_in "Make", with: @hardware.make
    fill_in "Model", with: @hardware.model
    fill_in "Os", with: @hardware.os
    fill_in "Os version", with: @hardware.os_version
    fill_in "Owner", with: @hardware.owner
    fill_in "Physical memory", with: @hardware.physical_memory
    fill_in "Processor", with: @hardware.processor
    fill_in "Serial number", with: @hardware.serial_number
    fill_in "Type", with: @hardware.type
    click_on "Create Hardware"

    assert_text "Hardware was successfully created"
    click_on "Back"
  end

  test "updating a Hardware" do
    visit hardwares_url
    click_on "Edit", match: :first

    fill_in "Available physical memory", with: @hardware.available_physical_memory
    fill_in "Boot time", with: @hardware.boot_time
    fill_in "Host", with: @hardware.host
    fill_in "Install date", with: @hardware.install_date
    fill_in "Make", with: @hardware.make
    fill_in "Model", with: @hardware.model
    fill_in "Os", with: @hardware.os
    fill_in "Os version", with: @hardware.os_version
    fill_in "Owner", with: @hardware.owner
    fill_in "Physical memory", with: @hardware.physical_memory
    fill_in "Processor", with: @hardware.processor
    fill_in "Serial number", with: @hardware.serial_number
    fill_in "Type", with: @hardware.type
    click_on "Update Hardware"

    assert_text "Hardware was successfully updated"
    click_on "Back"
  end

  test "destroying a Hardware" do
    visit hardwares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hardware was successfully destroyed"
  end
end
