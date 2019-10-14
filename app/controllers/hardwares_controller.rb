class HardwaresController < ApplicationController
  before_action :set_hardware, only: [:show, :edit, :update, :destroy]
  before_action :build_lists, only: [:new, :edit, :update, :create]

  # GET /hardwares
  def index
    @hardwares = Hardware.all
  end

  # GET /hardwares/1
  def show
    @employee = Employee.find(@hardware.employee_id)
  end

  # GET /hardwares/new
  def new
    @hardware = Hardware.new
  end

  # GET /hardwares/1/edit
  def edit
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
        format.html { redirect_to @hardware, notice: 'Hardware was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /hardwares/1
  def update
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
    respond_to do |format|
      if @hardware.update(hp)
        format.html { redirect_to @hardware, notice: 'Hardware was successfully updated.' }
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
      employees = Employee.where.not(Employee_Status: "Terminated")
      @employees = []
      @employee_list = []
      employees.each do |e|
        name = e.Firstname + ' ' + e.Lastname
        @employee_list.push(name)
        hash = {name: name, id: e.id}
        @employees.push(hash)
      end
      @employee_list.sort!
      @device = ["Laptop", "Phone", "Printer", "Tablet"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hardware_params
      params.require(:hardware).permit(:owner, :host, :os, :os_version, :install_date, :boot_time, :make, :model, :type, :processor, :physical_memory, :available_physical_memory, :serial_number, :issue_date, :return_date, :employee_id)
    end
end
