class RelationshipsController < ApplicationController
	def create
		@followed = check_followed params[:follow][:monitored_id]
		if @followed == nil
			@relationship = current_user.relationships.new relationship_params
			if @relationship.save
				respond_to do |format|
			        format.html { redirect_to relationships_url }
			        format.js
      			end
			end
		end
	end

	def destroy
		@followed = Relationship.find_by id: params[:followed][:id]
		@user =User.find_by id: @followed.user_id
		if @followed != nil
			@followed.destroy
			respond_to do |format|
			        format.html { redirect_to root_path }
			        format.js
      			end
		end
	end

	private
	
	def relationship_params
		params.require(:follow).permit Relationship::ATTRIBUTES_PARAMS
	end
end
