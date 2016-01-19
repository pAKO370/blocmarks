require 'rails_helper'

RSpec.describe IncomingController, type: :controller do
  describe "POST create" do
    describe "forwarded mail from mailgun" do
      let(:url) { "http://google.com" }
      let(:topic_title) { "MyTopic" }
      let(:request) { post :create, {sender: user.email, subject: topic_title, 'body-plain' => url } }

      context "from a known user" do
        let(:user) { User.new(email: 'a@a.com', password: '12341234') }
        before do
          user.skip_confirmation!
          user.save
        end


        context "for an existing topic" do
          let(:topic) { Topic.create!(title: topic_title) }

          it "creates a bookmark" do
            expect {
              request
            }.to change(Bookmark, :count).by(1)
          end

          it "creates a bookmark in that topic" do
            expect {
              request
            }.to change(topic.bookmarks, :count).by(1)
          end

          it "creates a bookmark with the correct url" do
            request
            expect(Bookmark.last.url).to eq('http://google.com')
          end
        end

        context "for a non-existing topic" do
          it "creates a topic" do
            expect {
              post :create, {sender: user.email, subject: "Different Topic", 'body-plain' => url}
            }.to change(Topic, :count).by(1)
          end
        end
        context "for a non-existing user" do
          it "does not create a new topic" do
            expect {
              post :create, {sender: "new@new.com", subject: "new subject", 'body-plain' => url}
              }.to_not change(Topic, :count)
          end
          it "does not create a bookmark" do
            expect {
              post :create, {sender: "new@new.com", subject: "new subject", 'body-plain' => url}
              }.to_not change(Bookmark, :count)
          end
        end
      end
    end
  end
end