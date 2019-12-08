class EnjuInventory::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_setup_files
    inject_into_file 'app/controllers/application_controller.rb',
      "  include EnjuInventory::Controller\n", after: "EnjuLibrary::Controller\n"
    append_to_file("app/models/user.rb") do
      <<"EOS"
Item.include(EnjuInventory::EnjuItem)
EOS
    end
  end
end
