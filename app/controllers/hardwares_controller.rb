class HardwaresController < ApplicationController
  before_action :set_hardware, only: [:show, :edit, :update, :destroy]
  before_action :build_lists, only: [:new, :edit, :update, :create]

  # GET /hardwares
  def index
    if user_signed_in? && current_user.hardware
      @hardwares = Hardware.where(disposed_reason: [nil, ''])
    else
      redirect_to signout_path and return
    end
  end

  # GET /hardwares/1
  def show
    @employee = Employee.find(@hardware.employee_id)
  end

  # GET /hardwares/new
  def new
    @new = true
    @hardware = Hardware.new
  end

  # GET /hardwares/1/edit
  def edit
    @new = false
  end

  # POST /hardwares
  def create
    hp = hardware_params
    if hp[:owner].blank?
      # set employee_id to null
      hp[:employee_id] = ''
    else
      @employees.each do |e|
        if e[:name] == hp[:owner]
          hp[:employee_id] = e[:id]
          break
        end
      end
    end
    @hardware = Hardware.new(hp)

    respond_to do |format|
      if @hardware.save
        format.html { redirect_to hardwares_path, notice: 'Hardware was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /hardwares/1
  def update
    hp = hardware_params
    if !hp[:return_date].blank? && !hp[:issue_date].blank? && hp[:return_date] >= hp[:issue_date]
      # the hardware was returned so get rid of the old owner
      hp[:owner] = ''
    end
    if hp[:owner].blank?
      # set employee_id to null
      hp[:employee_id] = ''
    else
      @employees.each do |e|
        if e[:name] == hp[:owner]
          hp[:employee_id] = e[:id]
          break
        end
      end
    end

    respond_to do |format|
      if @hardware.update(hp)
        format.html { redirect_to hardwares_path, notice: 'Hardware was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /hardwares/1
  def destroy
    @hardware.destroy
    respond_to do |format|
      format.html { redirect_to hardwares_url, notice: 'Hardware was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hardware
      @hardware = Hardware.find(params[:id])
    end

    def build_lists
      trucks = Truck.where(start_decommission: false)
      @trucks = []
      trucks.each do |e|
        @trucks.push(e.truck_number.gsub(' ', '~'))
      end
      @trucks.sort!
      employees = Employee.where(Employee_Status: "Active")
      @employees = []
      @employee_list = []
      @tilda_employee_list = []
      employees.each do |e|
        name = e.Firstname + ' ' + e.Lastname
        tilda_name = name.gsub(' ', '~')
        @tilda_employee_list.push(tilda_name)
        @employee_list.push(name)
        hash = {name: name, id: e.id}
        @employees.push(hash)
      end
      @employee_list.sort!
      @tilda_employee_list.sort!
      @tablet = false
      @laptop = false
      @desktop = false
      @phone = false
      @printer = false
      @ipad = false
      @other = false
      if @hardware
        if @hardware.device_type == "iPad"
          @ipad = true
        end
        if @hardware.device_type == "Tablet"
          @tablet = true
        end
        if @hardware.device_type == "Laptop"
          @laptop = true
        end
        if @hardware.device_type == "Desktop"
          @desktop = true
        end
        if @hardware.device_type == "Phone"
          @phone = true
        end
        if @hardware.device_type == "Printer"
          @printer = true
        end
        if @hardware.device_type == "Other"
          @other = true
        end
      if @hardware.truck
          @employee_list = @trucks
        end
      end

      @device = ["Desktop", "iPad", "Laptop", "Phone", "Printer", "Tablet", "Other"]
      @disposal_reason = ["Broken", "Lost", "Obsolete", "Stolen"]
      @os = ["Windows 7", "Windows 10", "Mac OS"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hardware_params
      params.require(:hardware).permit(:owner, :host, :os, :os_version, :install_date, :boot_time, :make, :model, :type, :processor, :physical_memory, :available_physical_memory, :serial_number, :issue_date, :return_date, :employee_id, :truck, :dock, :monitor, :disposed_date, :disposed_reason, :computer_name, :phone_number, :imei, :toner_ink, :device_type, :receive_date, :manufacture_year)
    end
end
