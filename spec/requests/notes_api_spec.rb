require 'rails_helper'

RSpec.describe "NotesApis", type: :request do
  # it "loads a note" do
  #   user = FactoryBot.create(:user)
  #   project = FactoryBot.create(:project,
  #     name: "Sample Project",
  #     owner: user)
  #   note = FactoryBot.create(:note,
  #     project: project)

  #   get api_notes_path, params: {
  #     user_email: user.email,
  #     user_token: user.authentication_token,
  #     user_project: user.project
  #   }

  #   expect(response).to have_http_status(:success)
  #   json = JSON.parse(response.body)
  #   expect(json.length).to eq 1
  #   note_id = json[0]["id"]

  #   get api_note_path(note_id), params: {
  #     user_email: user.email,
  #     user_token: user.authentication_token,
  #     user_project: user.project
  #   }

  #   expect(response).to have_http_status(:success)
  #   json = JSON.parse(response.body)
  #   expect(json["message"]).to eq "My important note."
  # end
end
