class CollaborationsController < ApplicationController

  def new
    @colloboration = Collaboration.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @other_user = User.find_by email: params[:collaboration][:user_id]
    @collaboration = Collaboration.new(collaboration_params)
    authorize @collaboration
    @collaboration.user_id = @other_user.id
    @collaboration.wiki_id = @wiki.id
    if @collaboration.save
      flash[:notice] = "#{@other_user.name} has been added as a collaborator for this wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error adding a collaborator.  Please try again."
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    @collaboration = @wiki.collaborations.first
    if @collaboration.destroy
      flash[:notice] = "That collaborator has been removed from this wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error deleting the collaborator.  Please try again."
      render :new
    end
  end

  private

    def collaboration_params
      params.require(:collaboration).permit(:wiki_id, :user_id)
    end
end