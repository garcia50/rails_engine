class InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.all 
  end

end