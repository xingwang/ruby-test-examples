require_relative '../lib/test_examples'
require 'mocha'
require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/mini_test'
require 'webmock/minitest'

describe TestExamples do

  before do
    WebMock.disable_net_connect!
  end

  after do
    WebMock.reset!
  end

  describe 'Given a public API that successfully returns JSON' do
    before do
      test_payload = {:variables=>{:turtle=>"power"}}.to_json
      actual_payload = {:_id=>'actual'}.to_json

      master_splinter_mock = mock()
      @made_a_funny_was_called_with_actual_payload = master_splinter_mock.stubs(:made_a_funny).with(actual_payload).returns('made a funny should be called')
      @made_a_funny_was_called_with_test_payload = master_splinter_mock.stubs(:made_a_funny).with(test_payload).returns('made a funny should not be called')
      @ninja_dance_was_called = master_splinter_mock.stubs(:ninja_dance).returns('ninja dance should not be called')

      stub_request(:get, "http://api.census.gov/data/2014/acs1/variables.json").
        with(headers: {'Accept' => 'application/json'}).
        to_return(:status => 200, :body => actual_payload)

      @test_examples = TestExamples.new(master_splinter_mock)
      @test_examples.go_ninja_go_ninja_go test_payload
    end

    it 'Should call the API for the actual data once' do
      assert_requested :get, "http://api.census.gov/data/2014/acs1/variables.json", times: 1
    end

    it 'Should call made a funny with the actual payload once' do
      @made_a_funny_was_called_with_actual_payload.once
    end

    it 'Should not call made a funny with the test payload' do
      @made_a_funny_was_called_with_test_payload.never
    end

    it 'Should not call ninja dance' do
      @ninja_dance_was_called.never
    end
  end
end
