
rails g controller pages homepage about contact


rails g model Skill title "percent_utilized:decimal{12,5}"

rails g resource Portfolio title sub_title body:text main_image:text thumb_image:text


custom_view_tool gem created

building and publishing a gem

bundle gem gemname

gem build gemname.gemspec
rake release
