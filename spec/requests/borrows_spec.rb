require 'rails_helper'

RSpec.describe 'Items API' do
  # Initialize the test data
  let!(:book) { create(:book) }
  let!(:borrows) { create_list(:item, 20, book_id: book.id) }
  let(:book_id) { book.id }
  let(:id) { borrows.first.id }

  # Test suite for GET /books/:book_id/borrows
  describe 'GET /books/:book_id/borrows' do
    before { get "/books/#{book_id}/borrows" }

    context 'when book exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all book borrows' do
        expect(json.size).to eq(20)
      end
    end

    context 'when book does not exist' do
      let(:book_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # Test suite for GET /books/:book_id/borrows/:id
  describe 'GET /books/:book_id/borrows/:id' do
    before { get "/books/#{book_id}/borrows/#{id}" }

    context 'when book item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when book item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for PUT /books/:book_id/borrows
  describe 'POST /books/:book_id/borrows' do
    let(:valid_attributes) { { name: 'Visit Narnia', retuned: false } }

    context 'when request attributes are valid' do
      before { post "/books/#{book_id}/borrows", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/books/#{book_id}/borrows", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /books/:book_id/borrows/:id
  describe 'PUT /books/:book_id/borrows/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/books/#{book_id}/borrows/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Item.find(id)
        expect(updated_item.name).to match(/Mozart/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for DELETE /books/:id
  describe 'DELETE /books/:id' do
    before { delete "/books/#{book_id}/borrows/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end