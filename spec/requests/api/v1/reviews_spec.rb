require 'rails_helper'

RSpec.describe "Api::V1::Reviews", type: :request do
  describe "Reviews Crud" do
    before do
      spot = Spot.create(title: "2nd title", price: 2.5, description: "this test descriptions")
      spot.reviews.create(rating: 5, comment: "this is 1st review comment")
      spot.reviews.create(rating: 4, comment: "this is 2nd review comment")
    end

    it "Index (Get)" do
      get api_v1_spot_reviews_path(Spot.last)

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).count).to eq 2
     end

    it "Create (Post)" do
      post api_v1_spot_reviews_path(Spot.first),
        params: {
          review: { 
            rating: 4,
            comment: "this test description"
          }
        }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["rating"]).to eq 4
    end

    it "Update (Put)" do
      put api_v1_spot_review_path(Spot.first, Review.last),
        params: {
          review: {
            comment: "this test descriptions 12"
          }
        }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['message']).to eq "Review successfully updated."
    end
  end
end
