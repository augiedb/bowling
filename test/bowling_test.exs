defmodule BowlingTest do
  use ExUnit.Case
  doctest Bowling

  test "Get Frame" do
    scoreboard = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 0, 0]
    assert Bowling.get_frame(scoreboard) == [{1, 1}, [2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,0,0]]
    scoreboard = [2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 0, 0]
    assert Bowling.get_frame(scoreboard) == [{2,2}, [3,3,4,4,5,5,6,6,7,7,8,8,9,9,0,0]]
  end

  test "Get Frames for Strikes and Spares" do
    assert Bowling.get_frame(['X', 'X', 'X', 1, 2, 3, 4]) == [{'X'}, ['X','X',1,2,3,4]] 
    assert Bowling.get_frame([9, '/', 'X', 1, 2, 3, 4]) == [{9, '/'}, ['X',1,2,3,4]] 

  end

  test "Get Next Frame for Scoring Sake" do
    assert Bowling.get_next_frame([1,1,2,2,3,3]) == {1,1}
    assert Bowling.get_next_frame(['X',1,1,2,2,3,3]) == {'X'}
    assert Bowling.get_next_frame([9, '/',1,1,2,2,3,3]) == {9, '/'}
  end

  test "Get Score for Frame" do
    assert Bowling.get_score([{0,0}, [1,1,2,2,3,3,4,4]]) == 0
    assert Bowling.get_score([{1,7}, [1,1,2,2,3,3,4,4]]) == 8 
  end

  test "Get Score for Spare Frame" do
    assert Bowling.get_score([{9, '/'}, [1,1,2,2,3,3]]) == 11
    assert Bowling.get_score([{9, '/'}, ['X', 1, 1, 2, 2, 3, 3]]) == 20
  end

  test "Get Score for Strike Frame" do
    assert Bowling.get_score([{'X'}, [1,1,2,2,3,3]]) == 12
    assert Bowling.get_score([{'X'}, [9, '/', 1, 1]]) == 20
    assert Bowling.get_score([{'X'}, ['X', 9, '/', 1, 1]]) == 29
    assert Bowling.get_score([{'X'}, ['X', 'X', 9, '/', 1, 1]]) == 30
  end

  test "Perfect Game" do
   scoreboard = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
   assert Bowling.final_score(scoreboard) == 300
  end
  
  test "Strike to start the tenth" do
   scoreboard = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 9, '/']
   assert Bowling.final_score(scoreboard) == 289
   scoreboard = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 1, 1]
   assert Bowling.final_score(scoreboard) == 273
   scoreboard = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 0, 1]
   assert Bowling.final_score(scoreboard) == 271
  end


end
