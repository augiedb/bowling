defmodule Bowling do

  def final_score(line) do
    do_final_score(line, 0, 1)
  end

  def do_final_score(['X', 'X', 'X'], score, 10) do
    score + 30 
  end

  def do_final_score(['X', _roll, '/'], score, 10) do
    score + 20 
  end
  
  def do_final_score(['X', roll1, roll2], score, 10) do
    score + 10 + roll1 + roll2 
  end

  def do_final_score(line, score, frame) do
    [this_frame, new_line] = line |> get_frame
    new_score = get_score([this_frame, new_line ])
IO.puts 'FRAME! #{frame}'
    do_final_score(new_line, new_score + score, frame + 1)
  end

  def get_frame(['X' | tail]) do
    [{'X'}, tail]
  end

  def get_frame([first, '/' | tail]) do
    [{first, '\/'}, tail]
  end
 
  def get_frame([first, second | tail]) do
    [{first, second}, tail] 
  end



  def get_next_frame(['X' | _tail]) do
    {'X'}
  end

  def get_next_frame([first, '/' | _tail]) do
    {first, '\/'}
  end
 
  def get_next_frame([first, second | _tail]) do
    {first, second}
  end


  def get_score([{'X'}, [_first, '/' | _rest_of_score]]) do
    20
  end

  def get_score([{'X'}, ['X', 'X' | _rest_of_score]]) do
    30
  end

  def get_score([{'X'}, ['X', roll | _rest_of_score]]) do
    20 + roll
  end

  def get_score([{'X'}, [first, second | _rest_of_score]]) do
    10 + first + second
  end


  def get_score([{first, '/'}, ['X' | _rest_of_score]]) do
    20
  end

  def get_score([{first, '/'}, rest_of_score]) do
    next_roll = List.first(rest_of_score)
    10 + next_roll
  end

  def get_score([{first, second}, _rest_of_score]) do
    first + second
  end

end
