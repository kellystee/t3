require 'spec_helper'

describe T3::Player::Human do
  let(:gamepiece)   { "x"                                                        }
  let(:gamepieces)  { ["x","o"]                                                  }
  let(:board)       { T3::Board.new(3)                                           }
  let(:game_rules)  { T3::GameRules.new(board)                                   }
  let(:console_io)  { T3::ConsoleIo.new                                          }
  let(:subject)     { T3::Player::Human.new(gamepiece,"o",game_rules,console_io) }

  it 'has a piece' do
    T3::Player::Human.new(gamepiece,"o",game_rules,console_io).piece.should == gamepiece
  end

  it "initializes the console_io, configurations and game" do
    subject.console_io.should be_kind_of(T3::ConsoleIo)
  end

  it "is a human" do
    subject.human? == true
  end

  it 'has a piece' do
    subject.piece.should == "x"
  end

  it "should make a random move from the spaces available" do
    subject.console_io.should_receive(:get).and_return("2")
    subject.get_move(board,gamepieces).should == 2
  end

end
