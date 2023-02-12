class OrderRecordsController < ApplicationController
  def index
    @order_record_payment = OrderRecordPaymentItem.find(params[:item_id])
  end

  def create
    
  end
end
