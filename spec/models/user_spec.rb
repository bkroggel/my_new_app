require 'rails_helper'
  describe User do
    
    # context "first and last name present" do
    #   before { @user = User.new(first_name: "John", last_name: "Smith") }

    #   it "should return first and last" do
    #     expect(@user.full_name).to eq "John Smith"
    #   end
    # end

    # context "last name missing" do
    #   before { @user = User.new(first_name: "John") }

    #   it "should return first name only" do
    #     expect(@user.full_name).to eg "John"
    #   end
    # end

    # context "first name missing" do
    #   before { @user = User.new(last_name: "Smith") }

    #   it "should return last name only" do
    #     expect(@user.full_name).to eq "Smith"
    #   end
    # end

    # context "no name present" do
    #   before { @user = User.new() }

    #   it "should return nothing" do
    #     expect(@user.full_name).to eq ""
    #   end
    # end

    context "show input by user" do
      before { @user = User.new(first_name: "John", last_name: "Smith", email: "john@smith.com") }

      it "should return first name" do
        expect(@user.first_name).to eq "John"
      end

      it "should return last name" do
        expect(@user.last_name).to eq "Smith"
      end

      it "should return email" do
        expect(@user.email).to eq "john@smith.com"
      end

    end
  end
