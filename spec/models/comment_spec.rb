require 'rails_helper'
  describe Comment do
    
    context "presence of body" do
      before { 
        @user = User.new();
        @product = Product.new()
      }
        it "should be invalid without the needed stuff" do
          comment = Comment.new(body: nil, user: nil, product: nil, rating: "blub")
          comment.valid?
          expect(comment).to be_invalid
        end

        it "should be valid (everything correctly included)" do
          comment = Comment.new(body: "Testcontent", rating: 5, user: @user, product: @product)
          comment.valid?
          expect(comment).to be_valid
        end

        it "should be invalid because rating is a string" do
          comment = Comment.new(body: "Testcontent", rating: "Test", user: @user, product: @product) 
          comment.valid?
          expect(comment).to be_invalid
        end

        #
        # why does it still
        # work, even the rating is
        # now a string?
        #
        it "it still works although rating is a string and should be integer" do
          comment = Comment.new(body: "Testcontent", rating: "5", user: @user, product: @product) 
          comment.valid?
          expect(comment).to be_valid
        end
        #
        #
        #

        it "should fail becaus body is empty" do
          comment = Comment.new(body: "", rating: 5, user: @user, product: @product) 
          comment.valid?
          expect(comment).to be_invalid
        end
    end
  end
