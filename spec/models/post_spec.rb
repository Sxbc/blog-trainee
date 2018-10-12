require 'spec_helper'

describe Post, type: :model do
  before(:all) do
    @post = build(:draft)
  end

  context 'validation test for posts' do
    it 'is valid with valid attributes' do
      expect(@post).to be_valid
    end

    it 'is not valid without a title' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'is not valid without a body' do
      @post.body =  nil
      expect(@post).to_not be_valid
    end

    it 'post title is equal to the slug url' do
      expect(@post.slug).to eq @post.title
    end

    it 'posts with the same time have diferent slugs' do
      @post = build(:draft)
      @second_post = build(:draft, title: 'Title', slug: '2-Title')
      expect(@second_post.title).to eq @post.title
      expect(@second_post.slug).to_not eq @post.slug
    end
  end
end
