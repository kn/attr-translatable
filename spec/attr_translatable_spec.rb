# encoding: UTF-8

require 'spec_helper'

describe ActiveRecord::Base do

  before :each do
    @post = Post.create :title => "Blog Title", :content => "Blog Content", :url => "www.katsuyan.me/post/1"
  end

  context "when attr_translatable is called with invalid args" do
    describe "#attr_translatable" do
      it "raises an error if a given attr is not defined" do
        lambda { Post.attr_translatable :attr_undefined }.should raise_error ArgumentError
      end
      it "raises an error if a given attr is not a string" do
        lambda { Post.attr_translatable :votes }.should raise_error ArgumentError
      end
    end
  end

  context "when attr_translatable is called with valid args" do
    before :each do
      Post.attr_translatable :title, :content
    end

    describe "#update_translation" do
      context "when non translatable attribute is given" do
        it "raises an error" do
          lambda { @post.update_translation(:url, :ja, "アドレス") }.should raise_error ArgumentError
        end
      end
    end

    describe "#translate" do
      context "when translatable attribute is given" do
        context "translation exists" do
          before :each do
            @ja_translation = "ブログのタイトル"
            @post.update_translation(:title, :ja, @ja_translation)
          end
          it "returns a translation" do
            @post.translate(:title, :ja).should == @ja_translation
            @post.t(:title, :ja).should == @ja_translation
          end
        end

        context "translation does not exist" do
          it "returns a default string" do
            @post.translate(:title, :fr).should == "Blog Title"
            @post.t(:title, :fr).should == "Blog Title"
          end
        end
      end
      context "when non translatable attribute is given" do
        it "should raise an error" do
          lambda { @post.translate(:url, :ja) }.should raise_error ArgumentError
          lambda { @post.t(:url, :ja) }.should raise_error ArgumentError
        end
      end
    end
  end
end