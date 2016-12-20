class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
    render :json => @notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find_by_id(params[:id])
    render :json => @note
  end

  # GET /notes/new
  def new
    @note = Note.new
    @note.user = current_user
  end

  # GET /notes/1/edit
  def edit
        @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    print(@note)
    respond_to do |format|
      if @note.save
        format.json { render :show, status: :created, location: @note }
      else
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update_attributes(note_params)
        format.json { render :show, status: :ok, location: @note }
      else
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:id, :content, :created_at)
    end
end
