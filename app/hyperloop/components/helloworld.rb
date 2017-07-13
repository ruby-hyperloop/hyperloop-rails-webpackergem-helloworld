
  class Helloworld < Hyperloop::Component

    state show_field: false
    state field_value: ""

    render(DIV) do
      show_button
      DIV(class: 'formdiv') do
        show_input
        H1 { "#{state.field_value}" }
      end if state.show_field
    end

    def show_button
      BUTTON(class: 'btn btn-info') do
        state.show_field ? "Click to hide HelloWorld input field" : "Click to show HelloWorld input field"
      end.on(:click) { mutate.show_field !state.show_field }
    end

    def show_input

      H4 do
        span{'Please type '}
        span.colored {'Hello World'}
        span{' in the input field below :'}
        br {}
        span{'Or anything you want (^̮^)'}
      end

      INPUT(type: :text, class: 'form-control').on(:change) do |e|
        state.field_value! e.target.value
      end
    end

    def show_text
      H1 { "#{state.field_value}" }
    end

  end

