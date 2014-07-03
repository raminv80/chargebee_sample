require 'rails_helper'

describe Api::V1::ChargebeeController do
  describe "POST event_listener" do
    let!(:params) do
    	{"id"=>"ev_2se7EuyMOj10Rvh9gn", "occurred_at"=>1404446515, "source"=>"hosted_page", "object"=>"event", "content"=>{"subscription"=>{"id"=>"2se7EuyMOj10NAC9gZ", "plan_id"=>"basic", "plan_quantity"=>1, "status"=>"active", "current_term_start"=>1404446515, "current_term_end"=>1407124915, "created_at"=>1404446515, "started_at"=>1404446515, "activated_at"=>1404446515, "due_invoices_count"=>0, "object"=>"subscription"}, "customer"=>{"id"=>"2se7EuyMOj10NAC9gZ", "first_name"=>"ads", "last_name"=>"asd", "email"=>"asd@asd.com", "auto_collection"=>"on", "created_at"=>1404446515, "object"=>"customer", "card_status"=>"valid", "billing_address"=>{"first_name"=>"asd", "last_name"=>"asd", "phone"=>"123", "object"=>"billing_address"}}, "card"=>{"customer_id"=>"2se7EuyMOj10NAC9gZ", "status"=>"valid", "gateway"=>"chargebee", "first_name"=>"ads", "last_name"=>"asd", "iin"=>"411111", "last4"=>"1111", "card_type"=>"visa", "expiry_month"=>12, "expiry_year"=>2020, "object"=>"card", "masked_number"=>"************1111"}, "invoice"=>{"id"=>"17", "customer_id"=>"2se7EuyMOj10NAC9gZ", "subscription_id"=>"2se7EuyMOj10NAC9gZ", "recurring"=>true, "status"=>"paid", "start_date"=>1404446515, "end_date"=>1404446515, "amount"=>10, "paid_on"=>1404446515, "object"=>"invoice", "sub_total"=>10, "tax"=>0, "line_items"=>[{"date_from"=>1404446515, "date_to"=>1407124915, "unit_amount"=>10, "quantity"=>1, "tax"=>0, "object"=>"line_item", "amount"=>10, "description"=>"Basic", "type"=>"charge", "entity_type"=>"plan", "entity_id"=>"basic"}], "linked_transactions"=>[{"txn_id"=>"txn_2se7EuyMOj10Rte9gh", "applied_amount"=>10, "txn_type"=>"payment", "txn_status"=>"success", "txn_date"=>1404446515, "txn_amount"=>10}]}}, "event_type"=>"subscription_created", "webhook_status"=>"re_scheduled", "webhook_failure_reason"=>"Received error code 500 from server. Your server has returned internal server error code. Please check the server logs", "secret"=>"testchargebe3"}.to_json
    end

    let!(:header) do
    	{"Content-Type" => "application/json"}
    end

    it "assigns @teams" do
      post :event_listener, params
      expect(response.status).to eq(200)
    end

  end
end