require 'rails_helper'

RSpec.describe 'Books API Request' do 
  it 'can find a given number of books for a given location', :vcr do 
    get api_v1_book_search_path, params: { location: 'denver,co', quantity: 5 }

    json_data = parse_json[:data]

    expect(response.status).to eq(200)

    expect(parse_json).to be_a(Hash)
    expect(json_data).to be_a(Hash)
    expect(json_data.keys).to eq([:id, :type, :attributes])

    expect(json_data[:id]).to eq(nil)
    expect(json_data[:type]).to eq('books')
    expect(json_data[:attributes]).to be_a(Hash)

    expect(json_data[:attributes].keys).to eq([:destination, :forecast, :total_books_found, :books])
    expect(json_data[:attributes][:destination]).to be_a(String)
    expect(json_data[:attributes][:forecast]).to be_a(Hash)
    expect(json_data[:attributes][:forecast].keys).to eq([:summary, :temperature])
    expect(json_data[:attributes][:forecast][:summary]).to be_a(String)
    expect(json_data[:attributes][:forecast][:temperature]).to be_a(Float)
    expect(json_data[:attributes][:total_books_found]).to be_a(Integer)
    expect(json_data[:attributes][:books]).to be_a(Array)
    expect(json_data[:attributes][:books].count).to eq(5)
    expect(json_data[:attributes][:books].first.keys).to eq([:isbn, :title, :publisher])
  end

  it 'throws an error if location is blank', :vcr do 
    get api_v1_book_search_path, params: { location: '', quantity: 5 }

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq("Please enter valid location and quantity.")
  end

  it 'throws an error if quantity is blank', :vcr do 
    get api_v1_book_search_path, params: { location: 'denver,co', quantity: '' }

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq("Please enter valid location and quantity.")
  end

  it 'throws an error if quantity is less than 0', :vcr do 
    get api_v1_book_search_path, params: { location: 'denver,co', quantity: -1 }

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq("Please enter valid location and quantity.")
  end

  it 'does not receive any params', :vcr do 
    get api_v1_book_search_path
    
    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq("Please enter valid location and quantity.")
  end
end