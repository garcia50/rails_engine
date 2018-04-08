class Api::V1::MerchantsController < ApplicationController

  def index
    render json: Merchant.all
  end

  def show
    render json: Merchant.find(params[:id])
  end

  def revenue
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.total_revenue
  end

  def items
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.item_collection
  end

  def invoices
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.invoice_collection
  end

  def find
    render json: Merchant.search(merchant_params)
  end

  private def merchant_params
    params.permit(:name, :id, :created_at, :updated_at)
  end
 
end
