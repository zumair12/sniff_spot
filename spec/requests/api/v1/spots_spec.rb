require 'rails_helper'

RSpec.describe "Api::V1::Spots", type: :request do
  describe "Spot Crud" do
    before do
      Spot.create(title: "1st title", price: 23.1, description: "this test descriptions")
      Spot.create(title: "2nd title", price: 2.5, description: "this test descriptions")
    end

    it "Index (Get)" do
      get api_v1_spots_path

      expect(response).to have_http_status(:success)
      expect(assigns(:spots).count).to eq 2
     end

    it "Show (Get)" do
      get api_v1_spot_path(Spot.first)

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['title']).to eq "1st title"
     end

    it "Create (Post)" do
      post api_v1_spots_path(Spot.first),
        params: {
          spot: {
            title: "3rd title",
            price: 3.1,
            description: "this test description"
          }
        }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['title']).to eq "3rd title"
     end

    it "Update (Put)" do
      put api_v1_spot_path(Spot.first),
        params: {
          spot: {
            title: "Updated title"
          }
        }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['message']).to eq "Spot successfully updated."
     end

    it "Destroy (Delete)" do
      delete api_v1_spot_path(Spot.first)

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['message']).to eq "Spot successfully deleted."
     end
  end
end
