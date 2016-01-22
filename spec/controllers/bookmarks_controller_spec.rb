require 'rails_helper'
include Pundit
include Devise::TestHelpers

describe BookmarksController, type: :controller do
  let(:user) {User.new(email: 'user1@user.com',password: '12345678')}
  let(:other_user){User.new(email:'user2@user.com', password: '12345678')}
  let(:user_topic) {Topic.create!(title: 'New Topic', user: user)}
  let(:other_user_topic) {Topic.create!(title: 'New Topic', user: other_user)}


  before do 
    user.skip_confirmation!
    user.save!
    other_user.skip_confirmation!
    other_user.save!
  end

  describe "GET create" do
    context "when a user is logged in" do
      before do 
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in user
      end

      context "trying to create a bookmark for that user" do
        it "creates a bookmark" do
          expect { 
            post :create, { topic_id: user_topic.id, bookmark: {url:'www.test.com'} }
          }.to change(Bookmark, :count).by(1)
        end

        it "creates a bookmark for that user" do
          expect { 
            post :create, { topic_id: user_topic.id, bookmark: {url:'www.test.com'} }
          }.to change(user.bookmarks, :count).by(1)
        end

        it "creates a bookmark with the right attributes" do
          post :create, { topic_id: user_topic.id, bookmark: {url:'www.test.com'} }
          expect(Bookmark.last.url).to eq("www.test.com")
        end
      end

      context "trying to create a bookmark for another user" do
        it "doesnt create a bookmark for another user" do
          expect {
            post :create, { topic_id: other_user_topic.id, bookmark: {url:'www.test.com'} }
          }.to_not change(Bookmark, :count)
        end
      end
    end
  end  
end



