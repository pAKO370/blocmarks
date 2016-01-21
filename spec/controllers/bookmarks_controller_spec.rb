require 'rails_helper'
include Pundit

describe BookmarksController, type: :controller do
  let(:user) {User.new(email: 'user1@user.com',password: '12345678')}
  let(:other_user){User.new(email:'user2@user.com', password: '12345678')}
  let(:topic){Topic.create(title: 'New Topic')}

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

      context "trying to create an bookmark for that user" do
        it "creates an item for that user" do
          expect { 
            post :create, user_id: user.id, topic_id: topic.id, bookmark: {url:'www.test.com'} 
            }.to change(Bookmark, :count).by(1)
        end
        it "creates an item with the right attributes" do
          post :create, user_id: user.id, topic_id: topic.id, bookmark: {url: 'www.test.com'}
          expect(Bookmark.url).to eq("www.test.com")
        end
      end
      context "trying to create a bookmark for another user" do
        it "doesnt create a bookmark for another user" do
          expect {
          post :create, user_id: other_user.id, topic_id: topic.id, bookmark: {url: 'www.test2.com'}
          }.to_not change(Bookmark, :count)
        end
      end
    end
  end  
end



