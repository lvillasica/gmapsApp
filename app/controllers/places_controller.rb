class PlacesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :search]
  
  def index
    @places = Place.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
    
  end

  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @places }
    end
  end

  def new
    @place = Place.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to(@place, :notice => 'place was successfully created.') }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @place = Place.find(params[:id])
    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @lat = nil
    @long = nil
    @place = Place.find_by_place_name(params[:place][:place_name])
    if @place
      @lat = @place.lat
      @long = @place.long
    end
  end

end
