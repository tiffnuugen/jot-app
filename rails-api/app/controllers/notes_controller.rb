class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    @notes = Note.all
    render json: @notes, status: 200
  end

  def show
    render json: @note, status: 200
  end
  
  def create
    @note = Note.create(note_params)
    render json: @note, status: 201
  end
  
  def update
    @note.update(note_params)
    render json: @note, status: 200
  end
  
  def destroy
    @note.destroy
    render json: {message:"note deleted", id: @note.id}
  end

  private
  def note_params
    params.require(:note).permit(:title, :body, :user_id)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
