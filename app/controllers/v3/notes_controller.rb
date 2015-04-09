class V3::NotesController < ApplicationController
  def index
    render json: {v1: 'yeah...v3'}
  end

  def create
    render json: Note.create(params.permit(:title, :content))
  end

  def update
    note = Note.find(params[:id])
    note.title = params[:title]
    note.content = params[:content]
    note.save!
    render json: note
  end

  def destroy
    note = Note.find(params[:id])
    render json: note.destroy
  end
end
