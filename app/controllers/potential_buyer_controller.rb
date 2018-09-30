class PotentialBuyerController < ApplicationController

  def mark_interested
    @potential_buyer = PotentialBuyer.new
    @potential_buyer.house_id = params[:house_id]
    @potential_buyer.user_id = current_user.id
    redirect_to house_path(params[:house_id]), notice: 'Marked as interested.' if @potential_buyer.save
  end

  def mark_uninterested
    @potential_buyer = PotentialBuyer.find_by user_id: current_user.id, house_id: params[:house_id]
    redirect_to house_path(params[:house_id]), notice: 'Marked as uninterested.' if @potential_buyer.destroy
  end
end
