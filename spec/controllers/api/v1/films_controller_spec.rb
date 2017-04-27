require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::FilmsController do
	describe "GET#index" do
		before(:each) do 
			5.times { FactoryGirl.create :film }
		end

		context "when is not receiving any film_ids parameter" do
			before(:each) do
				get :index
			end

			it "returns 5 records from the database" do
				films_response = json_response
				expect(films_response[:films].size).to eq(5)
			end

			it { expect(json_response).to have_key(:meta) }
      		it { expect(json_response[:meta]).to have_key(:pagination) }
      		it { expect(json_response[:meta][:pagination]).to have_key(:per_page) }
      		it { expect(json_response[:meta][:pagination]).to have_key(:total_pages) }
      		it { expect(json_response[:meta][:pagination]).to have_key(:total_objects) }

		end
	end
end

