RSpec.describe CommentsController, type: :controller do
  describe "GET actions" do
    it "GET index" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
