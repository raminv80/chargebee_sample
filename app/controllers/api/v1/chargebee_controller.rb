class Api::V1::ChargebeeController < Api::V1::ApiController
	def event_listener
		# Getting the json content from the request.
		body = request.body.string
		# Assigning the recieved content to ChargeBee Event object.
		event =  ChargeBee::Event.deserialize(body)

		log_event(event)

		case event.event_type
		when "invoice_created"
			#invoice_obj = event.content.invoice
		when "subscription_created"
			#handle_subscription(event)
		when "subscription_cancelled"
			handle_unsubscription(event)
		end

		expose 'success'
	end

	private

	def handle_subscription(event)
		#event based subscription downside is the delay of event propagation
		subscription_id = event.content.subscription.id
		customer_id = event.content.customer.id
		email = event.content.customer.email
		Subscription.find_or_create_subscription(email, subscription_id, customer_id)
	end

	def handle_unsubscription(event)
		#event based subscription downside is the delay of event propagation
		subscription_id = event.content.subscription.id
		customer_id = event.content.customer.id
		email = event.content.customer.email
		Subscription.cancel_subscription(email, subscription_id, customer_id)
	end

	def log_event(event)
		log = CbEvent.new
		log.event_id = event.id
		log.event_occured_at = event.occurred_at
		log.event_source = event.source
		log.event_type = event.event_type
		log.event_data = event.to_s
		log.save
	end

end
