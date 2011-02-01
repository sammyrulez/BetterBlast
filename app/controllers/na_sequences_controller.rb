class NaSequencesController < ApplicationController
  # GET /na_sequences
  # GET /na_sequences.xml
  def index
    @na_sequences = NaSequence.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @na_sequences }
    end
  end

  # GET /na_sequences/1
  # GET /na_sequences/1.xml
  def show
    @na_sequence = NaSequence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @na_sequence }
    end
  end

  # GET /na_sequences/new
  # GET /na_sequences/new.xml
  def new
    @na_sequence = NaSequence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @na_sequence }
    end
  end

  # GET /na_sequences/1/edit
  def edit
    @na_sequence = NaSequence.find(params[:id])
  end

  # POST /na_sequences
  # POST /na_sequences.xml
  def create
    @na_sequence = NaSequence.new(params[:na_sequence])

    respond_to do |format|
      if @na_sequence.save
        format.html { redirect_to(@na_sequence, :notice => 'Na sequence was successfully created.') }
        format.xml  { render :xml => @na_sequence, :status => :created, :location => @na_sequence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @na_sequence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /na_sequences/1
  # PUT /na_sequences/1.xml
  def update
    @na_sequence = NaSequence.find(params[:id])

    respond_to do |format|
      if @na_sequence.update_attributes(params[:na_sequence])
        format.html { redirect_to(@na_sequence, :notice => 'Na sequence was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @na_sequence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /na_sequences/1
  # DELETE /na_sequences/1.xml
  def destroy
    @na_sequence = NaSequence.find(params[:id])
    @na_sequence.destroy

    respond_to do |format|
      format.html { redirect_to(na_sequences_url) }
      format.xml  { head :ok }
    end
  end
end
