module ApplicationHelper
	
	def print_log_message(log)
		if log.kind == 1 || log.kind == 4 || log.kind == 5|| log.kind == 6
			message = %{[#{I18n.l(log.created_at)}] #{log.description}} 	
		elsif log.kind == 2
			message = %{[#{I18n.l(log.created_at)}] New simulation started!} 	
		elsif log.kind == 3
			message = %{[#{I18n.l(log.created_at)}] Simulation finished!}
		end
		message

	end

	def manage_simulation_link
		if Simulation.started? 
			link_to "Finish simulation", manage_simulation_path, :class => 'btn btn-primary' 
		else  
			link_to "Start simulation",manage_simulation_path, :class => 'btn btn-primary' 
		end 
		
	end

	def print_organization(organization)
		if organization.idle?
			status = "idle"
		elsif organization.called?
			status = "called - Unit #{organization.last_call.id} #{organization.last_call.going? ? 'is going' : 'arrived'}"
		end
		"#{organization.name} (#{status})"
	end

	def print_pre_conditions(conditions)
		result = ""
		conditions.each do |condition|
			if condition[2]
				result += "(#{condition[0]} == #{condition[1]} || #{condition[0]} == #{condition[2]})"
			else
				result += "#{condition[0]} == #{condition[1]}"
			end
			result += " && "if condition != conditions.last
		end
		result
	end

	def print_post_conditions(conditions)
		result = ""
		conditions.each do |condition|
			result += "#{condition[0]} = #{condition[1]}"
			result += " & "if condition != conditions.last
		end
		result
	end

	def print_status_value_and_links(status)
		result = ""
		aux = status.get_values
		aux.each do |value|
			if value == status.value
				result += "<u><i>#{value}</i></u>"
			else
				result += link_to value, update_status_path(:id => status.id, :value => value), :remote => true
			end
			result += ", " if value != aux.last
		end
		raw(result)
	end
end
