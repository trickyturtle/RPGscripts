#This is all garbage and doesn't work
Shoes.app {
    stack {
      flow{
        stack{
          para "Name: #{character.name}"
          para "Occupation: #{character.occupation}"
          para "Age/Sex: #{character.age}/#{character.sex}"
          para "Residence: #{character.name}"
          para "Birthplace: #{character.name}"

        }

        button "A bed of clams"
        para strong("Q."), " Are you beginning to grasp hold of Shoes?"
        title "A Question"
        @push = button "Push me"
    @note = para "Nothing pushed so far"
    @push.click {
      @note.replace "Aha! Click!"
    }
    flow do
        edit_line
        button "OK"
      end
      }
      flow{

      }
      flow{

      }
      flow{

      }
    }
  }
