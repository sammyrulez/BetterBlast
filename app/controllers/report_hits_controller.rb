class ReportHitsController < ApplicationController
  # GET /report_hits
  # GET /report_hits.xml
  def index
    @report_hits = ReportHit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @report_hits }
    end
  end

  # GET /report_hits/1
  # GET /report_hits/1.xml
  def show
    @report_hit = ReportHit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report_hit }
    end
  end

  # GET /report_hits/new
  # GET /report_hits/new.xml
  def new
    @report_hit = ReportHit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report_hit }
    end
  end

  # GET /report_hits/1/edit
  def edit
    @report_hit = ReportHit.find(params[:id])
  end

  # POST /report_hits
  # POST /report_hits.xml
  def create
    @report_hit = ReportHit.new(params[:report_hit])

    respond_to do |format|
      if @report_hit.save
        format.html { redirect_to(@report_hit, :notice => 'Report hit was successfully created.') }
        format.xml  { render :xml => @report_hit, :status => :created, :location => @report_hit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report_hit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /report_hits/1
  # PUT /report_hits/1.xml
  def update
    @report_hit = ReportHit.find(params[:id])

    respond_to do |format|
      if @report_hit.update_attributes(params[:report_hit])
        format.html { redirect_to(@report_hit, :notice => 'Report hit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report_hit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /report_hits/1
  # DELETE /report_hits/1.xml
  def destroy
    @report_hit = ReportHit.find(params[:id])
    @report_hit.destroy

    respond_to do |format|
      format.html { redirect_to(report_hits_url) }
      format.xml  { head :ok }
    end
  end
end
