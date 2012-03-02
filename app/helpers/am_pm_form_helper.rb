module AmPmFormHelper
  #pass start:Fixnum in the options hash to set the first drop down selection
  def am_pm_hour_select(object, method, options = {}, html_options = {})
    select_options = [ ["I'm here", 5.5], ["6am", 6], ["7am", 7], ["8am", 8], ["9am", 9], ["10am", 10], ["11am", 11], ["12pm", 12], ["1pm", 13], ["2pm", 14], ["3pm", 15], ["4pm", 16], ["5pm", 17], ["6pm", 18], ["7pm", 19], ["8pm", 20], ["9pm", 21], ["10pm", 22], ["11pm", 23], ["12am", 24], ["1am", 1], ["2am", 2], ["3am", 3], ["4am",4 ], ["5am", 5]]
    unless options[:start].nil?
      shift_if_needed = Proc.new{|hour, start| hour<start ? hour+24 : hour}
      select_options.sort!{|x, y| shift_if_needed.call(x.last,options[:start]) <=> shift_if_needed.call(y.last, options[:start]) }
    end

    object.select(method, select_options, options = {}, html_options = {})
  end
end