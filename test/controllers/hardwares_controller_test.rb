require 'test_helper'

class HardwaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hardware = hardwares(:one)
  end

  test "should get index" do
    get hardwares_url
    assert_response :success
  end

  test "should get new" do
    get new_hardware_url
    assert_response :success
  end

  test "should create hardware" do
    assert_difference('Hardware.count') do
      post hardwares_url, params: { hardware: { available_physical_memory: @hardware.available_physical_memory, boot_time: @hardware.boot_time, host: @hardware.host, install_date: @hardware.install_date, make: @hardware.make, model: @hardware.model, os: @hardware.os, os_version: @hardware.os_version, owner: @hardware.owner, physical_memory: @hardware.physical_memory, processor: @hardware.processor, serial_number: @hardware.serial_number, type: @hardware.type } }
    end

    assert_redirected_to hardware_url(Hardware.last)
  end

  test "should show hardware" do
    get hardware_url(@hardware)
    assert_response :success
  end

  test "should get edit" do
    get edit_hardware_url(@hardware)
    assert_response :success
  end

  test "should update hardware" do
    patch hardware_url(@hardware), params: { hardware: { available_physical_memory: @hardware.available_physical_memory, boot_time: @hardware.boot_time, host: @hardware.host, install_date: @hardware.install_date, make: @hardware.make, model: @hardware.model, os: @hardware.os, os_version: @hardware.os_version, owner: @hardware.owner, physical_memory: @hardware.physical_memory, processor: @hardware.processor, serial_number: @hardware.serial_number, type: @hardware.type } }
    assert_redirected_to hardware_url(@hardware)
  end

  test "should destroy hardware" do
    assert_difference('Hardware.count', -1) do
      delete hardware_url(@hardware)
    end

    assert_redirected_to hardwares_url
  end
end
