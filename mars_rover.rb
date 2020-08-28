require_relative 'request'

api_key = "jH7DnaKeIead5sbFdADQf3etILljSoh0QfyX9svD"
link = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key="

def get_rover_photos(url, key)
    full_address = url+key
    info_photos = request(full_address)
end

def build_web_page(photo_data)

    photo_data.each do |photos, info|
        puts "Key: #{photos}"
        info.each_with_index do |item,index|
            puts "Image: #{item['img_src']}" if index == 0
        #     body +=             
        #     "\n\t\t\t<ul>    
        #     <li><img src='#{item['img_src']}/398380645PRCLF0030000CCAM04010L1.PNG'></li>    
        #     <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li>
        # </ul>"
        end
    end
end


photo_data = get_rover_photos(link, api_key)
build_web_page(photo_data)
# puts build_web_page


# def show_rover(url, api_key)

#     data = get_rover_photos(url, api_key) 
#     build_web_page(data)
# end
