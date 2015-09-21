defmodule Bowling do

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



  def get_score({'X'}, [_first, '/' | _rest_of_score]) do
    20
  end

  def get_score({'X'}, ['X', 'X' | _rest_of_score]) do
    30
  end

  def get_score({'X'}, ['X', roll | _rest_of_score]) do
    20 + roll
  end

  def get_score({'X'}, [first, second | _rest_of_score]) do
    10 + first + second
  end


  def get_score({first, '/'}, ['X' | _rest_of_score]) do
    20
  end

  def get_score({first, '/'}, rest_of_score) do
    next_roll = List.first(rest_of_score)
    10 + next_roll
  end

  def get_score({first, second}) do
    first + second
  end

end
