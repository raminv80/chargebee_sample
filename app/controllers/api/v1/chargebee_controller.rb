class Api::V1::ChargebeeController < Api::V1::ApiController
	def event_listener
		expose 'success'
	end
end
