class NotesController < ApplicationController
  def index
    render json: Note.all
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
