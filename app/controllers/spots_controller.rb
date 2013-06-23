class SpotsController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :show, :in_area]
  before_filter :find_spot, :only => [:edit, :update, :destroy]

  def index
    @spots = Spot.order('created_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @spots }
    end
  end

  def show
    @spot = Spot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @spot }
    end
  end

  def new
    @spot = Spot.new
    @spot.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @spot }
    end
  end

  def edit
  end

  def create
    @spot = Spot.new(params[:spot])

    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, :notice => 'Spot was successfully created.' }
        format.json { render :json => @spot, :status => :created, :location => @spot }
      else
        format.html { render :action => "new" }
        format.json { render :json => @spot.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @spot.update_attributes(params[:spot])
        format.html { redirect_to @spot, :notice => 'Spot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @spot.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @spot.destroy

    respond_to do |format|
      format.html { redirect_to spots_url }
      format.json { head :no_content }
    end
  end

  def in_area
    @spots = Spot.in_area(params)
    render :json => @spots.to_json
  end

  private
  def find_spot
    @spot = Spot.find(params[:id])
    redirect_to root_url, alert: 'Unauthorized' if @spot.user != current_user
  end
end
