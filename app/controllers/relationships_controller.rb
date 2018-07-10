class RelationshipsController < ApplicationController
	def create
		followed = check_followed params[:follow][:monitored_id]
		if followed == nil
			relationship = current_user.relationships.new relationship_params
			if relationship.save
			end
		end
	end

	def destroy
		followed = Relationship.find_by id: params[:followed][:id]
		byebug
		if followed != nil
			followed.destroy
		end
	end

	def relationship_params
		params.require(:follow).permit Relationship::ATTRIBUTES_PARAMS
	end
end
