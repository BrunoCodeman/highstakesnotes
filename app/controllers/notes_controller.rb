class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  before_action :authenticate_user!, 

  # GET /notes
  # GET /notes.json
  def index
    #@notes = Note.all
    @notes = current_user.notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    render json: @note
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(:content => params[:content], :user => current_user)
    print("json note "+ @note.to_json)
    if @note.save
      render :show, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    if @note.user == current_user && @note.update_attribute(:content, params[:content])
      render :show, status: :ok, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.fetch(:note, {}).permit(:content)
    end
end