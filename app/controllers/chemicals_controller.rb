class ChemicalsController < ApplicationController
  # GET /chemicals
  # GET /chemicals.xml
  def index
    @chemicals = Chemical.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chemicals }
    end
  end

  # GET /chemicals/1
  # GET /chemicals/1.xml
  def show
    @chemical = Chemical.find(params[:id])
    @names = ChemicalName.where({ :chemical_id => @chemical}).all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chemical }
    end
  end

  # GET /chemicals/new
  # GET /chemicals/new.xml
  def new
    @chemical = Chemical.new
    @chemical.chemical_names.build
    @chemical.recommended_name = ChemicalName.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chemical }
    end
  end

  # GET /chemicals/1/edit
  def edit
    @chemical = Chemical.find(params[:id])
  end

  # POST /chemicals
  # POST /chemicals.xml
  def create
    @chemical = Chemical.new(params[:chemical])
    respond_to do |format|
      if @chemical.save
        format.html { redirect_to(@chemical, :notice => 'Chemical was successfully created.') }
        format.xml  { render :xml => @chemical, :status => :created, :location => @chemical }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chemical.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chemicals/1
  # PUT /chemicals/1.xml
  def update
    params[:chemical][:existing_name_attributes] ||= {}
    @chemical = Chemical.find(params[:id])

    respond_to do |format|
      if @chemical.update_attributes(params[:chemical])
        format.html { redirect_to(@chemical, :notice => 'Chemical was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chemical.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chemicals/1
  # DELETE /chemicals/1.xml
  def destroy
    @chemical = Chemical.find(params[:id])
    @chemical.destroy

    respond_to do |format|
      format.html { redirect_to(chemicals_url) }
      format.xml  { head :ok }
    end
  end
end
