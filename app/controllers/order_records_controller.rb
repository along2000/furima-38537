class OrderRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set, only: [:index, :create]

  def index
    @order_record_payment = OrderRecordPayment.new
  end

  def create
    @order_record_payment = OrderRecordPayment.new(order_params)
      if @order_record_payment.valid?
        payment
        @order_record_payment.save
        return redirect_to root_path
      else
        render 'index'
      end
  end

  private

  def item_set
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.order_record.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_record_payment).permit(:postcode, :delivery_source_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def payment
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
