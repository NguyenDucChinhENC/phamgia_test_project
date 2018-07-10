class RelationshipsController < ApplicationController
	def create
		followed = check_followed params[:follow][:monitored_id]
		if followed == nil
			relationship = current_user.relationships.new relationship_params
			if relationship.save
				redirect_back(:fallback_location => foreman_tasks_task_path(task))
			end
		end
	end

	def destroy
		followed = Relationship.find_by id: params[:followed][:id]
		if followed != nil
			followed.destroy
			redirect_back(:fallback_location => foreman_tasks_task_path(task))
		end
	end

	private
	
	def relationship_params
		params.require(:follow).permit Relationship::ATTRIBUTES_PARAMS
	end
end
