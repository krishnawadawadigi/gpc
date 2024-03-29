class BatchesController < ApplicationController
  # GET /batches
  # GET /batches.json
  def index
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:department_id])
    
    @batches = @department.batches

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @batches }
    end
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:department_id])

    @batch = Batch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @batch }
    end
  end

  # GET /batches/new
  # GET /batches/new.json
  def new
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:department_id])

    @batch = Batch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @batch }
    end
  end

  # GET /batches/1/edit
  def edit
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:department_id])

    @batch = Batch.find(params[:id])
  end

  # POST /batches
  # POST /batches.json
  def create
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:department_id])

    @batch = Batch.new(params[:batch])

    @batch.department = @department
    @batch.active = 1

    respond_to do |format|
      if @batch.save
        format.html { redirect_to institute_department_batch_path(@institute, @department, @batch), notice: 'Batch was successfully created.' }
        format.json { render json: @batch, status: :created, location: @batch }
      else
        format.html { render action: "new" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /batches/1
  # PUT /batches/1.json
  def update
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:department_id])

    @batch = Batch.find(params[:id])
    @batch.department = @department
    @batch.active = 1

    respond_to do |format|
      if @batch.update_attributes(params[:batch])
        format.html { redirect_to institute_department_batch_path(@institute, @department, @batch), notice: 'Batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:department_id])

    @batch = Batch.find(params[:id])
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to institute_department_batches_path(@institute, @department) }
      format.json { head :no_content }
    end
  end
end
