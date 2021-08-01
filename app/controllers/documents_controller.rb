class DocumentsController < ApplicationController

  def index
    @documents = Document.all_valid
  end

  def show
    
  end
end