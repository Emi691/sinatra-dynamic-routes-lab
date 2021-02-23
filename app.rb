require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here
  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @number = params[:number].to_i
    @square = @number * @number
    "#{@square.to_s}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    @array = []
    @number.times do @array << @phrase end
    "#{@array.join(" ")}"    
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @array = params.map{|key,word| word}
    @array.pop
    @array << "#{params[:word5]}."
    "#{@array.join(" ")}"
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i

    if @operation == "add"
        @ans = @number1 + @number2
        "#{@ans.to_s}"
    elsif @operation == "subtract"
        @ans = @number1 - @number2
        "#{@ans.to_s}"
    elsif @operation == "multiply"
      @ans = @number1 * @number2
      "#{@ans.to_s}"
    elsif @operation == "divide"
      @ans = @number1 / @number2
      "#{@ans.to_s}"
    end
  end

end