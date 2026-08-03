class RelationshipsController < ApplicationController
  def create
    @relationship = Current.user.active_relationships.build(followed_id: params[:followed_id])
    @relationship.save
    redirect_to request.referer
  end

  def destroy
    @relationship = Current.user.active_relationships.find(params[:id])
    @relationship.destroy
    redirect_to request.referer
  end

end
