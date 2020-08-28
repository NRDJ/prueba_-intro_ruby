require_relative 'request'

api_key = "jH7DnaKeIead5sbFdADQf3etILljSoh0QfyX9svD"
link = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key="

def get_rover_photos(url, key)
    full_address = url+key
    info_photos = request(full_address)
end

def build_web_page(photo_data)

    head = 
    "<!doctype html>
    <html lang='en'>
        <head>
            <title>Mars Rover Photos</title>
            <!-- Required meta tags -->
            <meta charset='utf-8'>
            <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
                <!-- Bootstrap CSS -->
            <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MDdH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
        </head>
        <body>
            <h1 class='text-center'>Mars Rovers Photos</h1>
            <ul>\n"

    body = ''
    photo_data.each do |photos, info|
        puts "Key: #{photos}"
        info.each_with_index do |item,index|
            body += "\t\t\t\t<li><img src='#{item['img_src']}'></li>\n"
        end
    end

    foot = "\t\t\t</ul>
            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH8abtTE1Pi6jizo' crossorigin='anonymous'></script>
            <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js' integrity='sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1' crossorigin='anonymous'></script>
            <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js' integrity='sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIMB07jRM' crossorigin='anonymous'></script>
        </body>
    </html>"

    page = head + body + foot
end


photo_data = get_rover_photos(link, api_key)
File.write('index.html', build_web_page(photo_data))


