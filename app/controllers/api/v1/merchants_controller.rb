class Api::V1::MerchantsController < ApplicationController

  def index
    render json: Merchant.all
  end

  def show
    render json: Merchant.find(params[:id])
  end

  def most_revenue
    render json: Merchant.most_revenue(params[:quantity])
  end

  def most_items
    render json: Merchant.most_items(params[:quantity])
  end

  def revenue
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.total_revenue
  end

  def favorite
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.favorite
  end

  def items
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.items
  end

  def invoices
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.invoices
  end

  def pending
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.pending
  end

  def find
    render json: Merchant.find_by(merchant_params)
  end

  def find_all
    render json: Merchant.where(merchant_params)
  end

  private def merchant_params
    params.require(:merchant).permit(:name, :id, :created_at, :updated_at)
  end
 
end
