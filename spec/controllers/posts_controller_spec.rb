# require 'rails_helper'

# RSpec.describe PostsController, type: :controller do
#   before do
#     @user = FactroyBot.create(:lily)
#     @other_user = FactroyBot.create(:bob)
#     @post = FactoryBot.create(:post, user: @user)
#   end
#   describe "#index" do
#     it "一覧表示" do
#       sign_in @user
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "#show" do
#     context "ログイン時" do
#       it "詳細ページが表示される" do
#         sign_in @user
#         get :show, params: {id: @post.user_id}
#         expect(response).to have_http_status(:success)
#       end
#     end
#     context "非ログイン時" do
#       get :show, params: {id: @post.user_id}
#       expect(response).to redirect_to new_user_session_path
#     end
#   end

#   describe "#create" do
#     context "ログイン時" do
#       it "投稿成功" do
#         sign_in @user
#         post_params = FactoryBot.attributes_for(:post)
#         expect{
#         post :create, params: {post: post_params}
#         }.to change(@user.posts, :count).by(1)
#       end
#       it "投稿失敗" do
#         sign_in @user
#         post_params = FactoryBot.attributes_for(:post, name: "")
#         expect{
#         post :create, params: {post: post_params}
#         }.to change(@user.posts, :count).by(0)
#       end
#     end
#     context "非ログイン時" do
#       it "記事の投稿に失敗し、ログインページにリダイレクトされる" do
#         post_params = FactoryBot.attributes_for(:post)
#         expect{
#         post :create, params: {post: post_params}
#         }.to change(@user.posts, :count).by(0)
#         expect(response).to redirect_to new_user_session_path
#       end
#     end
#   end
# describe "#new" do
#   context "ログイン時" do
#       it "投稿ページ表示" do
#           sign_in @user
#           get :new
#           expect(response).to have_http_status(:success)
#       end
#   end
#   context "非ログイン時" do
#       it "ログインページにリダイレクトされる" do
#           get :new
#           expect(response).to redirect_to new_user_session_path
#       end
#   end
# end
# describe "#edit" do
#   context "非ログイン時" do
#       it "ログインページにリダイレクトされる" do
#           get :edit, params: {id: @post.id}
#           expect(response).to redirect_to new_user_session_path
#       end
#   end
#   context "ログイン時" do
#       it "編集ページが表示される" do
#           sign_in @user
#           get :edit, params: {id: @post.id}
#           expect(response).to have_http_status(:success)
#       end
#       it "他のユーザーからはリダイレクト" do
#           sign_in @other_user
#           get :edit, params: {id: @post.id}
#           expect(response).to redirect_to root_path
#       end
#   end
# end
# describe "#update" do
#     context "非ログイン時" do
#         it "ログインページにリダイレクトされる" do
#             post_params = FactoryBot.attributes_for(:post, name: "test")
#             patch :update, params: {id: @post.id, post: post_params}
#             expect(response).to redirect_to new_user_session_path
#         end
#     end
#     context "ログイン時" do
#       it "投稿の更新に成功、投稿詳細にリダイレクトされる" do
#           sign_in @user
#           post_params = FactoryBot.attributes_for(:post, name: "test")
#           patch :update, params: {id: @post.id, post: post_params}
#           expect(response).to redirect_to post_path(@post)
#       end
#     end
#   end
# end
