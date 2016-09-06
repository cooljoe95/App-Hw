require 'byebug'
class ContactSharesController < ApplicationController

  def create
    cs = ContactShare.new(contact_shares_params)
    debugger
    if cs.save
      render json: cs
    else
      render json: cs.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    cs = ContactShare.find(params[:id])
    cs.destroy!
    render json: User.all
  end



  private

  def contact_shares_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end

end
