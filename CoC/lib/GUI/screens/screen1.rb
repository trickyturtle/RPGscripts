

class Screen1 < Shoes
  url '/',      :index
  url '/twain', :twain
  url '/kv',    :vonnegut

  def index
    para "books:",
      link("MT\n", :click => "/twain"),
      link("KV", :click => "/kv")
  end
  def twain
    para "huck.\n",
      link("back", :click => "/")
  end
  def vonnegut
    para "cats",
      link("back", :click => "/")
  end
  def test
    @screen1 = stack margin: 10 do
      flow do
        para "Name"
        edit_line
        button "Generate" do
          #TODO generate name
        end
      end
      flow do
        para "Player"
        edit_line
      end
      flow do
        para "Occupation"
        edit_line
      end
      flow do
        para "Age"
        edit_line
        para "Sex"
        edit_line
      end
      flow do
        para "Residence"
        edit_line
      end
      flow do
        para "BirthPlace"
        edit_line
      end
      button "Save" do
        #TODO save
      end
    end
  end
end
Shoes.app :width => 500, :height => 500
