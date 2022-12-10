require 'rspec'
  require './10'
  require 'pry'
  require 'pry-nav'

  RSpec.describe 'Day 10' do
    subject { Day10.new(file) }
    
    describe 'Part 1' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(13140)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          expect(subject.part_one).to eq(13860)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          subject.part_two
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          subject.part_two
        end
      end
    end
  end
  