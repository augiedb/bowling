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

end
