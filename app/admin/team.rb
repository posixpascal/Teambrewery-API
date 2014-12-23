ActiveAdmin.register Team do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column "Name", :name
    column "Pokemon" do |team|
      s = []
      team.pokemons.each do |p|
        s.push(image_tag p.sprite.url, {height: "30px"}) unless p.nil?
      end
      raw(s.join(""))
    end
    column "User" do |team|
      if team.user.nil?
        "Private"
      else
        team.user
      end
    end
    actions
  end

end
