require 'rails_helper'

describe PostsController do
  describe 'GET index' do
    context 'when the user is not signed in' do
      it 'returns a 302' do
        get :index
        expect(response.status).to eq(302)
      end
    end

    context 'when user is signed in' do
      it 'returns a 200' do
        user = create(:author)
        sign_in user

        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET new' do
    it 'opens the form for a new post' do
      user = create(:author)
      sign_in user
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    before do
      user = create(:author)
      sign_in user
    end

    context 'when a user create an invalid post' do
      it 'redirects to new post view' do
        params = { post: { title: '', body: 'post body' } }
        expect(post :create, params).to render_template :new
      end
    end

    context 'when a user create a post' do
      it 'changes Post count by 1' do
        params = { post: { title: 'post title', body: 'post body' } }
        expect{post :create, params}.to change{ Post.count }.by(1)
      end
    end
  end

  describe 'PATCH update' do
    context 'when a user edits a post' do
      before do
        user = create(:author)
        sign_in user
      end

      it 'when valid values' do

        post = create(:draft)
        patch :update, id: post.id, post: { title: 'New title' }
        post.reload
        expect(post.title).to eq('New title')
        expect(post).to redirect_to post_path
      end

      it 'with invalid values' do
        post = create(:draft)
        patch :update, id: post.id, post: { title: '' }
        post.title = ''
        expect(post.title).to eq('')
        expect(post).to_not be_valid
      end
    end
  end
end
