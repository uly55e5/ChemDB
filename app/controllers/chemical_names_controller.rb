class ChemicalNamesController < ApplicationController
  # GET /chemical_names
  # GET /chemical_names.xml
  def index
    @chemical_names = ChemicalName.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chemical_names }
    end
  end

  # GET /chemical_names/1
  # GET /chemical_names/1.xml
  def show
    @chemical_name = ChemicalName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chemical_name }
    end
  end

  # GET /chemical_names/new
  # GET /chemical_names/new.xml
  def new
    @chemical_name = ChemicalName.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chemical_name }
    end
  end

  # GET /chemical_names/1/edit
  def edit
    @chemical_name = ChemicalName.find(params[:id])
  end

  # POST /chemical_names
  # POST /chemical_names.xml
  def create
    @chemical_name = ChemicalName.new(params[:chemical_name])

    respond_to do |format|
      if @chemical_name.save
        format.html { redirect_to(@chemical_name, :notice => 'Chemical name was successfully created.') }
        format.xml  { render :xml => @chemical_name, :status => :created, :location => @chemical_name }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chemical_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chemical_names/1
  # PUT /chemical_names/1.xml
  def update
    @chemical_name = ChemicalName.find(params[:id])

    respond_to do |format|
      if @chemical_name.update_attributes(params[:chemical_name])
        format.html { redirect_to(@chemical_name, :notice => 'Chemical name was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chemical_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chemical_names/1
  # DELETE /chemical_names/1.xml
  def destroy
    @chemical_name = ChemicalName.find(params[:id])
    @chemical_name.destroy

    respond_to do |format|
      format.html { redirect_to(chemical_names_url) }
      format.xml  { head :ok }
    end
  end
end
