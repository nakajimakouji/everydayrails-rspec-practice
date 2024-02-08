require 'rails_helper'

RSpec.describe "Projects", type: :request do
  # 認証済みのユーザーとして
  context "as an authenticated user" do
    before do
      @user = FactoryBot.create(:user)
    end

    # 有効な属性値の場合
    context "with valid attributes" do
      it "responds successfully" do
        sign_in @user
        get root_path
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end

      it "display a project" do
        project = FactoryBot.create(:project, owner: @user)
        sign_in @user
        get project_path(project)
        expect(response).to have_http_status "200"
      end

      # プロジェクトを追加できること
      it "adds a project" do
        project_params = FactoryBot.attributes_for(:project)
        sign_in @user
        expect {
          post projects_path, params: { project: project_params }
        }.to change(@user.projects, :count).by(1)
      end
    end

    # 無効な属性値の場合
    context "with invalid attributes" do
      # プロジェクトを追加できないこと
      it "does not add a project" do
        project_params = FactoryBot.attributes_for(:project, :invalid)
        sign_in @user
        expect {
          post projects_path, params: { project: project_params }
        }.to_not change(@user.projects, :count)
      end
    end
  end

  context "as a guest" do
    it "returns a 302 response" do
      get projects_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to "/users/sign_in"
    end
  end
end
