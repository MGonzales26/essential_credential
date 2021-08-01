class DocumentsController < ApplicationController

  def index
    @documents = Document.all_valid
  end

  def show
    @document = Document.find(params[:id])
  end
end