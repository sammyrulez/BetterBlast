require 'Ricombinator'
require 'bio'

class AaSequencesController < ApplicationController
  # GET /aa_sequences
  # GET /aa_sequences.xml
  def index
    @aa_sequences = AaSequence.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aa_sequences }
    end
  end

  # GET /aa_sequences/1
  # GET /aa_sequences/1.xml
  def show
    @aa_sequence = AaSequence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aa_sequence }
    end
  end

  # GET /aa_sequences/new
  # GET /aa_sequences/new.xml
  def new
    @aa_sequence = AaSequence.new
    @ref_table_data = [  ["Standard (Eukaryote)", 1 ],  ["Vertebrate Mitochondrial" ,2 ]]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aa_sequence }
    end
  end

  # GET /aa_sequences/1/edit
  def edit
    @aa_sequence = AaSequence.find(params[:id])
  end

  # POST /aa_sequences
  # POST /aa_sequences.xml
  def create
    @aa_sequence = AaSequence.new(params[:aa_sequence])

    respond_to do |format|
      if @aa_sequence.save
      	r = Ricombinator.new
      	results = r.computeStrings(@aa_sequence.content,@aa_sequence.ref_table.to_i)
      	
      	results.each{|na|
      		seq = NaSequence.new
      		seq.content = na
      		seq.aa_sequence = @aa_sequence
      		seq.computed = 0
      		seq.save
      	}
      	
        format.html { redirect_to(@aa_sequence, :notice => 'Aminoacid sequence was successfully created.') }
        format.xml  { render :xml => @aa_sequence, :status => :created, :location => @aa_sequence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aa_sequence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aa_sequences/1
  # PUT /aa_sequences/1.xml
  def update
    @aa_sequence = AaSequence.find(params[:id])

    respond_to do |format|
      if @aa_sequence.update_attributes(params[:aa_sequence])
        format.html { redirect_to(@aa_sequence, :notice => 'Aa sequence was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aa_sequence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aa_sequences/1
  # DELETE /aa_sequences/1.xml
  def destroy
    @aa_sequence = AaSequence.find(params[:id])
    @aa_sequence.destroy

    respond_to do |format|
      format.html { redirect_to(aa_sequences_url) }
      format.xml  { head :ok }
    end
  end
end
